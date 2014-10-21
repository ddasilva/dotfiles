#!/bin/bash
##############################################
# Installer for dot files, by Daniel da Silva.
# Email: <mail@danieldasilva.org>
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
		.bashrc)
                    if [ $(uname) == 'Darwin' ]; then
			dest=$HOME/.profile
		    else
			dest=$HOME
		    fi;;
		.emacs) dest=$HOME;;
		.gdbinit) dest=$HOME;;
		.gitconfig) dest=$HOME;;
		.screenrc) dest=$HOME;;
		.python_startup.py) dest=$HOME;;
		.emacs.d) dest=$HOME;;
                .ssh) dest=$HOME;;
                .vimrc) dest=$HOME;;
		*) dest=;;
	    esac
	
	    if [ -z "$dest" ]; then
		echo -e "${red}WARNING: Don't know where to put ${fname} ${no_red}"
	    else
		if [ -d files/$fname ]; then
		    shopt -s dotglob
		    cp -Rv files/$fname $dest
		else
		    cp -v files/$fname $dest
		fi
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

