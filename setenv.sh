#!/bin/sh

# update the path
export PATH=${HOME}/zopen/dev/depot_toolsport/depot_tools:$PATH
#export PATH=/z/jd895801/zopen/dev/depot_toolsport/depot_tools:$PATH

# activate the virtual env
. ./myenv/bin/activate

# Disable updating depot_tools
export DEPOT_TOOLS_UPDATE=0

# Using depot_tools disable metrics.  
# Comment out this line if you wish to participate
gclient metrics --opt-out



