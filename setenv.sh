#!/bin/sh

# update the path
export PATH=${PATH}:${HOME}/zopen/dev/depot_toolsport/depot_tools

# activate the virtual env
. ./myenv/bin/activate

# Disable updating depot_tools
export DEPOT_TOOLS_UPDATE=0

# Disable commands:
# * ensure_bootstrap
# * update_depot_tools
export DEPOT_TOOLS_BOOTSTRAP_PYTHON3=0

# Using depot_tools disable metrics.
# Comment out this line if you wish to participate.
gclient metrics --opt-out

# remove any previous attempts of fetch
# so as to pull a fresh copy
rm ${HOME}/zopen/dev/v8base/.gclient_entries
rm ${HOME}/zopen/dev/v8base/.gclient
