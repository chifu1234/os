#!/bin/bash

export PATH=~/depot_tools:$PATH 

cros_sdk ./build_packages --board=amd64-generic
cros_sdk ./build_image --board=amd64-generic --noenable_rootfs_verification test