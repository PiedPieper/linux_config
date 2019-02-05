#!/usr/bin/env bash 

PACKAGES_FILE="apt_packages.txt"
REPOSITORY_FILE="apt_repos.txt"

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

install_apt_repos
install_apt_packages
