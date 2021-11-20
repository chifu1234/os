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
${SUDO} apt update  >/dev/null
${SUDO} apt-get install -y git-core curl lvm2 thin-provisioning-tools python-pkg-resources python3-virtualenv python3-oauth2client xz-utils python3.6 sudo >/dev/null
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git ~/depot_tools >/dev/null
export PATH=~/depot_tools:$PATH 
echo "🐧 Now get the sources (around 30min)"
mkdir ~/chromiumos >/dev/null
cd ~/chromiumos >/dev/null
repo init -u https://chromium.googleso urce.com/chromiumos/manifest.git --repo-url https://chromium.googlesource.com/external/repo.git >/dev/null
repo sync -j16 >/dev/null
echo "🔎 Now let's build chromium os (1h)."
cros_sdk
cros_sdk setup_board --board=amd64-generic
cros_sdk ./build_packages --board=amd64-generic
cros_sdk ./build_image --board=amd64-generic --noenable_rootfs_verification test