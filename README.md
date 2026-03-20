# Git all Utility
The purpose of this utility is to provide an easy way to execute git operations on an entire group of repositories that are all held in the same place.
It will be updated as I see the need to or have ideas to improve it.

# Usage
To use this utility, I recommend keeping it somewhere near your home directory and adding it to your ~/.bashrc under some sort of alias since this is just a raw shell script.
By default, calling this script with no arguments executes "git pull" on all of the subdirectories inside of the directory where it was executed.

## Options
You can execute this script with your own git commands by calling `./git-all.sh <your-command>`.

This script also supports the following options:
* -h / --help / -help: displays help information
* -s: shorthand for `gall status --short`
* -d: shorthand for `gall diff --stat`
* -b: shorthand for 'branch --show-current

