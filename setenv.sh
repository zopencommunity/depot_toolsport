#!/bin/sh

# The path and environment variables are updated as a result of the package install.
# However, if the user installs the package and does not run the zopen-config
# command in the current shell, then the path will not be there yet.  In 
# this case check for the path in the current path.

desired_path="zopen/usr/local/zopen/depot_tools/depot_tools-main"

if  expr "${PATH}" : ".*${desired_path}.*" 1>/dev/null ; then
    echo "Good. depot_tools is in path."
else
    echo "Path to depot_tools missing.  Adding it to path.."
    export PATH=${PATH}:${HOME}/${desired_path}
fi


