#!/bin/bash

# Clean Desktop #
#
# Script for always keeping the desktop clean.
# So long as the script is running, anytime the
# user pastes anything on the desktop, the script
# should move it to the appropriate folder, based
# on the file's extension. File extension can be
# manually added simply by editing the script.
# Particularly, editing the MUS, PIC & VID arrays.

# list of previous files in order of modification
PFL=$(ls -c ~/Desktop)

# file types to look out for
MUS=(mp3 wav)
PIC=(jpg jpeg png gif)
VID=(mp4 mov flv avi)

# initiate while loop
while [ 0 -lt 1 ]; do

	# check to make sure file list is not the same
	NFL=$(ls -c ~/Desktop);
	if [ "$PFL" != "$NFL" ]; then

		# sleep
		sleep 3

		# directory has been modified
		# grap file name
		FILE=$(ls -c1 ~/Desktop | head -1)

		# grap file extension
		EXT=$(ls -c1 ~/Desktop | head -1 | sed "s|.*\.||")

		# check file extension against music
		for i in ${MUS[@]}; do
			# extension found
			if [ "$EXT" = "${i}" ]; then
				# move the file to appropriate directory
				$(mv ~/Desktop/${FILE} ~/Music)
			fi
		done

		# check file extension against pictures
		for i in ${PIC[@]}; do
			# extension found
			if [ "$EXT" = "${i}" ]; then
				# move to appropriate directory
				$(mv ~/Desktop/${FILE} ~/Pictures)
			fi
		done

		# check file extension against videos
		for i in ${VID[@]}; do
			# extension found
			if [ "$EXT" = "${i}" ]; then
				# move to appropriate directory
				$(mv ~/Desktop/${FILE} ~/Videos)
			fi
		done

	fi

done

