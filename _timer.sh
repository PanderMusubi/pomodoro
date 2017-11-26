#!/usr/bin/env bash

function play {

if [ `which mplayer|wc -l` -eq 1 ]; then
	mplayer -really-quiet $1 > /dev/null 2>&1
else
if [ `which ffplay|wc -l` -eq 1 ]; then
	#FIXME Doesn't exit after playing sound.
	ffplay -nodisp -loglevel panic $1 > /dev/null 2>&1
else
if [ `which mpg123|wc -l` -eq 1 ]; then
	mpg123 $1 > /dev/null 2>&1
else
if [ `which beep|wc -l` -eq 1 ]; then
	beep > /dev/null 2>&1
else
	echo 'ERROR: Could not find supported audio player'
	exit 1
fi
fi
fi
fi

}

if [ $# -ne 1 ]; then
	echo 'ERROR: Missing parameter for number of minutes'
	exit 1
fi

for i in `seq $1 -1 1`; do
        echo -n $i' '
	sleep 1m
done

SOUNDS=`dirname $0`/sounds
FILE=`ls $SOUNDS|sort -R|head -1`
#TODO Add test that a sound file is found.
echo `basename $FILE .mp3`

play $SOUNDS'/'$FILE
play $SOUNDS'/'$FILE
