# Git all Utility
The purpose of this utility is to provide an easy way to execute git operations on an entire group of repositories that are all held in the same place.
It will be updated as I see the need to or have ideas to improve it.

# Usage
To use this utility, I recommend keeping it somewhere near your home directory and adding it to your ~/.bashrc under some sort of alias since this is just a raw shell script.
By default, calling this script with no arguments executes "git pull" on all of the subdirectories inside of the directory where it was executed.

## Options
You can execute this script with your own git commands by calling `./git-all.sh <your-command>`.

This script also supports the following options:
* __-h__ / __--help__ / __-help__: displays help information
* __-s__: shorthand for `gall status --short`
* __-S__: shorthand for `gall status`
* __-d__: shorthand for `gall diff --stat`
* __-D__: shorthand for `gall diff HEAD`
* __-b__: shorthand for `branch --show-current`

