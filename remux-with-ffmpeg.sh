#!/bin/bash

COLOR_INPUT=(-color_primaries bt470bg -color_trc iec61966-2-4)
COLOR_OUTPUT=(-pix_fmt yuv420p -vf "colorspace=all=bt709" -color_range tv -colorspace bt709 -color_primaries bt709)

while [ 1 ]
do
	case "$1" in
		--no-input-colorspace)
			COLOR_INPUT=()
			;;
		--no-output-colorspace)
			COLOR_OUTPUT=()
			;;
		--*)
			echo "Unknown flag \"$1\""
			exit 1
			;;
		*)
			break
			;;
	esac
	shift
done

if [ $# -lt 3 ]
then
	echo "Usage:  $(basename "$0") [--no-input-colorspace] [--no-output-colorspace] <MXV demux directory> <framerate> <ffmpeg output options ...>"
	exit 1
fi

DEMUX_DIR="$1"
FRAMERATE="$2"
shift 2


VIDEO="$DEMUX_DIR"/video-%06d.jpeg
AUDIO="$DEMUX_DIR"/audio.wav

(set -x ; ffmpeg "${COLOR_INPUT[@]}" -framerate "$FRAMERATE" -i "$VIDEO" -i "$AUDIO" "${COLOR_OUTPUT[@]}" "$@")
