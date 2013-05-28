#!/bin/bash

#cd /etc/fonts/infinality

stylesdir=conf.avail
styles=$(ls $stylesdir)

renderdir=rendering.avail
renderstyles=$(ls $renderdir | sed -e 's/\..*$//')

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

function showstyles {
	printf "\tavailable styles are: "; echo $*
}

function selectconfd {
	printf "Select a style:\n"
	select style in $styles; do
		if [[ -z "$style" ]]; then
			printf "\tPlease select available style\n"
			return 1
		fi
		ln -sfn $stylesdir/$style conf.d
		printf "conf.d -> %s/%s\n" $stylesdir $style
		break
	done
}

function setconfd {
	if [[ -z "$1" ]]; then
		selectconfd
		return $?
	fi

	for style in $styles; do
		if [[ "$1" = "$style" ]]; then
			ln -sfn $stylesdir/$style conf.d
			printf "conf.d -> %s/%s\n" $stylesdir $style
			return 0
		fi
	done

	printf "\tNo such style,\n"
	showstyles $styles
	return 1
}

function selectrendering {
	printf "Select rendering style:\n"
	select style in $renderstyles; do
		if [[ -z "$style" ]]; then
			printf "\tPlease select available style\n"
			return 1
		fi
		ln -sf $renderdir/$style.sh rendering-style.sh
		printf "rendering-style.sh -> %s/%s\n" $renderdir $style.sh
		break
	done
}

function setrendering {
	if [[ -z "$1" ]]; then
		selectrendering
		return $?
	fi

	for style in $renderstyles; do
		if [[ "$1" = "$style" ]]; then
			ln -sf $renderdir/$style.sh rendering-style.sh
			printf "rendering-style.sh -> %s/%s\n" $renderdir $style.sh
			return 0
		fi
	done

	printf "\tNo such style,\n"
	showstyles $renderstyles
	return 1
}


function usage {
	printf "\tUsage:\n"
	printf "\tmakestyles - populate styles directories with symlinks to conf.src\n"
	printf "\tsetstyle - set default style\n"
	printf "\tsetrendering - set default rendering style\n"
}

################ Main ###################
case $1 in
	makestyles)
		createdirs && populatedirs || exit 1 ;;
	setstyle)
		setconfd $2 ;;
	setrendering)
		setrendering $2 ;;
	*)
		usage ;;
esac

