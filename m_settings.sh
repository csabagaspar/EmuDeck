#!/bin/bash

#Expert mode off by default
expert=true

#Default settings for all systems
doSetupRA=true
doSetupDolphin=false
doSetupPCSX2=false
doSetupRPCS3=false
doSetupYuzu=false
doSetupCitra=false
doSetupDuck=false
doSetupCemu=false
doSetupXenia=false
doSetupRyujinx=false
doSetupMAME=false
doSetupPrimehack=false
doSetupPPSSPP=false
doSetupRMG=false
doSetupares=false
doSetupXemu=false
doSetupESDE=true
doSetupSRM=false
doSetupPCSX2QT=false
#doSetupMelon=true
doSetupMGBA=false
doSetupBigPEmu=false
doSetupFlycast=false
doSetupSupermodel=false
doSetupModel2=false

#Install all systems by default
doInstallSRM=true
doInstallESDE=true
doInstallRA=true
doInstallDolphin=false
doInstallPCSX2=false
doInstallRPCS3=false
doInstallYuzu=false
doInstallCitra=false
doInstallDuck=false
doInstallCemu=false
doInstallXenia=false
doInstallRyujinx=false
doInstallPrimeHack=false
doInstallPPSSPP=false
doInstallRMG=false
doInstallares=false
doInstallXemu=false
doInstallPCSX2QT=false
doInstallMAME=false
#doInstallMelon=false
doInstallMGBA=false
doInstallBigPEmu=false
doInstallFlycast=false
doInstallSupermodel=false
doInstallCHD=false
doInstallPowertools=false
doInstallGyro=false
doInstallHomeBrewGames=false
doInstallModel2=false

installString='Installing'

#Default RetroArch configuration 
RABezels=true
RAautoSave=false

#Default widescreen
duckWide=false
DolphinWide=false
DreamcastWide=false
BeetleWide=false
pcsx2QTWide=false

#Default installation folders
emulationPath=/run/media/mmcblk0p1/Emulation
romsPath=/run/media/mmcblk0p1/Emulation/roms
toolsPath=/run/media/mmcblk0p1/Emulation/tools
biosPath=/run/media/mmcblk0p1/Emulation/bios
savesPath=/run/media/mmcblk0p1/Emulation/saves
storagePath=/run/media/mmcblk0p1/Emulation/storage
ESDEscrapData=/run/media/mmcblk0p1/Emulation/tools/downloaded_media

#Default ESDE Theme
esdeTheme="EPICNOIR"

#Advanced settings
doSelectWideScreen=false
doRASignIn=false
doRAEnable=false
doESDEThemePicker=false
doSelectEmulators=false
doResetEmulators=false
XemuWide=false

#New UI settings
achievementsPass=false
achievementsUser=false
arClassic3D=43
arDolphin=43
arSega=43
arSnes=43
RAHandClassic2D=false
RAHandClassic3D=false
RAHandHeldShader=true
doSetupSaveSync=false
