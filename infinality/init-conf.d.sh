#!/bin/sh

if [ -d infinality.conf.d ]
then
	rm -r infinality.conf.d/*
else 
	mkdir infinality.conf.d
fi

cd infinality.conf.d
ln -sf ../infinality.conf.avail/* .

rm 99-debug.conf
rm 40-repl-generic.conf
rm 42-repl-global.conf

