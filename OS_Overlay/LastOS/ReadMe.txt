LastOSLinux v1.0

Introduction:

This release is based on Linux Mint v22 with the Ubuntu 24.04 Update 1 applied. It contains WINE v9.16 at the time of building, I used Penguins Eggs to Remaster a running VirtualBox to make a LiveOS that is Installable on any x86_x64 hardware. Mint v22 is supported until 2029 and will continue to work after that or allow it to be upgraded to the next long term release to continue being updated.


Thanks and Information:

Find out more about LastOSLinux at: https://forum.lastos.org/index.php?forums/lastoslinux.216/
Find Penguins-Eggs: https://penguins-eggs.net/ thanks to Piero Proietti and his community.

Conky Theme by Ryan
Boot Screen by Proteus



Important:

The LiveOS has the following login credentials: User: live, Password: live, if for any reason you need a root user, they are User: root, Password: root

This OS works much better on real hardware, as with all new releases of Linux it takes time for the Virtual Machines to properly support them, so using real hardware makes it work as I intended.

* Copying to a USB disk in Linux, especially slow thumb drives, it will use the memory to cache the files it's copying, showing the copy as 100% completed when it really hasn't finished writing to the USB stick, the only way to know if it's fully done is to safely Remove USB (unmount it), it's will not unmount until it's done, you can disable the cache but it will affect other things (like the ability to use the OS until all writes have completed, seams like the OS has crashed/waiting): https://www.reddit.com/r/linux4noobs/comments/bxhnfp/how_to_see_the_real_writing_progress_of_a_usb/

* In Mint not all drives are mounted on boot, using the Disks tool in the menu you can click the disk, press the partition, click the button and choose Edit Mount Options, you can then set mount points and to auto mount on startup if you need it.

* Use the Driver Manager from the Main Menu to install your nVidia drivers (if you have an nVidia Graphics card), as of my testing the v550 version they recommend has been working the best for me, rather than using the one from nvidia.com and as they update into the v560+ it should improve compatibility as they are including the open sourced core inside their drivers, this should fix a lot of mode setting problems etc as the nouveau open sourced drivers do not have those issues.



Mission:

I've been a long time Windows user, but found the direction of Windows 11 to be different to my own. I do not want Copilot to be part of my OS and only available through my browser, I do not want ads and bloat from tools I never intend to subscribe to. I really do not want my local file to be transferred to the cloud with monthly subscriptions to keep them there. The fact they keep moving things about, renaming them and hiding tools and options I've been using my whole life, I dislike how many options they are taking away and how they enforce these things by reverting my edits/choices every time they update windows. 

With the decline of Windows usability, I decided it was time to give Linux another chance, see how far it's come since the last time I used it. There is 1001 Distributions and Re-spins of them, but none of them were as feature complete or simple as Last10 modded Windows. So I went about finding ways to make each feature I rely on, available to me in Linux. First thing I had to do was find the best Distribution to base it on, the one with the most support to home users, one that wasn't so locked down that using it becomes a chore. Security is essential, but not when it annoys the end users so much they no longer want to turn it on. After hundreds of hours testing, I found Ubuntu to be the one I was looking for, but it defaulted to gnome, which is too far removed from Windows for my muscle memory to use it, it felt more like Windows 8 and it's full screen tiles. so I tried Linux Mint, with it's cinnamon desktop environment. This instantly felt familiar and was so easy to customise and tweak.

My goal was to pack as much familiarity into my OS, I knew when I started this project that existing Linux users would not like my OS, because it was too much like Windows, it was too bloated with choices already made. Having full control and knowing exactly what is on your system is what a Linux user likes most about their existing setup. But I wasn't trying to make an operating system for them, they have enough lite OS's that they can install. I also didn't want to make a clone of Windows as these often look the part but do not function like windows at all - they are more just a skin on Linux than a Windows Replacement. My OS still has all the default choices found in Linux Mint, with heaps of themes and icons/wallpapers etc, but I've added Windows Icons to make finding things so much easier.

One of the tools I include is Photoshop, this is something I've paid for in the past and now subscribe to, so I simply put the installed version on the ISO in a compressed file with a free tool that disables the online checks that stop it from running, I removed the features that do not work with Linux and now I am able to use it a little without having to boot back in to windows for a minor edit. I do wish companies would support Linux better, really Mac OSX is still just Linux and it runs fine on that, they could support it if they wanted to and I can't live without it, so it's included.

