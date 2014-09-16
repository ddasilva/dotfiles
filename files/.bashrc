#########################################################
# Daniel da Silva's ~/.bashrc
# contact: mail@danieldasilva.org
#########################################################

# --------------------- Personal Aliases/Exports ------------------------- #

alias ipy="ipython"
alias emaf="emacs -nw"
alias git_untracked='git ls-files . --exclude-standard --others'
alias f="find -name "
alias ifind="find -name"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias iperl="perl -d -e 1"

if [ $(uname) != 'Darwin' ]; then
    alias ls="ls --color=auto"
    alias ll="ls -l"
    alias grep="grep --color"
    alias rgrep="rgrep --color"
fi


export PATH=$HOME/bin:$HOME/Bin:$HOME/.local/bin:/tools/gdaac/TS2/bin:/tools/gdaac/TS1/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib/:$LD_LIBRARY_PATH
export EDITOR="emacs -nw"
export Y_DEV_KEY="AI39si4J3y3x67SL4SOyCSKUTQ9lk6r-taAoWd9oCars9G7COACM2QVIquCFm1om9NHBYsSBGmWeqeRU_30XkJuvVW68AJC3nQ"
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
export PYTHONSTARTUP=$HOME/.python_startup.py

etags_build() {
    if [ $(which etags) ]; then
        (find . -name '*.[ch]'
         find . -name '*.cpp'
         find . -name '*.py'
         find . -name '*.java'
         find . -name '*.js'
        ) | grep -ve '^./build' | grep -v "CVS/Base" | sort | xargs etags -a
    else
	echo "etags not installed"
    fi
}

rm_pyc() {
    find . -name '*.pyc' | xargs rm
}

short() {
    export OLD_PS1=$PS1
    export PS1="$ "
}

long() {
    export PS1=$OLD_PS1
}

cvs_recent() {
    cvs log -d ">=$1" -N -S -R 
}

cvs_today() {
    cvs_recent $(date +%Y-%m-%d)
}


# ---------------- Stop Here if not running interactively ---------------- #

[ -z "$PS1" ] && return

# ----------------------------- Misc Settings ---------------------------- #

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s checkwinsize

#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# -------------------- Determine Terminal coloring ----------------------- #

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
else
    case "$TERM" in
	xterm-color) color_prompt=yes;;
	*) color_prompt=;;
    esac
fi

# -------------------- Set up $PS1 (Shell Prompt) ----------------------- #

if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ "$color_prompt" = yes ]; then
    if [ "$(id -u)" == "0" ]; then
	# Root prompt, regardless of serve
	PS1="\[\033[01;31m\]\h\[\033[01;37m\]:\w\[\033[00m\]$ "
    else       
	case $(hostname) in
	# Desktops
	    verlaine)
		PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ";;
	    
	# Personal Servers
	    rainbowroad.org | meltingwax.xen.prgmr.com | rapids )
		PS1="\[\033[01;35m\]\u@\h\[\033[01;30m\] \w\$\[\033[00m\] ";;
	    
	# Work Servers
	    s4ptnew.gesdisc.eosdis.nasa.gov | s4pt | gsocial | monet )
                PS1="\[\e[01;33m\]\u@\h\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[01;34m\]\W\\$\[\e[0m\]\[\e[00;37m\] \[\e[0m\]";;

	# Devices
	    raspberrypi )
		PS1="\[\033[01;36m\]\u@\h\[\033[01;30m\] \w\$\[\033[00m\] ";;

	# Default
	    *)
		PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w$\[\033[00m\] ";;
	esac
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt

if [ -f $HOME/.bash_local ]; then
    source $HOME/.bash_local
fi
