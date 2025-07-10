#!/bin/bash

DIR=$(dirname "$0")
DEMUXER="$DIR"/bin/mxv-demuxer
REMUXER="$DIR"/remux-with-ffmpeg.sh

if [ $# -lt 3 ]
then
	echo "Usage:  $(basename "$0") <MXV file> <framerate> <ffmpeg output options ...>"
	exit 1
fi

INPUT="$1"
DEMUX_DIR="${INPUT}-demuxed"
shift


"$DEMUXER" "$INPUT" || exit 1
[ -d "$DEMUX_DIR" ] || exit 1

"$REMUXER" "$DEMUX_DIR" "$@" || exit 1

echo "Removing temporary demux directory \"$DEMUX_DIR\"..."
rm -r "$DEMUX_DIR"
