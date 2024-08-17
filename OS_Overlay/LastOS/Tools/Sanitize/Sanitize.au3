#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=ssApp.ico
#AutoIt3Wrapper_Outfile=Sanitize.exe
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Comment=Sanitize Cleaner By LastOS
#AutoIt3Wrapper_Res_Description=Sanitize Cleaner By LastOS
#AutoIt3Wrapper_Res_Fileversion=1.24.8.14
#AutoIt3Wrapper_Res_LegalCopyright=LastOS
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <Misc.au3>

;Opt('TrayIconHide', 1)
TraySetState(2)

$FIn = "" ;File In
$FOut = "" ;File Out


$TempName = ""
Dim $aSpace[3]
$digits = 3
For $i = 1 To $digits
    $aSpace[0] = Chr(Random(65, 90, 1)) ;A-Z
    $aSpace[1] = Chr(Random(97, 122, 1)) ;a-z
    $aSpace[2] = Chr(Random(48, 57, 1)) ;0-9
    $TempName &= $aSpace[Random(0, 2, 1)]
Next

; Process the given Filenames here
If FileExists($CmdLineRaw) Then ;If the Sent File has spaces
	$FIn = $CmdLineRaw
	$FOut = CleanFileName($FIn)
	;MsgBox(0,"Test", $Fin & " -> " & $FOut)
	If StringLen($FOut) >= 1 Then
		;MsgBox(0, "Test", $FIn & " -> " & $FOut)
		If IsFolder($FIn) Then
			DirMove($FIn, $FOut & "_" & $TempName, 1)
			If Not FileExists($FOut) Then ;Only move/rename if destination name doesn't already exist.
				DirMove($FOut & "_" & $TempName, $FOut, 1)
			Else ;Does Exist change back
				DirMove($FOut & "_" & $TempName, $FIn, 1)
			EndIf
		Else
			FileMove($FIn, $FOut & "_" & $TempName, 1)
			If Not FileExists($FOut) Then ;Only move/rename if destination name doesn't already exist.
				FileMove($FOut & "_" & $TempName, $FOut, 1)
			Else ; Does Exist change back
				FileMove($FOut & "_" & $TempName, $FIn, 1)
			EndIf
		EndIf
	EndIf
Else
	If $CmdLine[0] >= 1 Then
		For $Cnt = 1 To $CmdLine[0]
			$FIn = $CmdLine[$Cnt]
			$FOut = CleanFileName($FIn)
			If StringLen($FOut) >= 1 Then
				;MsgBox(0, "Test", $FIn & " -> " & $FOut)
				If IsFolder($FIn) Then
					DirMove($FIn, $FOut & "_" & $TempName, 1)
					If Not FileExists($FOut) Then ;Only move/rename if destination name doesn't already exist.
						DirMove($FOut & "_" & $TempName, $FOut, 1)
					Else ;Does Exist change back
						DirMove($FOut & "_" & $TempName, $FIn, 1)
					EndIf
				Else
					FileMove($FIn, $FOut & "_" & $TempName, 1)
					If Not FileExists($FOut) Then ;Only move/rename if destination name doesn't already exist.
						FileMove($FOut & "_" & $TempName, $FOut, 1)
					Else ; Does Exist change back
						FileMove($FOut & "_" & $TempName, $FIn, 1)
					EndIf
				EndIf
			EndIf
		Next
	Else
		;Help
		MsgBox(0, "Sanitize Help", "Simply drag and drop a file on to this .exe or use the SendTo/Context menu on the file you wish to clean.")
		Exit
		;Test
		$FIn = "C:\Program Files\1-3-3-8.com_Test.Name.s01e06.hdtv.xvid-asap((xvid)(4)).avi"
		$FIn = "C:\Program Files\Name.Of.Movie.1080p.WebDL.CatPoo.avi"
		$FOut = CleanFileName($FIn)
		MsgBox(0, "Test", $FIn & " -> " & $FOut)
	EndIf
EndIf
Exit
;########################################### Main Function Below ##############################################

