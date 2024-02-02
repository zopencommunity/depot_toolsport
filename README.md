[![Automatic version updates](https://github.com/ZOSOpenTools/depot_toolsport/actions/workflows/bump.yml/badge.svg)](https://github.com/ZOSOpenTools/depot_toolsport/actions/workflows/bump.yml)

# depot_tools

Tools for working with Chromium development. It requires python 3.8 or higher.

## Developer Notes

This is the workflow for using depot tools port.

### Create and and use a python virtual environment

This only needs to be done once.  This creates a virtual environment in 
the specified directory `myenv`.  This name is in the `.gitignore`.  If
you use a custom name please update your `.gitignore` appropriately.

```
$ cd ${HOME}/zopen/dev/depot_toolsport
$ python3 -m venv myenv
```

#### Activate a python virtual environment

This needs to be done each time using the tool

```
$ cd ${HOME}/zopen/dev/depot_toolsport
$ source myenv/bin/activate
```

Afterwards, python3 and python are equivalent.

#### Update the pip module

```
$ cd ${HOME}/zopen/dev/depot_toolsport
$ python -m pip install -U pip
```

#### Install necessary modules for use with depot_tools

```
$ cd ${HOME}/zopen/dev/depot_toolsport
$ pip install -r requirements.txt
```

### Updating the developer environment

There is a script in the repo which can be used to setup environment for using depot_tools.
Note, until `zopen build` is performed, gclient will not be available.  Once `zopen build` is
performed the git repot will be present and the `setenv.sh` script will not complain.

This script will activate the python virtual environment, modify the path to access 
the tools provided by depot_tools, and disable updates and metrics.

```
$ cd ${HOME}/zopen/dev/depot_toolsport
$ source setenv.sh
```

At this point, depot_tools is ready for use.  For example:

```
TODO: needs to be modified for v8base
$ cd ${HOME}/zopen/dev/
$ fetch v8
```

Will fetch the v8 source without using zopen.
