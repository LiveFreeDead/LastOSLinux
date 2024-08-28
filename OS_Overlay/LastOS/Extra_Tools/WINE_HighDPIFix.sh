#!/usr/bin/bash

#Sets to 240DPI in winecfg, default is 0x60, 2k screen uses 0x90, 4k screen uses 0xF0
#wine reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v LogPixels /t REG_DWORD /d 0x60 /f
#wine reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v LogPixels /t REG_DWORD /d 0x90 /f
wine reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v LogPixels /t REG_DWORD /d 0xF0 /f
