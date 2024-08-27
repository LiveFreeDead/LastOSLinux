LastOSLinux is a build using Penguins-Eggs a remastering tool that captures your currently running OS to share and install on other hardware. It is based on Linux Mint v22 and is fully compatible with it's updates and future upgrades, this version is supported until 2029 and should continue working after too.

Passwords:
User: live Password: live
User: root Paddword: root
Do NOT ever use " " (space) as a password it breaks things, you can use single letters or numbers in LastOSLinux

Issues:------

* This OS works much better on real hardware.

*VirtualBox v7.0.20 and below Must be installed with 128mb of VRam and 3D Acceleration disabled (until the Guest Addition Tools get installed) you can not run LastOSStore or Launcher, unless you install the Guest Addition Tools and then enable 3D Acceleration once you shut the VM down.

* If the Update Shield is red you need to open it and press "Refresh" (With internet connected). It defaults to the Australian Servers, you can change to a closer one if wanted.

* If WINE is tiny on your 4k screen you can run /LastOS/Tools/WINE_HighDPIFix.sh to make it bigger, you can also manually open "Configure Wine" Tool from the Main Menu and in the Graphics Tab, slide the ScreenResolution up until it looks right. This make still cause apps to redraw bigger than expected or cut off, you can read the /LastOS/WineDPI-Alternative.txt to see a method that worked for someone else, or you can even change the screen resolution before you run your Wine app if it's only temporary.

* If you don't want Chrome to ask for a password each time, don't type in any password and accept the warning, this will let you run it without having to type in a keyring password every time, if you forget to use an empty password you can follow these steps:
1. Close Chrome
2. Navigate to your Home folder in file manager and displayed hidden folders with Ctrl+H
3. Navigate to .local/share/keyrings/
4. Deleted all files with ".keyring" file ending.

* By default I changed Linux Mint from holding Alt and dragging a window position, to holding Super (Windows) key to move windows.

* Following on from above, if you hold Alt when you drag a file or folder, it'll bring up a menu asking if you want to move, copy or link to the location you drop it. Ctrl (Copy) and Shift (Move) offer move or copy shown on the mouse cursor as + for copy, arrow for move.

Disable ToolTips in Photoshop to stop the annoying ToolTip bug, It's in the Tools section of Edit - Preferences now.



-------------

In Terminal you don't use Ctrl + C/V to copy and paste, it's actually Ctrl + Shift + C/V this is because they are Linux shortcut that have been used since 1972, so you will have to learn to hold shift when working with the terminal to copy and paste. Home and End also dont work as expected, so you have to cursor to where you want or use the mouse to select things. This is all a learning curve, but once you get used to it, it's not so bad.

Holding Shift of system boot will open the GRUB menu to pick/repair booting.

To close Plank Dock, hold Ctrl and Right click the dock.

The date format I like is %l:%M %p = 3:21 PM, if you use %H it's 24h time and %I has leading = 03

--- Introduction to the GUI ---

Cinnamon - The name of the whole Desktop Experience (others are KDE, Gnome, XCFE)
Nemo - The name of the file manager (Windows Explorer)
Panels - Like the Taskbar (Start Menu/ Clock/ Running Applications etc)
Spices - Things that can be added to your panels on the desktop
Actions - Context menu (Right Click menu)

Other Terminology:

