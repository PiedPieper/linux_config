#!/usr/bin/env bash

REDSHIFT_PID=$(pidof -s redshift)

if [[ $? == 0 ]]; then ## Redshift is on
    kill $REDSHIFT_PID	
else ## Redshift is off
    exec redshift -b .6:.8 -t 3200:2200 &
fi

