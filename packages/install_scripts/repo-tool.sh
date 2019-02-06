#!/usr/bin/env bash


install_loc=/usr/local/bin/repo
if [ ! -f $install_loc  ]; then
    echo "$install_loc empty, installing repo"
    sudo bash -c "curl https://storage.googleapis.com/git-repo-downloads/repo > $install_loc"
    sudo chmod a+x $install_loc
else
    echo "$install_loc exists, not installing repo"
fi
