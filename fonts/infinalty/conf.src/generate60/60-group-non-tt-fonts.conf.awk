BEGIN {
	printf "<?xml version='1.0'?>\n"
	printf "<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>\n"
	printf "<fontconfig>\n\n"
	printf "\t<!-- ##Style: common -->\n\n"
	printf "\t<!-- Make these fonts use autohint slight hinting -->\n"
	printf "\t<!-- Makes only horizontal stems align to pixels.  Truer to glyph -->\n\n"
	printf "\t<!-- A list of non TT instructed fonts -->\n"
}

{
	printf "\t<match target=\"font\">\n"
	printf "\t\t<test name=\"family\">\n"
	printf "\t\t\t<string>" 
	printf $0
	printf "</string>\n"
	printf "\t\t</test>\n"
	printf "\t\t<edit name=\"font_type\" mode=\"assign\">\n"
	printf "\t\t\t<string>NON TT Instructed Font</string>\n"
	printf "\t\t</edit>\n"
	printf "\t</match>\n\n"
}

END {
	printf "\t<match target=\"font\">\n"
	printf "\t\t<test name=\"font_type\">\n"
	printf "\t\t\t<string>NON TT Instructed Font</string>\n"
	printf "\t\t</test>\n"
	printf "\t\t<edit name=\"autohint\" mode=\"assign\">\n"
	printf "\t\t\t<bool>true</bool>\n"
	printf "\t\t</edit>\n"
	printf "\t\t<edit name=\"hintstyle\" mode=\"assign\">\n"
	printf "\t\t\t<const>hintslight</const>\n"
	printf "\t\t</edit>\n"
	printf "\t\t<edit name=\"hinting\" mode=\"assign\">\n"
	printf "\t\t\t<bool>true</bool>\n"
	printf "\t\t</edit>\n"
	printf "\t\t<edit name=\"antialias\" mode=\"assign\">\n"
	printf "\t\t\t<bool>true</bool>\n"
	printf "\t\t</edit>\n"
	printf "\t</match>\n\n"
	printf "</fontconfig>\n\n"
}

