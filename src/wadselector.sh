#!/bin/bash

IWADPATH=/usr/local/share/games/doom

if [ ! -d $IWADPATH ]
then
	echo "error: $IWADPATH directory does not seem to exist"
	exit
fi

INDEX=1

printf '%s\n Availiable wads \n%s\n' "------------------" "------------------"
echo "type 0 -> EXIT"
for ARCH in ${IWADPATH}/*.{wad,WAD}
do
	WADS[INDEX]=$ARCH
	echo -n "type $INDEX -> "
	echo ${WADS[INDEX]} | cut -d'/' -f7-
	INDEX=`expr $INDEX + 1`
done
echo "Choose a WAD: ";read CHOSENWAD
#reset
INDEX=1

for ARCH in ${IWADPATH}/*.{wad,WAD}
do
	if [ $CHOSENWAD -eq 0 ]
	then
		exit
	elif [ $CHOSENWAD == $INDEX ]
	then
		echo "You've chosen: ${WADS[INDEX]}"
		chocolate-doom -iwad ${WADS[INDEX]}
		exit
	else
		INDEX=`expr $INDEX + 1`
	fi
done
echo "No WAD found by that index ($CHOSENWAD)"