I am not trying to change Linux at all, I am just giving more people an entry point to it, so instead of them having to spend the hundreds of hours learning and fixing things they expect to work (just like they did in Windows), they can just use it all. No need to modify a single thing, not a heap of choices to make before you even know what they mean. Just a OS that has tools you can use and no need to run the terminal (unless you want to). The reason I know this to be one of the biggest things limiting the adoption of Desktop Linux is that ChromeOS, Steam, Android and even Mac OSX are all Linux, they are just made user friendly (limited) but with the ability to unlock more potential using sudo and terminal. At the end of the day, general home users do not care how or why, they just want to do and existing Linux doesn't let them, it felt incomplete and too lite. I understand that many people who are giving their time to improving Linux are very pro open source and want a pure OS, I can respect that, gamers and tinkerers on the other hand do not care about this at all. they just want it to do the thing they want it to do. 

I volunteer at a online centre who also sells refurbished old Laptops and PC's, I used to install Windows 10 on them, but as they are stopping support for that in 2025 (unless you run LTSC IoT which will last until 2029, but isn't technically available to home users to purchase), I needed a better option, Linux was it. Most of the people buying refurbished PC's are not technically inclined and do not wish to spend more than required on them and aren't interesting in knowing how it works. They just want to get on, use the web, type something up, play a game, edit a photo or a simple task. So I spent more time finding which tools could do the jobs I know many home users need and I've included a list of them and what they are below. 



Features: 

- A simple install, you do have the ability to do advanced installs, but if you are happy to wipe your whole computer then you only need to pick which HDD to install it to.

- A DVD sized image to burn or copy to smaller USB sticks, offering fat32 so it's bootable on more old systems.

- CSM or UEFI bootable, so can be used on older hardware or new PC's.

- A dark theme that's easy on the eyes and doesn't light up a room using it at night.

- Transparent effects, we all know Windows 7 was the best looking OS, I've tried to make this feel as glassy as that but with a darker tint. Windows, Panels, Menu's are all semi transparent.

- Centred Menu and Tasks, this is optional, I found after using it for a few hours it was quite nice to only have to travel to the middle of the screen. I added panel positions in the Right click menu under Scripts - System Tools - Panel to Left, if you don't like this change.

- Scripts, most of the things you do on your computer are repeated often, instead of having to navigate the menu to find the tools or typing in the terminal, I've included a selection of Scripts in the Context menu to do those common tasks with more available from Applets, Extensions, Actions and Desklets. These offer a repository of more that you can easily install and add.

- Windows Icons to make finding what your after as easy as it was in Windows, some are not the same tool, but offer the same functions.

- LastOSLinux Store to make installing things I've curated, easily from USB or online repositories. Some of the items are Windows tools that work well with Linux. Others will tweak your OS or add functionality. There is also games, the store offers Grouped categories so you can find exactly what you need.

- LastOSLinux Launcher makes playing the games you installed from the LastOS Store easy. The Launcher doesn't show the system/steam installed games as these wouldn't have the meta data or screenshots included. Steam is available for all your other gaming needs. I added the ability to press (Ctrl + Break) to close down all WINE apps/games, because sometimes they can cause a problem and this will fix a lot of them without bringing the whole OS down. You can also press (ALT + Break) to just reset the screen resolution if a game messes it up and you dson't want to quit your other windows apps.

- Optional Updates, the red dot on the shield down the bottom right indicates there are updates available, this can be done manually or automated.

- WINE, this is a tool in Linux that allows you to run Windows Apps and games that are only made for windows, in many cases it can run older software better than the newer Windows 10 and 11 could. Apart from low level hardware/HDD access, it can run a large range of software. I have included a thumbnail tool that should extract the Icons of your executables and many of the Store installed items will be sorted into the Linux menus and associations with file types.



Tips & Info:

