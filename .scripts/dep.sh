#!/bin/bash

# Disable stdin
exec 0<&- 

# check user
SUDO="sudo"
if ! command -v sudo &> /dev/null
then
    SUDO=""
fi

echo "🎉 Lets start by getting all deps"
${SUDO} apt update 
${SUDO} apt-get install -y git-core curl lvm2 thin-provisioning-tools python-pkg-resources python3-virtualenv python3-oauth2client xz-utils python3.6 sudo 
[ ! -d ~/depot_tools ] &&  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git ~/depot_tools 