#colors as variables for convenience.
dark_yellow="\033[0;33m"
bright_yellow="\033[0;93m"
bright_green="\033[0;32m"
reset_color="\033[0m"
cyan="\033[0;36m"

isHelp=false
gcmd=$@

if [[ $@ == "" ]]; then
	gcmd="pull"

elif [[ $1 == "-s" ]]; then
	gcmd="status --short"

elif [[ $1 == "-d" ]]; then
	gcmd="diff --stat"

elif [[ $1 == "-b" ]]; then
	gcmd="branch --show-current"

elif [[ $1 == "-h" || $1 == "--help" || $1 == "-help" ]]; then
	isHelp=true

else
	echo -e "${dark_yellow}Executing ${bright_yellow}git $@ ${dark_yellow}on repos in this directory...${reset_color}"
fi

if [ $isHelp = true ]; then
	echo "This script is meant to assist with accomplishing git commands across all repos inside of the current directory.
I recommend keeping this script in your home directory and aliasing it in your ~/.bashrc file.
	ex: alias gall='~/./git-all.sh'
Options:
	-h 	: Show the help menu.
	--help		||
	-help		||

	-s	: shorthand for 'status --short'
	-d	: shorthand for 'diff --stat'
	-b	: shorthand for 'branch --show-current
	"

else
	echo -e "${dark_yellow}Executing ${bright_yellow}git ${gcmd} ${dark_yellow}on repos in this directory...${reset_color}"
	find * -maxdepth 0 -type d \
		-exec echo -e ${cyan}{}${reset_color} \; \
		-execdir git -C {} ${gcmd} \; \
		-exec echo "" \;
fi

echo -e "${bright_green}Done!${reset_color}"