Func CleanFileName($InF)
	$EXT = ""
	$Path = ""
	$NF = $InF

	;Get Path and Extension out of name
	If StringInStr($InF, "\") >= 1 Then
		$Path = StringLeft($InF, StringInStr($InF, "\", 0, -1, StringLen($InF)))
		$NF = StringRight($InF, StringLen($InF) - StringLen($Path))
	EndIf
	If StringInStr($NF, ".") >= 1 Then
		$EXT = StringLower(StringRight($NF, (StringLen($NF) - StringInStr($NF, ".", 0, -1, StringLen($NF)) + 1)))
		$Attrib = FileGetAttrib($NF)
		If StringReplace($Attrib,"D","") = $Attrib Then
			$NF = StringLeft($NF, StringLen($NF) - StringLen($EXT)) ;Is A File so remove Extension (leaves on if folder)
		Else
			$EXT = ""
		EndIf
	EndIf

	;Remove Words from Removes.ini 2nd Run Through
	$NF = RemoveWords($NF)

	;Replace Artificial Spaces
	$NF = StringReplace($NF, "_", " ")
	$NF = StringReplace($NF, "~", " ")
	$NF = StringReplace($NF, ".", " ")

	;Space The Spacer
	$NF = StringReplace($NF, "-", " - ")

	;Remove Excess Spaces
	$NF = RemoveInnerSpace($NF)

	;Remove Words from Removes.ini 2nd Run Through
	$NF = RemoveWords($NF)

	;Remove [{(###)}]
	$NF = RemoveNumberBrackets($NF)
	;Remove Excess Spaces
	$NF = RemoveInnerSpace($NF)
	;Remove [{( )}]
	$NF = RemoveEmptyBrackets($NF)
	;Remove Excess Spaces
	$NF = RemoveInnerSpace($NF)
	;Remove Exterior Spaces
	$NF = RemoveOuterSpace($NF)
	;Remove Exterior Spacer's
	$NF = RemoveOuterSpacer($NF)

	;Captalize Text
	$NF = Capitalize($NF)

	;Remove Words from Removes.ini 3nd Run Through (For Reverts to be capitalized)
	$NF = RemoveWords($NF)

	;Remove Exterior Spacer's
	$NF = RemoveOuterSpacer($NF)
	;Remove Excess Spacer's
	$NF = RemoveInnerSpacer($NF)

	;Replace S01E01 to 1x01
	For $Season = 1 To 99
		For $Episode = 1 To 99
			$SS = StringFormat("%02i", $Season)
			$EE = StringFormat("%02i", $Episode)
			$NF = StringReplace($NF, "S" & $SS & "E" & $EE, String($Season) & "x" & $EE)
		Next
	Next

	;Remove Excess Spaces
	$NF = RemoveInnerSpace($NF)

	;The following allows holding ctrl to Crop the selected files at their Season/Episode number (dropping the TV Series Name and just keeping the number and episode names):
	;Allow pressing Pause to remove the - separators.
	$dll = DllOpen("user32.dll")
	If _IsPressed("11", $dll) Then ; Ctrl is Down
		$IsSeries=False
		For $Season = 1 To 99
			For $Episode = 1 To 99
				$SS = StringFormat("%02i", $Season)
				$EE = StringFormat("%02i", $Episode)
				$TLen = StringInStr($NF, String($Season) & "x" & $EE)
				If $TLen >= 1 Then
					$IsSeries = True
					If _IsPressed("10", $dll) Then ; Shift is Down (to allow removal of all but Series Name and Episode Number)
						$NF = StringLeft($NF,  $TLen - 1) & String($Season) & "x" & $EE
					Else
						$NF = StringRight($NF, (StringLen($NF) - $TLen) + 1)
					EndIf
				EndIf
			Next
		Next
		If $IsSeries=False Then ;If not a TV show and Ctrl is down then Strip to 1080p etc
				$TLen = 0
				$TLen = StringInStr($NF, "80p")
				If $TLen <= 0 Then $TLen = StringInStr($NF, "20p")
				If $TLen >= 1 Then
					$NF = StringLeft($NF,  $TLen + 2)
				EndIf
		EndIf
	EndIf
	If _IsPressed("13", $dll) Then ; Pause is Down
		$NF = StringReplace($NF, " - ", " ")
	EndIf
	If _IsPressed("91", $dll) Then ; ScrollLock is Down
		$NF = StringRegExpReplace($NF, '(\d{4})',  '($1)' )
		$NF = StringReplace($NF, "((", "(")
		$NF = StringReplace($NF, "))", ")")
	EndIf
	DllClose($dll)


	Return $Path & $NF & $EXT
EndFunc   ;==>CleanFileName

;######################## SUB FUNCTIONS BELOW ###########################

Func RemoveWords($NF)
	;Remove Words from Removes.ini

	Local $Removal[9999]
	Local $Cnt = 0
	Local $Revert = False
	Local $RevWord[2]
	$file = FileOpen(@WindowsDir & "\Removes.ini", 0)
	If $file = -1 Then
	$file = FileOpen(@ScriptDir & "\Removes.ini", 0)
	EndIf

	;$file = FileOpen(@WindowsDir & "\Removes.ini", 0)
	If $file = -1 Then
		MsgBox(0, "Error", "Unable to open " & "\Removes.ini")
		Exit
	Else
		While 1
			$line = FileReadLine($file)
			If @error = -1 Then ExitLoop
			$Cnt = $Cnt + 1
			$Removal[$Cnt] = $line ;StringStripWS($line,3)
		WEnd
	EndIf
	FileClose($file)


	$NF = " " &  $NF & " " ;Space outter edge so word replace will replace start and end words if they exist in the list.

	If $Cnt > 0 Then
		For $I = 1 To $Cnt
			$Rem = $Removal[$I]
			$Rem = StringReplace($Rem, "*", "")
			If StringInStr($Removal[$I],"\") Then ;Revert word
				$Rem = StringReplace($Rem, "\", "")
				$RevWord = StringSplit($Rem,"|")
				$NF = StringReplace($NF, $RevWord[1], $RevWord[2]) ; * Specified
			Else ;Not Reverted, treat normal
				;Make sure it's the start or end or a whole word, not in the middle of a word. Except in Brackets
				;Unless the word includes a * then it can be anywhere.
				If StringLeft($NF, StringLen($Rem)) = $Rem Then
					$NF = StringRight($NF, StringLen($NF) - StringLen($Rem)) ; Hard Left
				EndIf
				If StringRight($NF, StringLen($Rem)) = $Rem Then
					$NF = StringLeft($NF, StringLen($NF) - StringLen($Rem)) ; Hard Right
				EndIf
				$NF = StringReplace($NF, " " & $Rem & " ", " ") ; Space Before & After, Combine to require both a space on the left and the right, just so it stopped removing ts from everything (eg elements = elemen)
				;$NF = StringReplace($NF,  & $Rem, " ") ; Space Before
				;$NF = StringReplace($NF, $Rem & " ", " ") ; Space After
				$NF = StringReplace($NF, "(" & $Rem & ")", "") ; Brackets
				$NF = StringReplace($NF, "[" & $Rem & "]", "") ; Brackets
				$NF = StringReplace($NF, "{" & $Rem & "}", "") ; Brackets
				If StringInStr($Removal[$I], "*") >= 1 Then $NF = StringReplace($NF, $Rem, " ") ; * Specified
			EndIf
		Next
	EndIf
	Return $NF
EndFunc   ;==>RemoveWords
Func RemoveNumberBrackets($InF)
	For $I = 1 To 99
		$InF = StringReplace($InF, "(" & $I & ")", "")
		$InF = StringReplace($InF, "[" & $I & "]", "")
		$InF = StringReplace($InF, "{" & $I & "}", "")
	Next
	Return $InF
EndFunc   ;==>RemoveNumberBrackets

Func RemoveEmptyBrackets($InF)
	$OInF = $InF
	While 1
		$I = ""
		$InF = StringReplace($InF, "(" & $I & ")", "")
		$InF = StringReplace($InF, "[" & $I & "]", "")
		$InF = StringReplace($InF, "{" & $I & "}", "")
		$I = " "
		$InF = StringReplace($InF, "(" & $I & ")", "")
		$InF = StringReplace($InF, "[" & $I & "]", "")
		$InF = StringReplace($InF, "{" & $I & "}", "")
		If StringLen($OInF) = StringLen($InF) Then ExitLoop
		$OInF = $InF
	WEnd
	Return $InF
EndFunc   ;==>RemoveEmptyBrackets

Func Capitalize($InF)
	$Out = StringUpper(StringLeft($InF, 1))
	For $I = 2 To StringLen($InF)
		If StringMid($InF, $I - 1, 1) = " " Or StringMid($InF, $I - 1, 1) = "(" Or StringMid($InF, $I - 1, 1) = "[" Then ;Allow capital letters inside brackets
			$Out = $Out & StringUpper(StringMid($InF, $I, 1))
		Else
			$Out = $Out & StringLower(StringMid($InF, $I, 1))
		EndIf
	Next
	Return $Out
EndFunc   ;==>Capitalize

Func RemoveInnerSpacer($InF)
	$NN = ""
	While 1
		$NN = StringReplace($InF, "- -", "-")
		If StringLen($InF) = StringLen($NN) Then
			ExitLoop
		EndIf
		$InF = $NN
	WEnd
	Return $InF
EndFunc   ;==>RemoveInnerSpacer

Func RemoveInnerSpace($InF)
	;Remove Excess Spaces
	$NN = ""
	While 1
		$NN = StringReplace($InF, "  ", " ")
		If StringLen($InF) = StringLen($NN) Then
			ExitLoop
		EndIf
		$InF = $NN
	WEnd
	Return $InF
EndFunc   ;==>RemoveInnerSpace

Func RemoveOuterSpace($InF)
	While StringLeft($InF, 1) = " "
		$InF = StringRight($InF, StringLen($InF) - 1)
	WEnd
	While StringRight($InF, 1) = " "
		$InF = StringLeft($InF, StringLen($InF) - 1)
	WEnd
	Return $InF
EndFunc   ;==>RemoveOuterSpace

Func RemoveOuterSpacer($InF)
	While StringLeft($InF, 2) = " -" Or StringLeft($InF, 1) = "-"
		$InF = StringRight($InF, StringLen($InF) - 1)
	WEnd
	While StringRight($InF, 2) = "- " Or StringRight($InF, 1) = "-"
		$InF = StringLeft($InF, StringLen($InF) - 1)
	WEnd
	$InF = RemoveOuterSpace($InF) ;Keep Excess edge spacing down
	Return $InF
EndFunc   ;==>RemoveOuterSpacer

Func IsFolder($Path)
	If StringInStr(FileGetAttrib($Path), "D") Then Return 1
	Return 0
EndFunc   ;==>IsFolder