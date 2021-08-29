# bash_scripts
A collection of small bash utility scripts for reference and use

**mp3chunk.sh**

This script will extract audio from a video file using ffmpeg.

On the command line, give the name of the video file, the offset (-ss/seconds in ffmpeg args) and the length also in ss/seconds, and an MP3 file name to write to.

Once the chunk is made, it is played back and then the user is asked to confirm saving.

Probably best used wearing headphones.

There are *many* commented-out lines left in the script for reference.

EXAMPLE:

  `mp3chunk.sh my_special_video.mp4 3010 20 audio_clip-1.mp3`

The ss/seconds numbers can be determined by playing the video in mplayer from the command line and watching the output in the terminal.


