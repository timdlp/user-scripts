for f in *.mp3;do
  eyeD3 --rename='$artist - $title' "$f"
done
for f in *.mp3;do  
artist=`ffprobe -loglevel error -show_entries format_tags=artist -of default=noprint_wrappers=1:nokey=1 "$f"`
  title=`ffprobe -loglevel error -show_entries format_tags=title -of default=noprint_wrappers=1:nokey=1 "$f"`
  ARTIST=`echo $artist | awk '{print toupper($0)}'`
  TITLE=`echo $title | awk '{print toupper($0)}'`
  paren=`echo $title | awk -F"[()]" '{print $2}'`
  titNoPar=`echo $TITLE | awk -F"[()]" '{print $1}'`
  TITLE=`echo $titNoPar \($paren\)`
  eyeD3 -a "$ARTIST" -t "$TITLE" "$f"
done
