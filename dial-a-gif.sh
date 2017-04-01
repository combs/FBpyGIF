#!/bin/bash
SCRIPT=/home/chip/git/dial-a-gif/dial-a-gif.py
ARGS=" /home/chip/headlikeanorange/*.gif -al 10 "
trap "echo exiting...;sleep 3; exit 1" SIGTERM SIGINT SIGHUP EXIT

sudo i2cset -y -f 0 0x34 0x30 0x23

echo "starting `basename $SCRIPT` $ARGS:"
ls -l $SCRIPT
while sleep 1
do nice --3 python3 $SCRIPT $ARGS
echo Exited $?...

done
