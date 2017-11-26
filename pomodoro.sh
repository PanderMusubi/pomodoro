#!/usr/bin/env bash

for i in `seq 25 -1 1`; do
        echo -n $i' '
	sleep 1m
done

MY_PATH=`dirname $0`
FILE=`ls $MY_PATH/sounds|sort -R|head -1`
echo `basename $FILE .mp3`
FILE=$MY_PATH'/sounds/'$FILE

if [ `which mplayer|wc -l` -eq 1 ]; then
	mplayer -really-quiet $FILE > /dev/null 2>&1
else
if [ `which ffplay|wc -l` -eq 1 ]; then
	#FIXME Doesn't exit after playing sound.
	ffplay -nodisp -loglevel panic $FILE > /dev/null 2>&1
else
if [ `which mpg123|wc -l` -eq 1 ]; then
	mpg123 $FILE > /dev/null 2>&1
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
