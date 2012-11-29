#!/bin/bash
##############################################
# Installer for dot files, by meltingwax.
# Daniel da Silva <daniel@meltingwax.net>
##############################################

usage() {
    echo "Usage: $0 [FILE [FILE [...]]]"
}

normal() {
    local red='\e[0;31m'
    local no_red='\e[0m'
    
    # Loop through file names
    for fname in "$@"; do
	last_char=${fname:(-1)}
	
	if [[ "$last_char" != '~' && "$last_char" != '#' ]]; then
	    case "$fname" in
		".bashrc") dest="$HOME";;
		".gitconfig") dest="$HOME";;
		*) dest=;;
	    esac
	
	    if [ -z "$dest" ]; then
		echo -e "${red}WARNING: Don't know where to put ${fname} ${no_red}"
	    else
		cp -v files/$fname $dest
	    fi
	fi
    done
}

# -------------------------------- Main Code ---------------------------- #

case "$1" in
    "-h")
	usage;;
    "--help")
	usage;;
    *)
	if [ $# -gt 0 ]; then
	    normal $@;
	else
	    normal $(ls -A files/)
	fi;;
esac

