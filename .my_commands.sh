#!/bin/bash
function dsize ()
{
        du -sh $1 
}
 function reqs() 
{
        pip3 install -r $1
}
function ntdir(){
	mkdir ~/Notes/$1
	mkdir ~/Notes/$1/zadaci_$1
	cp ~/Notes/*.tex ~/Notes/$1/
	mv ~/Notes/$1/template.tex ~/Notes/$1/$1.tex
	cd ~/Notes/$1
}
    
function loc()
{
        locate -b $1
        locate -c $1
}

function rmdir ()
{
        rm -rfv "$@"
}

function cpdir ()
{
        cp -R "$1" "$2"
}
# function LDir ()
# {
# for entry in "ls -R $1"/*
# do
#   echo "$entry"
# done
# }

function check_connected()
{
		local connected_monitors=()
    local monitor
    for monitor in $(xrandr --listactivemonitors | awk '{print $4}'); do
        connected_monitors+=("$monitor")
    done
		xrandr --output ${connected_monitors[2]} --same-as ${connected_monitors[1]}
}
function check_displays(){
		xrandr --listactivemonitors | awk '{print $4}'
}
function mic_togg(){
		amixer sset Capture cap
}
function pdf(){ 
	pdflatex -synctex=1 -interaction=nonstopmode $1
}
function gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;}
