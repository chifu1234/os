#!/bin/bash
# Disable stdin
exec 0<&- 
export PATH=~/depot_tools:$PATH 
mkdir ~/chromiumos 
cd ~/chromiumos 
repo init -u https://chromium.googlesource.com/chromiumos/manifest.git --repo-url https://chromium.googlesource.com/external/repo.git
repo sync -j16 