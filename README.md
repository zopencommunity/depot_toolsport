[![Automatic version updates](https://github.com/ZOSOpenTools/depot_toolsport/actions/workflows/bump.yml/badge.svg)](https://github.com/ZOSOpenTools/depot_toolsport/actions/workflows/bump.yml)

# depot_tools port

Tools for working with Chromium development. It requires python 3.8 or higher.

The upstream for depot tools is [here.](https://www.chromium.org/developers/how-tos/depottools/)

## User Notes

This workflow is for users to install and use depot_toolsport.

Install the port and then logout.

```
$ zopen install depot_tools
$ exit
```

## Developer Notes

### Building Depot Tools

In order to build from a pristine state ensure that the original
git clone is removed.

Assuming the depot_toolsport repo is in `$HOME/zopen/dev/depot_toolsport`

If this is a brand new git clone, the upstream `depot_tools` directory
will not exist and this step is skipped.

```
$ cd ${HOME}/zopen/dev/depot_toolsport
$ rm -rf ~/.local ~/zopen/usr/local/zopen/depot_tools; rm -rf install depot_tools; zopen build
```