LastOS - The team's name behind your modded OS, Wanting to be the LastOS you'll ever need
LastOSLinux Store - The tool used to install apps and games from the CDRom/USB
LastOSLinux Launcher - This will let you see the Linux and Windows games you have installed using the store and launch them.
SetupS - Setup Silent (This is LastOS's very own Silent Setup for Windows Apps)
ssApp - A single app that will install silently onto your operating system
ppApp - This is the same as a ssApp but will extract to the ppApps folder and not require installing, it will make shortcuts etc
ppGame - This is the same as ppApps, but for Games, not apps
LLApp - This is a Linux app that is able to be installed to your users folder instead of system wide.
LLGame - This is a Linux Game that is able to be installed to your users folder instead of system wide. It is able to launch these games from LastOSLinux Launcher.
WINE - This will emulate (:P) windows API's meaning you can run Windows Apps and Games from their .EXE files as they would run in windows

-------------------------------------------------------------------------------
--- Included items and what they are ---

Abiword - Word Processor (No DOCX support)

Accessibility - Tools to help users with low vision, mouse and keryboard control requirements

Account details - Change your users Picture, Name and Password

Actions - Download and choose your context menu items (Right Click menu)

Advanced Network Configuration - Set your IP Addresses, proxy

AIMP - WINE Music Player

All-SetupS-tech Regenerator (all drives) - WINE This will recreate all the registry, appdata etc for ppApps/ppGames and shortcuts for ssApps etc

Applets - Download and Install/Enable things for your Panels in Cinnamon

Archive Manager - Similar function to 7Zip or WinRAR, more basic, but does the job

Asunder CD Ripper - Backup your songs to your computer to play without the cd

Audacity - Music and Sound editor

Backgrounds - Change your Wallpaper or change it to a SlideShow

Backup Tool - Allows you to quickly backup your Users files and any applicaons you've installed yourself using Mint's Application Store

BleachBit - CCleaner Alternative

Bluetooth Manager - Manage your devices and send files to Bluetooth

Brave Web Browser - A Version of Chromium (Chrome) with built in Ad Block

Browse C: Drive - Opens Nemo to the C:\ drive of your WINE installation (Also available from the Side Panel of Nemo)

Calculator - 1+1=

Calendar - A personal calendar you can add appointments etc to

CatFish File Search - WizFile, Search Everything type of app to find files or their content (Nemo has one built in also)

Celluloid - Media Player Classic to play most media formats

Character Map - Same as on Windows

Cherrytree - hierarchical note taking application, featuring rich text, syntax highlighting, images handling, hyperlinks etc

Clean StartMenu only - This will sort SetupS installed Apps and Games shortcuts (if you uninstall or remove any ppApps/Games

Color - Color Profiles (Basic)

Configure Wine - Allows you to set the theme, variables etc for the Wine layer in your Linux

Console RAR manual - Explains how to use Linux's RAR support from the Terminal

CPU-X - Is the same report of your CPU hardware like with CPU-Z in windows

Darktable - Photo Adjuster with RAW support

Date & Time - Change your region, timezone, Auto Sync and change 24h time etc

DeaDBeef - WinAMP style music player

Desklets - Install and Download Desktop Widgets (Conky but not advanced)

Desktop - Change how your Desktop Icons are shown, also which monitors they are on

Disks - Show any Drives or Mounts you have on your system

Disk Usage Analyser - TreeSize like tool that shows a visual of your Disks contents

Display - Setup your Monitor(s) Res, Refresh, Position, Scaling and Rotation 

Document Scanner - Scan in Documents or Photos from your scanner

Document Viewer - Calibre type app for reading PDF, ePub etc

Drawing - Paint for Linux

Driver Manager - Setup any Hardware you have with the Non Free Drivers (Graphics, WiFi etc)

Effects - Configure any of the Windows and Menu effects for Cinnamon

Elastomania - WINE Game, Motobike Stunt Course

Extensions - Download and Install Cinnamon Extensions and more Effects

File Renamer - Advanced Renamer but with basic options and RegEx support for advanced renaming

Files - Nemo window (Explorer)

Filezilla - FTP Download/Upload tool

Firefox Web Browser - Browse the Internet, this is the only browser that doesn't request a wallet password to be set

Firewall Configuration - Manually control what internet traffic does and which apps have any access

FlameShot - Screen Capture tool

Font Selection - Change the Desktop fonts for Windows, folders, apps etc (you can control which fonts the system uses)

Games Launcher - WINE This is a LastOS tool that will list any ppGames you have installed and let you read about them before you run them

Geany - IDE Text Editor with lots of plugins available

General - Cinnamon Settings, Renderer, Timer when Loggin in/out, restart if detected crash

Gestures - Touchpad/Tablet Settings to do actions with finger gestures

Google Chrome - The Web Browser

GParted - Partition Wizard like tool, If your going to resize partitions use Partition Wizard, much more reliable/safe

Graphics Tablet - Configure Pen Support if found hardware

Grub Customizer - Chnage the Order and Timer of your boot menu, handy for Dual Boot machines

Hot Corners - Make the corners of the desktop do actions

HTop - Process Monitor but Terminal Based

Hypnotix - Free TV Streams

Image Viewer - Irfanview but different

Input Method - Allows writing non english character if needed

Install Steam - This is the best way to install steam on Mint Linux

Irfanview - WINE Like Irfanview :) Picture Viewer

jstest-gtk - Joystick Check, test your gamepads buttons and sticks etc

Kbreakout - Game, Bat and Ball to break bricks

KDE Connect - Connect your phone to your Linux

Keyboard - Set the delays for repeat, Shortcut Keys and change layouts

Kid3 - Edit ID3 tags in your Songs/mp3's

Kmahjongg - Game, Mahjongg

KMines - Game, Minesweeper

KPatience - Game, Card Games

Ksudoku - Game, Sodoku Number Grid

Languages - Change your OS's set language

LastOSLinux Launcher - This will show all the games you have installed with LLApp or from the LastOSLinux Store

LastOSLinux Store - Install more applications from an online or local repository

Lbreakout2 - Game, Bat and Ball to break bricks

Library - Display your recent and Favourited Documents

LibreOffice - Microsoft Office but free and less features, also less virus and dangerous scripts too

LLApp Editor - Use this to Package new Apps and Game to use with the LastOSLinux Store

Login Window - Change the background of your Login screen nd other settings

Logs - This has me stumped :P But I think it shows anything thats ever been logged on your system, including error logs etc

Lutris - This consolidates all your games into one launcher, including from GOG, Steam, WINE etc, has so many settings to fix games

Matrix - Mint chat group (and can have other groups), quite handy to chat to other people, offer support etc

MediaInfo - Shows you what type of media/compression your file has

Meld - Compare file content or folders and compare differences

Mouse and Touchpad - Change left/right button, speed, cursor size, scroll direction etc

Network - Manage your Network connections and see your IP address etc

Notepad - WINE's notepad tool

Notepadqq - Notepad++ type tool, dark mode, syntax high lighting, bracket tracing, tabs

Notes - Stickynotes for your screen, but leave less residue behind when you remove them, good for passwords and shopping lists

Notifications - Configure your Notifications and Popup message timeout's etc

OBS Studio - AIO tool for Capturing Video/Mic/Game play etc, used by many people who stream online

Okular - PDF Viewer/editor

onboard - OSK, on screen keyboard

Online Accounts - If you need features of Google or Microsoft or a few others, or if you just want to share your Data with them, log in

Panel - Change settings on your desktop Panel(s)

Passwords and Keys - I think this stores your passwords and keys

PDF Arranger - Merge or split pdf documents and rotate, crop and rearrange their pages

Penguins Eggs - This is a shortcut to the tool used to Make a respin/remaster of Linux, it allows LastOSLinux to exist

Pix - Picture Viewer with Folder Browser

Plank - Dock for your taskbar replacement or addition

PlayOnLinux - Used to configure Windows Installers and require Runtimes to install appliactions, uses online database provided by community to automate this task

Power Management - Screen Off, Sleep and Button Actions

Power Statistics - Up Time, AC/Battery

Preferred Applications - Web, Mail, Music, Video, Photos, Word, Spreadsheet,PDF, Source Code etc

Printers - The tool to use if you want to connect or manage the worst hardware you can add to a PC

Privacy - Set if and how long to store recent accessed files lists

Protontricks - Once you setup Steam and configure a game to use Proton, you can then run any game with Protontricks with the settings from that game, enabled a lot of #D Card stuff you can't get with Default WINE

qBittorrent - Torrent downloading app, like windows version

Qpdfview - PDF Viewer

QT5 Settings - Set the QT5 theme and settings to QT designed apps

Rapid Photo Downloader - Import photos from USB/SD or other places into one location

Rhythmbox - Music Player

Remmina - RDP and remote desktop connections

Retext - Basic Markdown Editor

Screensaver - Set how long and if it Locks the PC once activated, other settings for it too

Screenshot - Basic Screenshot tool, but offers Delay

SetupS Control Panel - WINE Change LastOS's SetupS settings to make ssApps/ppApps etc act differently, also offers sorting and regen tools

SetupS Editor - WINE LastOS Tool Make your own Windows based SetupS Apps

Signal Desktop - Messeging Client like WhatsApp

SimpleScreenRecorder - Capture a video of your screen to save/share

Software Manager - App Store

Software Sources - This is where you set your App Store and OS Update Mirror to use, if you pick the closest and fastest Mirror, things will download much faster, this tool can also repair corrupted apt cache etc

Sound - Configure your PC Sound input/output and applications as well as Sound FX

Sound Converter - Convert between sound/song formats

Stacer - System Monitor and Optimizer

Startup Applications - Turn on and off Start up apps

Steam - Games Store, Launcher and Manager, his Proton emultaion layer that make it more compatible with 3D games than WINE is

Synaptic Package Manager - Before software stores, these repositories would let you manage your packages

System Info - About this PC (Windows Properties), OS, Kernel, CPU, RAM, HDD, GFX and Display Server information

System Monitor - Process Manager, I made Ctrl+Alt+Del and Ctrl+Shift+Esc open this as the task manager

System Reports - Helps Maintain your system, access crash reports etc

System Settings - Control Panel type folder to change system settings

Terminal - Like Command Prompt, but the Linux Terminal is amazing if you have a while to learn how to use some of what it has to offer

Text Editor - Notepad, but better

Themes - Change your Window Decorations, Mouse Cursor, Icons and some theme related settings like clicking scrollbars etc

Thunderbird Mail - The best eMail client

Timeshift - This tool once setup is like System Protection in windows (well it was available in Linux first, so the other way around)

Transmission - The default BitTorrent client for Linux

uGet - IDM, type Download Manager

Uninstall Wine Software - Add/Remove Programs

Update Manager - Linux Mint's Updater

USB Image Writer - Rufus/Etcher type tool

USB Stick Formatter - Erase your data or change Partition Type

Users and Groups - Add or remove users or change their access level or groups they are part of

Virtual Keyboard - This will squash down the screen and make a perminate keyboard that you can use

VLC Media Player - Media Player with streaming support

Warpinator - Send and Recieve files accross the network

Web Apps - Turns websites into a windowed application

Welcome Screen - A step by step introduction and configuration tool for Linux Mint

Windows - Change button position, clicking titlebars, opening positions and Alt-Tab options

Window Tiling - Enable snap windows when dragged to an edge or top etc

WineTricks - Help with installing apps/games in linux and othr WINE related tools

WinRAR - WINE WinRAR is essential to every OS (Brought it yet?)

WizFile - WINE Find files quickly, Drive Z: is Linux in Wine

WizTree - WINE Manage disk usage or find the space hogging folders, Drive Z is Linux in Wine apps

Workspaces - Switch between workspaces/desktops

Xfburn - CD/DVD Burner and creator

Yahtzee GH - WINE Game, Yahtzee


-------------------------------------------------------------------------------

--- Not Included in LastOSLinux, but good quality software to get from the Software Store --- 

Avidemux - For Editing, splitting and combining audio and video streams

Balena Etcher - Burn USB Images, supports compressed sources

Blender - 3D Video and CAD tool

Bottles - Another good WINE manager to get apps and games configured and working better

Calibre - eBook reader and manager

digikam - Photo Manager with lot of built in features

Discord - Message, Voice and Video Client

DropBox - Cloud Storage

Emby Server/Theater - Like Plex but not Plex

Focuswriter - Full screen writing without any distractions (It takes all the file associations, so I didn't include it)

Foliate - Clean eBook Reader

Gambas3 - Visual Basic 6 like Programming Language

GIMP - Photo/Image Editor

Godot - Game Making, Programming Language

Gscan2pdf - Multipage scanning direct to PDF

Handbreak - Convert or compress video files (This is a FlatPak so is too large to include, but pretty essential if you work with videos)

Hedgewars - Game, Clone of Worms (Not installed) 

Heroic Games Launcher - Another games store manager for multiple stores (Not installed) 

Inkscape - Vector Graphics Editing (Not installed)

ISO Master - UltraISO (Manage and create ISO and CD/DVD type files, not in repository anymore 

Joplin - Note taking and To Do List (Not installed)

Kdenlive - Video Editor

Kazam - Screen recording and voice capture made simple (No Wayland Support)

Krita - Photoshop type tool, the brush method is weird compared to PS, but once you figure it out, it's capable (More than GIMP)

Lightzone - RAW Photograph Editing 16bit support

Make MKV - Ripping DVDs and BDs

Microsoft Edge - If you want to access CoPilot in Linux, you still can with Edge (Not installed) 

Nicotine+ - Peer to Peer Search and Download Client

OpenShot Video Editor - Edit videos

Parcellite - Clipboard Manager

PdfSam -  Merge or split pdf documents and rotate, crop and rearrange their pages

PeaZip - Archive Manager like WinRAR and 7Zip

Pinta - Paint program, more tools than original MS Paint

PokerTH - Game, Poker Card Game

Reaper - Digital Audio Workstation, audio production application for computers, offering a full multitrack audio and MIDI recording, editing, processing, mixing and mastering toolset

SendAnywhere - Send files/folders to your Phone/Tablet or other PC's

Skype - Video/Voice Chat Client

Solaar (Logitec) - Pair and View Logitec Devies (Shows Battery percentage in Taskbar)

Spotify - Music Streaming Service

Stremio - Stream across your devices in 4k quality

Syncthing - Sync Files/Folders across your devices without using the cloud

Typora - Markdown reader and writer

VueScan - Scan from over 6000 Devices (Paid)

VirtualBox - Virtual Machines to test bootable ISO on

Visual Studio Code - IDE editor made by Microsoft

XnViewMP - Image Viewer (Large for it's purpose)

Zoom - Video/Voice Chat Client


-------------------------------------------------------------------------------

--- Other Software you may use ---

Handbreak - This is for converting Video formats or recompressing them  (Not installed) 

AnyDesk - Remote Desktop Access/Support (But be careful scammers will try to trick you into letting them use your computer)

TeamViewer - Remote Desktop Access/Support (" Above)
