#########################################################
# Daniel da Silva's ~/.bashrc
# contact: mail@danieldasilva.org
#########################################################

export PATH=$HOME/bin:$HOME/Bin:$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib/:$LD_LIBRARY_PATH
export EDITOR="emacs -nw"
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
export PYTHONSTARTUP=$HOME/.python_startup.py

alias ipython="ipython --no-banner"
alias emaf="emacs -nw"
alias git_untracked='git ls-files . --exclude-standard --others'
alias ifind="find -iname"
alias iperl="perl -d -e 1"

if [ $(uname) != 'Darwin' ]; then
    alias ls="ls --color=auto"
    alias ll="ls -l"
    alias grep="grep --color"
    alias rgrep="rgrep --color"
fi

# ---------------------------------------------------------
# COLOR TABLE CONSTANTS

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

#-----------------------------------------------------------
# PS1 TABLE FOR COPY AND PASTING INTO ~/.bash_local
#
# Green/Blue     export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]"
# Yellow/Blue:   export PS1="\[\e[01;33m\]\u@\h\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[01;34m\]\W\$\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"
# Cyan/Gray:     export PS1="\[\033[01;36m\]\u@\h\[\033[01;30m\] \w$\[\033[00m\]"
# Blue/Purple:   export PS1="\[\e[01;34m\]\u@\h\[\e[0m\]\[\e[00;37m\]:\[\e[0m\]\[\e[01;35m\]\W\$\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"

if [ -f $HOME/.bash_local ]; then
    source $HOME/.bash_local
fi
