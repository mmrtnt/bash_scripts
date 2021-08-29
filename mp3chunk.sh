#!/bin/bash

echo ""

if [ $# -lt 4 ] 
then
	echo "Not enough args, INPUT_FILE SS_POS LENGTH OUTPUT_FILE
";
	exit;
fi

FILE=$1
EXT=`echo "$FILE" | sed -e 's/^.*\.//'`
NAME=`basename "$FILE" ".$EXT"`

START=$2
FSTART=`echo $START | sed -e 's/://g'`
END=$3
LEN=$END
OUT="${4}.mp3"

REC="$NAME-${FSTART}_${LEN}.mp3"

echo "NAME  = $NAME"
echo "EXT   = $EXT"
echo "START = $START"
echo "END   = $LEN"
echo "LEN   = $END"
echo "OUT   = $OUT"
echo ""

#mencoder $1 -ovc null -oac lavc -lavcopts acodec=mp3 -noskip -ss 330 -endpos 400 -o $2
#mencoder CryBaby.vob -ovc frameno -oac mp3lame -lameopts  br=128 -noskip -ss 3355 -endpos 120  -o ./part1.vob
#mencoder $FILE -ovc frameno -oac mp3lame -lameopts br=128 -noskip -ss $START -endpos $ENDPOS -o ./$NAME-${START}_${END}.avi
#mplayer -dumpaudio -dumpfile $2 ./part1.avi 
#mencoder "${file}" -of rawaudio -oac mp3lame -ovc copy -o "${file%.*}.mp3"
#rm ./part1.avi
#ENDPOS=$((END-START))
#ENDPOS=${ENDPOS/-/}

#mencoder -quiet $FILE -of rawaudio -oac mp3lame -lameopts cbr:br=320 -ovc copy -ss $START -endpos $END -o $NAME-${FSTART}_${LEN}.mp3
#mencoder -quiet $FILE -of rawaudio -oac mp3lame -ovc copy -ss $START -endpos $END -o $NAME-${FSTART}_${LEN}.mp3

#ffmpeg -i $FILE -vn -ar 44100 -ac 2 -ab 192 -ss $START -t $LEN -f mp3 $NAME-${FSTART}_${LEN}.mp3 

#ffmpeg -i /mnt/mhoff/video/tv/1024_20131103014500.mpg -vn -ar 44800 -ac 2 -ab 192 -ss 4060 -t 40 -f mp3 sound.mp3
#ffmpeg -i /mnt/mhoff/video/tv/1024_20131103014500.mpg -vn -ar 44800 -ac 2 -ab 192 -ss 4060 -t 40 -f mp3 1024_20131001013000-4060_40.mp3

CMD="ffmpeg -i ${FILE} -vn -ar 44100 -ac 2 -ab 192k -ss ${START} -t ${LEN} -f mp3 ${REC}"
#echo "
#CMD = $CMD
#"

# These options are in the alias to ffmpeg
#ffmpeg -hide_banner -loglevel quiet -stats -i "$FILE" -vn -ar 44100 -ac 2 -ab 192k -ss $START -t $LEN -f mp3 "${REC}"
ffmpeg -i "$FILE" -vn -ar 44100 -ac 2 -ab 192k -ss $START -t $LEN -f mp3 "${REC}"

#clear 

mplayer "$NAME-${FSTART}_${LEN}.mp3" 2>/dev/null

echo "
  Keep? ${OUT} y/n
"

read -rsn1 INPUT
if [ "${INPUT}" = "y" ]; then 
	echo "
	Moving to ${REC} to ${OUT}
"           
	mv "${REC}" "${OUT}"
else
	echo "
	Deleting ${REC}
" 
	rm -f "${REC}"
fi


