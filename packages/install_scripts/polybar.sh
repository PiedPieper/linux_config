
#!/usr/bin/env bash

set -e 

packages=("python-xcbgen" "linxcb-ewmh-dev" "libxcb-icccm4-dev" "libxcb1-dev" \
    "xcb-proto" "libxcb-util-dev" "libxcb-image0-dev" "libxcb-randr0-dev" "libxcb-xkb-dev" \
   "libalsaplayer-dev" "wireless-tools" "libcurlpp-dev" "libcairo2-dev" )

sudo apt install python-xcbgen libxcb-ewmh-dev libxcb-icccm4-dev libxcb1-dev \
    xcb-proto libxcb-util-dev libxcb-image0-dev libxcb-randr0-dev libxcb-xkb-dev \
   libalsaplayer-dev wireless-tools libcurlpp-dev libcairo2-dev libcurl4-dev libmpdclient-dev \
	libiw-dev libpulse-dev libxcb-composite0-dev

cd /tmp
git clone https://github.com/jaagr/polybar.git
cd polybar
./build.sh
