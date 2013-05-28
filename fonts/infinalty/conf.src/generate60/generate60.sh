 #!/bin/sh

awk -f 60-group-tt-fonts.conf.awk 60-group-tt-fonts.list > 60-group-tt-fonts.conf
awk -f 60-group-non-tt-fonts.conf.awk 60-group-non-tt-fonts.list > 60-group-non-tt-fonts.conf

