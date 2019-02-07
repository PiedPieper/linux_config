#!/usr/bin/env bash

REDSHIFT_PID=$(pidof -s redshift)

if [[ $? == 0 ]]; then ## Redshift is on
    kill $REDSHIFT_PID	
else ## Redshift is off
    exec redshift -b 1:0.9 -t 4000:2000 &
fi
