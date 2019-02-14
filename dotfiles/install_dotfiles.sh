#!/usr/bin/env bash

while IFS=, read -r install_type install_src install_dst 
do
    install_dst="${install_dst/\~/$HOME}"
    install_src="$(pwd)/$install_src"
    echo "install_src: $install_src"
    echo "install_dst: $install_dst"
    case "$install_type" in 
        "ln")
            if [ -f $install_dst ] || [ -d $install_dst ] && [ ! -L $install_dst ]; then
                echo "Moving $install_dst to $install_dst.bak"
                mv $install_dst "${install_dst}.bak"
            elif  [ ! -f $install_dst ] && [ ! -L $install_dst ] ;then
                echo "Linking $install_src to $install_dst"
                ln -s $install_src $install_dst
	    else 
		echo "Link exists. Removing"
		rm $install_dst
                echo "Re-linking $install_dst to $install_dst"
                ln -s $install_src $install_dst
            fi
            ;;
        "cp")
            if [ -f $install_dst ] || [ -d $install_dst ] ; then
                echo "Moving $install_dst to $install_dst.bak"
                mv $install_dst "${install_dst}.bak"
            fi		
            echo "copying $install_src to $install_dst"
            cp -r $install_src $install_dst
            ;;

    esac


done < dotfiles.txt 


