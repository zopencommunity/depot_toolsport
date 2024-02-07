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

# provide a mechanism to resume work on v8 versus 
# ensure pristine.   Assume by default the user
# desires a pristine state and a fresh fetch.
RESUME=0
while [ $# -gt 0 ]; do
    case "$1" in
        -resume)
            echo "-resume switch used.  Skipping .gclient* delete"
            RESUME=1
            shift
            ;;
        -optionx)
            echo "option x used with value $2"
            echo "TODO: nothing to do yet"
            shift 2
            ;;
        *)
            echo "unknown option"
            echo "USAGE: $0 [-resume]"
            exit 1
            ;;
    esac
done

# remove any previous attempts of fetch
# so as to pull a fresh copy.  If this is the first time building
# depot tools, these file will not be present and thus
# no need to attempt to remove them. 
# NOTE: assuming v8 will be built in $HOME/zopen/dev/v8base
if [ ${RESUME} -eq 0 ]; then
    echo "Attempting to delete any leftover .gclient* entries"
    if [ -d "${HOME}/zopen/dev/v8base" ]; then
        if [ -f "${HOME}/zopen/dev/v8base/.gclient_entries" ]; then
            rm ${HOME}/zopen/dev/v8base/.gclient_entries
        fi
        if [ -f "${HOME}/zopen/dev/v8base/.gclient_entries" ]; then
            rm ${HOME}/zopen/dev/v8base/.gclient
        fi
    fi
fi


