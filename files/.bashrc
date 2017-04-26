#########################################################
# Daniel da Silva's ~/.bashrc
# contact: mail@danieldasilva.org
#########################################################

alias ipy="ipython"
alias emaf="emacs -nw"
alias git_untracked='git ls-files . --exclude-standard --others'
alias f="find -name "
alias ifind="find -iname"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias iperl="perl -d -e 1"

if [ $(uname) != 'Darwin' ]; then
    alias ls="ls --color=auto"
    alias ll="ls -l"
    alias grep="grep --color"
    alias rgrep="rgrep --color"
fi

export PATH=$HOME/bin:$HOME/Bin:$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib/:$LD_LIBRARY_PATH
export EDITOR="emacs -nw"
export Y_DEV_KEY="AI39si4J3y3x67SL4SOyCSKUTQ9lk6r-taAoWd9oCars9G7COACM2QVIquCFm1om9NHBYsSBGmWeqeRU_30XkJuvVW68AJC3nQ"
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
export PYTHONSTARTUP=$HOME/.python_startup.py
export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
	   
if [ -f $HOME/.bash_local ]; then
    source $HOME/.bash_local
fi
