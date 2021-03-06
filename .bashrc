# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi=42
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi=43
        else
            local ansi=45
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
            test "$branch" != master || branch=' '
        else
            # Detached HEAD.  (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                echo HEAD`)"
        fi
        echo -n '\[\e[0;37;'"$ansi"';1m\]'"$branch"'\[\e[0m\] '
    fi
}

# Print the name of the currently active virtual env.
function virtual_env() {
    local venv=$VIRTUAL_ENV
    if [ -n "$venv" ]; then
        name=`basename $venv`
        echo -n "\[\e[0;31m\]($name)\[\033[0m\]"
    fi
}

PATHS=("$HOME/.local/bin/" "$HOME/bin/" "$HOME/.cask/bin")

for P in "${PATHS[@]}"; do
    if [[ -d "$P" ]]; then
        PATH="$PATH:$P"
        export PATH
    fi
done

PY_PATH="$HOME/.osc-plugins/"

if [[ -d "$PY_PATH" ]]; then
    PYTHONPATH="$PYTHONPATH:$PY_PATH"
    export PYTHONPATH
fi

VIRTUALENVWRAPPER_SH="$HOME/.local/bin/virtualenvwrapper.sh"
if [[ -f "$VIRTUALENVWRAPPER_SH" ]]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
    source "$VIRTUALENVWRAPPER_SH"
fi

export _JAVA_OPTIONS='-Dswing.aatext=true -Dawt.useSystemAAFontSettings=lcd'

POWERLINE_PATH=$(find "$HOME/.local/" -iname 'powerline.sh' -type f | grep "bash")

if [[ -f "$POWERLINE_PATH" ]]; then
    export _POWERLINE_DIR=$(echo "$POWERLINE_PATH" | sed "s%bindings/.*%%")
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source "$POWERLINE_PATH"
fi

export TERMINAL="xfce4-terminal"

bind "set completion-ignore-case On"

alias ibs="osc --apiurl='https://api.suse.de' $*"
