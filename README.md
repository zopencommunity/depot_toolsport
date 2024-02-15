[![Automatic version updates](https://github.com/ZOSOpenTools/depot_toolsport/actions/workflows/bump.yml/badge.svg)](https://github.com/ZOSOpenTools/depot_toolsport/actions/workflows/bump.yml)

# depot_tools port

Tools for working with Chromium development. It requires python 3.8 or higher.

The upstream for depot tools is [here.](https://www.chromium.org/developers/how-tos/depottools/)

## Developer Notes

### Building Depot Tools

In order to build from a pristine state ensure that the original
git clone is removed.

Assuming the depot_toolsport repo is in `$HOME/zopen/dev/depot_toolsport`

If this is a brand new git clone, the upstream `depot_tools` directory
will not exist and this step is skipped.

```
$ cd ${HOME}/zopen/dev/depot_toolsport
$ rm -rf depot_tools
```

Actual building of the port:

```
$ cd ${HOME}/zopen/dev/depot_toolsport
$ zopen build
```

Regarding `zopen build`, it does the following things:

* it creates a directory `~/zopen/usr/local/zopen/depot_tools`.
    - during the setup of zopen via `. ${HOME}/zopen/etc/zopen-config` which is normally
      put in the user's `.bashrc`, this will source the `.appenv` file in this tree.
      Note, `zopen-config` sources all `.appenv` files for all the installed packages.


Something to keep in my when building a package/port using `zopen build` and installing
a package/port using `zopen install some_pkg_name`, the end result is the same.  That 
is the results are put in `${HOME}/zopen/usr/local/pkg_name`.  There is not a concept
of a `make` and `make install` as two separate steps when building packages from source.




### Using Depot Tools

This is the workflow for using depot tools port.

#### Create and and use a python virtual environment

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

#### Updating the developer environment

There is a script in the repo which can be used to setup environment for using depot_tools.
Note, until `zopen build` is performed, gclient will not be available.  Once `zopen build` is
performed the git repot will be present and the `setenv.sh` script will not complain.

This script will activate the python virtual environment, modify the path to access 
the tools provided by depot_tools, and disable updates and metrics.  NOTE: by default
it clears entires created by depot_tools as part of the fetch usage.  If you 
wish to preserve an existing fetch operation and just need the path and
virtual environment, use the `-resume` switch with `setenv.sh` as shown
below.

```
$ cd ${HOME}/zopen/dev/depot_toolsport
$ source setenv.sh
```

Optionally, if you wish to resume work here is how to use
the `-resume` switch.

```
$ cd ${HOME}/zopen/dev/depot_toolsport
$ source setenv.sh -resume
```

At this point, depot_tools is ready for use.  For example:

```
TODO: needs to be modified for v8base
$ cd ${HOME}/zopen/dev/
$ fetch v8
```

Will fetch the v8 source without using zopen.
