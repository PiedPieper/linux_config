#!/usr/bin/env bash 

apt_update()
{
	## Update the system
	sudo apt update && sudo apt upgrade
}
install_apt_repos()
{
	## Read the package list and install all of the packages
	apt_repos=()
	while IFS='' read -r line || [[ -n "$line" ]]; do
	    echo "repo : $line"
	    apt_repos+=($line)
	done < "apt_packages.txt"
	sudo apt install ${apt_repos[*]}
}

install_apt_repos
