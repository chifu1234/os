#!/bin/bash

export PATH=~/depot_tools:$PATH 

cros_sdk
cros_sdk setup_board --board=amd64-generic