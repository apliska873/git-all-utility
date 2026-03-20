#colors as variables for convenience.
dark_yellow="\033[0;33m"
bright_yellow="\033[0;93m"
bright_green="\033[0;32m"
reset_color="\033[0m"
cyan="\033[0;36m"

gcmd=""
gallcmd="find * -maxdepth 0 -type d \
		-exec echo -e ${cyan}{}${reset_color} \; \
		-execdir git -C {} pull \; \
		-exec echo \"\" \;"

if [[ $@ == "" ]]; then
	echo -e "${bright_yellow}Pulling ${dark_yellow}from all repos in this directory...${reset_color}"
	find * -maxdepth 0 -type d \
		-exec echo -e ${cyan}{}${reset_color} \; \
		-execdir git -C {} pull \; \
		-exec echo "" \;

elif [[ $1 == "-s" ]]; then
	echo -e "${dark_yellow}Executing ${bright_yellow}status --short${dark_yellow} on repos in this directory...${reset_color}"


	find * -maxdepth 0 -type d \
		-exec echo -e ${cyan}{}${reset_color} \; \
		-execdir git -C {} status --short \; \
		-exec echo "" \;

elif [[ $1 == "-d" ]]; then
	echo -e "${dark_yellow}Executing ${bright_yellow}diff --stat${dark_yellow} on repos in this directory...${reset_color}"


	find * -maxdepth 0 -type d \
		-exec echo -e ${cyan}{}${reset_color} \; \
		-execdir git -C {} diff --stat \; \
		-exec echo "" \;


elif [[ $1 == "-h" || $1 == "--help" || $1 == "-help" ]]; then
	echo "This script is meant to assist with accomplishing git commands across all repos inside of the current directory.
I recommend keeping this script in your home directory and aliasing it in your ~/.bashrc file.
	ex: alias gall='~/./git-all.sh'
Options:
	-h 	: Show the help menu.
	--help		||
	-help		||

	-s	: shorthand for 'status --short'
	"

else
	echo -e "${dark_yellow}Executing ${bright_yellow}$@${dark_yellow} on repos in this directory...${reset_color}"

	find * -maxdepth 0 -type d \
		-exec echo -e ${cyan}{}${reset_color} \; \
		-execdir git -C {} $@ \; \
		-exec echo "" \;
fi

echo -e "${bright_green}Done!${reset_color}"

# running this command with 'status --short' is goated
