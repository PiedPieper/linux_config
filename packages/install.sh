#!/usr/bin/env bash 

PIP_FILE="pip.txt"
PACKAGES_FILE="apt_packages.txt"
REPOSITORY_FILE="apt_repos.txt"
INSTALL_SCRIPTS_FILE="install_scripts.txt"
INSTALL_SCRIPTS_DIR="install_scripts"

apt_update()
{
	## Update the system
	sudo apt update && sudo apt upgrade
}
install_apt_packages()
{
	## Read the package list and install all of the packages
	apt_repos=()
	while IFS='' read -r line || [[ -n "$line" ]]; do
	    echo "repo : $line"
	    apt_repos+=($line)
	done < $PACKAGES_FILE 
	sudo apt install ${apt_repos[*]}
}
install_apt_repos()
{
	## Read the package list and install all of the packages
	apt_packages=()
	while IFS='' read -r line || [[ -n "$line" ]]; do
	    echo "repo : $line"
	    apt_packages+=($line)
	done < $REPOSITORY_FILE 
	sudo add-apt-repository ${apt_packages[*]}
	apt_update
}
install_w_scripts()
{
	## Read the package list and install all of the packages
	while IFS='' read -r line || [[ -n "$line" ]]; do
        echo "Executing $line !"
        ./$INSTALL_SCRIPTS_DIR/$line
	done < $INSTALL_SCRIPTS_FILE 
}
install_pip_packages()
{
	## Read the package list and install all of the packages
	while IFS='' read -r line || [[ -n "$line" ]]; do
        echo "Installing via pip: $line !"
        sudo pip install $line
	done < $PIP_FILE
}                 

#install_apt_repos
#install_apt_packages
#install_w_scripts

main()
{
	for arg in "$@"
	do
		case "$arg" in
			--repos)
				install_apt_repos
				;;
			--packages)
				install_apt_packages
				;;
			--scripts)
				install_w_scripts
				;;
            --pip)
                install_pip_packages
                ;;
			*)
				echo "Undefined argument!"
				;;
		esac
	done
}

main $@
