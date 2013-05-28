BEGIN {
	printf "<?xml version='1.0'?>\n"
	printf "<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>\n"
	printf "<fontconfig>\n\n"
	printf "\t<!-- ##Style: common -->\n\n"
	printf "\t<!-- A list of TT instructed fonts that are verified\n"
	printf "\t\tto look OK with infinality patches -->\n\n"
}

{
	printf "\t<match target=\"font\">\n"
	printf "\t\t<test name=\"force_autohint\">\n"
	printf "\t\t\t<bool>false</bool>\n"
	printf "\t\t</test>\n"
	printf "\t\t<test name=\"family\">\n"
	printf "\t\t\t<string>" 
	printf $0
	printf "</string>\n"
	printf "\t\t</test>\n"
	printf "\t\t<edit name=\"font_type\" mode=\"assign\">\n"
	printf "\t\t\t<string>TT Instructed Font</string>\n"
	printf "\t\t</edit>\n"
	printf "\t</match>\n\n"
}

END {
	printf "</fontconfig>\n\n"
}

