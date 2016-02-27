#!/bin/bash

# Clean Desktop #
#
# Script for always keeping the desktop clean.
# So long as the script is running, anytime the
# user pastes anything on the desktop, the script
# should move it to the appropriate folder, based
# on the file's extension. File extension can be
# manually added simply by editing the script.

# list of previous files in order of modification
PFL=$(ls -c ~/Desktop)

# file types to look out for
MUS=(mp3 wav)
PIC=(jpg jpeg png gif)
VID=(mp4 mov flv avi)

# to move files to appropriate directories
function moveto {
	# properly set up the array
	declare -a arr=("${!4}")

	# check file extension against videos
	for i in ${arr[@]}; do
		# extension found
		if [ "$3" = "${i}" ]; then
			# move to appropriate directory
			$(mv ~/Desktop/${2} ${1})
		fi
	done
}

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
		moveto ~/Music $FILE $EXT MUS[@]

		# check file extension against pictures
		moveto ~/Pictures $FILE $EXT PIC[@]

		# check file extension againt videos
		moveto ~/Videos $FILE $EXT VID[@]

	fi

done