- Time Shift - Linux Mint offers this tool to keep a backup of your Installation, I also recommend you setup and use this tool (it is actually required to be able to use the Driver Manager Tool to install Graphics etc". What it does is captures all your OS files into a backup you set, then you can make it backup any changes to this image at a schedual you set (or manually). To restore a backup you simply boot to recovery mode by holding in shift as your computer starts (or pick Advanced in the menu), or you boot from a Linux Live USB (Such as LastOS Linux), this is able to quickly restore your system to running again without touching your user files (if you left them turned off as the default option).

If you don't want Chrome to ask for a password each time, don't type in any password and accept the warning, this will let you run it without having to type in a keyring password every time

VirtualBox v7.0.21 and below Must be installed with 128mb of VRam and 3D Acceleration disabled (until the Guest Addition Tools get installed) you also can not run LastOSStore or Launcher, unless you install the Guest Addition Tools and then enable 3D Acceleration once you shut down the VM down.

If your screen resolution is too tiny you can turn on Fractional Scaling in the Context menu - Display Settings, this allows setting it to 150%.

If WINE apps/games are tiny on your 4k screen you can find tools in the LastOSLinux Store to ajust the DPI to High DPI mode.

I changed Linux Mint from holding Alt to drag a window position, to holding Super (Windows) key to move windows. This was so you can Alt Click in Photoshop to set Clone Brush source locations.

The date format I like is %l:%M %p = 3:21 PM, if you use %H it's 24h time and %I has leading zero = 03



Bugs and Limitations:

Do NOT ever use " " (space) as a password it breaks things, you can use single letters or numbers in LastOSLinux, just not space.


If you have a problem with your screen not waking up, press Ctrl + Alt + F2 to switch to a terminal window, then once you see the terminal press Ctrl + Alt + F7 to switch back to the desktop. this works 99.9% of the time, the other .1% you will have to go back to terminal and type reboot as the x server crashes (but it's rare).

Disable ToolTips in Photoshop to stop the annoying ToolTip bug, It's in the Tools section of Edit - Preferences. (This is done by default)



Hotkeys:

Pressing Ctrl + Alt + Escape will reload the whole desktop, handy when things aren't drawing properly etc, try this fix first

Pressing Ctrl + Alt + Backspace will log you out and let you log back in (good when the desktop crashes)

Pressing Ctrl + Alt + Delete or Ctrl + Shift + Escape will bring up Gnome System Monitor, this lets you quit hung tasks

Pressing Ctrl + Break will quit all WINE apps and set the screen resolution back to defaults configured at login

Pressing Alt + Break will set the screen resolution back to defaults configured at login

In Terminal you don't use Ctrl + C/V to copy and paste, it's actually Ctrl + Shift + C/V this is because they are Linux shortcut that have been used since 1972, so you will have to learn to hold shift when working with the terminal to copy and paste. Home and End also dont work as expected, so you have to cursor to where you want or use the mouse to select things. This is all a learning curve, but once you get used to it, it's not so bad.

Holding Shift on system boot will open the GRUB menu to pick/repair booting.

To close Plank Dock, hold Ctrl and Right click the dock.



Introduction to the LastOSLinux:

Cinnamon - The name of the whole Desktop Experience (others are KDE, Gnome, XCFE)
Nemo - The name of the file manager (Windows Explorer)
Panels - Like the Taskbar (Start Menu/ Clock/ Running Applications etc)
Spices - Things that can be added to your panels on the desktop
Actions - Context menu (Right Click menu)
Desklets - Widgets like clocks, Disk Uage and calenders etc.
Extensions - These add functions to Nemo, such as the one I include that makes it show Photo Meta Data as details you can sort by
Scripts - A list of commands that can be applied to a file(s) or folder, or some way to automate a task.

Other Terminology;

LastOS - The team's name behind your modded OS, Wanting to be the LastOS you'll ever need
LastOSLinux Store - The tool used to install apps and games from the CDRom/USB
LastOSLinux Launcher - This will let you see the Linux and Windows games you have installed using the store and launch them.
LLApp Editor - This tool can create new App and Game packages to include in the LastOSLinux Store.
LLApp - (Last Linux App) - This tool can be used to install Apps/Games made with the editor or downloaded.
SetupS - Setup Silent (This is LastOS's very own Silent Setup for Windows Apps)
ssApp - A single app that will install silently onto your operating system
ppApp - This is the same as a ssApp but will extract to the ppApps folder and not require installing, it will make shortcuts etc
ppGame - This is the same as ppApps, but for Games, not apps
LLApp - This is a Linux app that is able to be installed to your users folder instead of system wide.
LLGame - This is a Linux Game that is able to be installed to your users folder instead of system wide. It is able to launch these games from LastOSLinux Launcher.
WINE - This will emulate (:P) windows API's meaning you can run Windows Apps and Games from their .EXE files as they would run in windows

All LastOS app/game packages can be installed from the Context Menu, right click on a ssApp, ppApp, LLApp, ppGame or LLGame and use Scripts/LastOS/ and the action you wish to do ("LLApp Install" to install them). Currently LLApp will call SetupS to install ssApps as these require extra steps that LLApp can not handle.



Included items and what they are:

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

nomacs - Much like Irfanview

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

Virtual Keyboard - This will squash down the screen and make a On Screen keyboard that you can use

VLC Media Player - Media Player with streaming support

Warpinator - Send and Receive files across the network

Web Apps - Turns websites into a windowed application

Welcome Screen - A step by step introduction and configuration tool for Linux Mint

Windows - Change button position, clicking titlebars, opening positions and Alt-Tab options

Window Tiling - Enable snap windows when dragged to an edge or top etc

WineTricks - Help with installing apps/games in Linux and other WINE related tools

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

Gscan2pdf - Multi-page scanning direct to PDF

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

