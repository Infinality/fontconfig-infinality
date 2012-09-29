#!/bin/bash

cd /etc/fonts/infinality/conf.src

./generate-config-from-list.sh tt-fonts.list tt-fonts.template > 60-group-tt-fonts.conf
./generate-config-from-list.sh non-tt-fonts.list non-tt-fonts.template > 60-group-non-tt-fonts.conf
