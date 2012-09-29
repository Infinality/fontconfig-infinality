#!/bin/bash

list=$1
template=$2

cd /etc/fonts/infinality/conf.src

function usage {
	printf "$0 - Generate fontconfig file given a list and template containing keyword _STRING_\n"
	printf "\n"
	printf "\tUsage:\n"
	printf "\t$0 list_file template\n"
}

function header {
	cat << HEADER
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>

	<!-- ##Style: common -->

HEADER
}

function footer {
	cat << FOOTER
</fontconfig>
FOOTER
}

function body {
  while read line; do
    cat $template | perl -p -e "s/_STRING_/$line/"
  done < $list
}

if [ ! -f $list -o ! -f $template ]; then
  usage
  exit 1
fi

header
body
footer
