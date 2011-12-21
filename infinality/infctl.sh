#!/bin/bash

stylesdir=styles.conf.avail
styles=`/bin/ls $stylesdir`

function createdirs {
	if [[ -d $stylesdir ]]; then
		rm -r $stylesdir/*
	else 
		mkdir $stylesdir
	fi
	
	for style in $styles; do
		mkdir $stylesdir/$style
	done
}

function populatedirs {
	for cfile in conf.src/*.conf; do
		for style in $styles; do
			grep -q -E -e "^\s*<!--\s*##Style:\s*(.*$style.*|common)\s*-->$" $cfile \
				&& ln -sf -t $stylesdir/$style ../../$cfile
		done
	done
	return 0
}

function selectconfd {
	printf "Select a style:\n"
	select style in $styles; do
		ln -sfn $stylesdir/$style conf.d
		printf "conf.d -> %s/%s\n" $stylesdir $style
		break
	done
}

function usage {
	printf "\tUsage:\n"
	printf "\tmakestyles - populate styles directories with symlinks to conf.src\n"
	printf "\tsetstyle - set default style\n"
	showstyles
}

################ Main ###################
case $1 in
	makestyles)
		createdirs && populatedirs || exit 1 ;;
	setstyle)
		selectconfd ;;
	*)
		usage ;;
esac

