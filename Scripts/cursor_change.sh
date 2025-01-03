#!/usr/bin/env bash

fifo="/tmp/themes_script.fifo"
mkfifo "$fifo"

declare -a themes
find /usr/share/icons -maxdepth 2 -type d  -name "cursors" -printf "%P\n" > "$fifo" &
find ~/.icons -maxdepth 2 -type d  -name "cursors" -printf "%P\n" >> "$fifo" &

while IFS= read -r line
do
        themes+=("${line%/*}")
done < "$fifo"
rm "$fifo"

echo ">>> Please enter the number of new theme for cursor"
select opt in "${themes[@]}"
do
     if [ $REPLY -le ${#themes} ]
     then
          gsettings set org.gnome.desktop.interface cursor-theme  \'$opt\' &&
          exit 0
     else
          echo "Improper argument" > /dev/stderr
          exit 1
     fi
done
