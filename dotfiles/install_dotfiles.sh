#!/usr/bin/env bash

while IFS=, read -r install_type install_src install_dst 
do
    install_dst="${install_dst/\~/$HOME}"
    install_src="$(pwd)/$install_src"
    echo "install_src: $install_src"
    echo "install_dst: $install_dst"
    case "$install_type" in 
        "ln")
            if [ -f $install_dst ]  && [ ! -L $install_dst ]; then
		echo "Moving $install_dst to $install_dst.bak"
		mv $install_dst "${install_dst}.bak"
	    fi
	    if [ ! -f $install_dst ];then
		echo "Linking $install_dst to $install_dst"
		ln -s $install_src $install_dst
	    fi
	"cp")
	    if [ -f $install_dst ]; then
		echo "Moving $install_dst to $install_dst.bak"
		mv $install_dst "${install_dst}.bak"
	    fi		
	    cp $install_src $install_dst
	    
    esac

	
done < dotfiles.txt 


