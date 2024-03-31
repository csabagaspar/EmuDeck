#!/bin/bash

EMUDECKGIT="$HOME/.config/EmuDeck/backend"
emuDecksettingsFile="$HOME/emudeck/settings.sh"

cp "$EMUDECKGIT/m_settings.sh" "$emuDecksettingsFile"

# Installation...
#. "$EMUDECKGIT/m_setup.sh"


#########################################################
PIDFILE="$HOME/.config/EmuDeck/install.pid"

if [ -f "$PIDFILE" ]; then
  PID=$(cat "$PIDFILE")
  ps -p "$PID" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "Process already running"
    exit 1
  else
    ## Process not found assume not running
    echo $$ > "$PIDFILE"
    if [ $? -ne 0 ]; then
      echo "Could not create PID file"
      exit 1
    fi
  fi
else
  echo $$ > "$PIDFILE"
  if [ $? -ne 0 ]; then
    echo "Could not create PID file"
    exit 1
  fi
fi

function finish {
  echo "Script terminating. Exit code $?"
  finished=true
  rm "$MSG"

}
trap finish EXIT

#########################################################
# INSTALL
#########################################################

#Clean up previous installations
rm ~/emudek.log 2>/dev/null # This is emudeck's old log file, it's not a typo!
rm -rf ~/dragoonDoriseTools
rm -rf ~/emudeck/backend

mkdir -p "$HOME/emudeck"
mkdir -p "$HOME/emudeck/logs"
LOGFILE="$HOME/emudeck/logs/emudeckSetup.log"

#Custom Scripts
mkdir -p "$HOME/emudeck/custom_scripts"
echo $'#!/bin/bash\nEMUDECKGIT="$HOME/.config/EmuDeck/backend"\nsource "$EMUDECKGIT/functions/all.sh"' > "$HOME/emudeck/custom_scripts/example.sh"

echo "Press the button to start..." > "$LOGFILE"

mv "${LOGFILE}" "$HOME/emudeck/logs/emudeckSetup.last.log" #backup last log

if echo "${@}" > "${LOGFILE}" ; then
	echo "Log created"
else
	exit
fi

#exec > >(tee "${LOGFILE}") 2>&1
#Installation log
{
date "+%Y.%m.%d-%H:%M:%S %Z"
#Mark if this not a fresh install
FOLDER="$HOME/.config/EmuDeck/"
if [ -d "$FOLDER" ]; then
	echo "" > "$HOME/.config/EmuDeck/.finished"
fi
sleep 1
SECONDTIME="$HOME/.config/EmuDeck/.finished"

#Lets log github API limits just in case
echo 'Github API limits:'
curl -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28"  "https://api.github.com/rate_limit"

#########################################################

## Start of installation

source "$EMUDECKGIT"/functions/helperFunctions.sh
jsonToBashVars "$HOME/.config/EmuDeck/settings.json"
source "$EMUDECKGIT/functions/all.sh"


#ESDE Installation
if [ $doInstallESDE == "true" ]; then
	echo "install esde"
	ESDE_install
fi

if [ $doInstallRA == "true" ]; then
	echo "RetroArch_install"
	RetroArch_install
fi

#ESDE Config
if [ "$doSetupESDE" == "true" ]; then
	echo "ESDE_init"
	ESDE_update
fi

if [ "$doSetupRA" == "true" ]; then
	echo "RetroArch_init"
	RetroArch_init
fi
