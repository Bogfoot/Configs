#!/bin/bash
function pyupg()
{
	echo "Running pip freeze"
	echo "Creating reqs.txt"
	pip3 freeze > reqs.txt
	ls reqs.txt
	echo "Running upgrades"
	pip3 install -r reqs.txt --upgrade
	echo "Removing reqs.txt"
	rm -v reqs.txt 
} 
function dsize ()
{
        dust $1 
}
 function reqs() 
{
        pip3 install -r $1
}
function ntdir(){
	echo "Creating directory called $1"
	mkdir ~/Notes/$1
	mkdir ~/Notes/$1/zadaci_$1
	mkdir ~/Notes/$1/sections
	touch ~/Notes/$1/sections/$1_1.tex
	echo "Copying *.tex files to ~/Notes/$1"
	cp ~/Notes/*.tex ~/Notes/$1/
	cp ~/Notes/*.sh ~/Notes/$1/
	cp ~/Notes/*.bib ~/Notes/$1/
	cp ~/Notes/.gitignore ~/Notes/$1/
	mv ~/Notes/$1/template.tex ~/Notes/$1/$1.tex
	echo "Moving working directory to ~/Notes/$1"
	cd ~/Notes/$1
	git init
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

function booksearch(){
	fdfind --regex --glob $@ ~/Desktop/Prezentacije\ za\ faks/
}

function openbook(){
	xdg-open "$(booksearch $@)"
}

function spacemv(){
find $@ -type f -name '*.pdf' -exec bash -c 'dir=$(dirname "$0"); file=$(basename "$0"); new_file=$(echo "$file" | sed "s/_\+/_/g"); mv "$0" "$dir/$new_file"' {} \;
}

#turns double space '  ' into underscore '_', and double underscore '__' into underscore '_'
function spacerm(){
find $@ -type f -name '*.pdf' -exec bash -c 'dir=$(dirname "$0"); file=$(basename "$0"); new_file="${file// /_}"; mv "$0" "$dir/$new_file"' {} \;
}

function move_specific_files() {
    local source_dir="$1"
    local destination_dir="$2"

    rsync -av --dry-run --itemize-changes --include="*.pdf" --include="*.djvu" --include="*.epub" "$source_dir" "$destination_dir"
}

function note() {
	echo "Date: $(date)" >> $HOME/Notes/PhDNotes/PHD/RandomNotes.norg
	echo "$@" >> $HOME/Notes/PhDNotes/PHD/RandomNotes.norg
	echo "" >> $HOME/Notes/PhDNotes/PHD/RandomNotes.norg
}
