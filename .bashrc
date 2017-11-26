[ -z "$PS1" ] && return            # do nothing unless running interactively

# shell variables
HISTCONTROL=ignoredups:ignorespace # see HISTCONTROL in bash(1)
HISTSIZE=1000                      # see HISTSIZE in bash(1)
HISTFILESIZE=2000                  # see HISTFILESIZE in bash(1)

shopt -s checkwinsize              # update LINES and COLUMNS after each cmd
shopt -s histappend                # append to the history file, don't overwrite
shopt -s nocaseglob                # case insensitive globbing
shopt -s direxpand                 # required for dirspell to work
shopt -s dirspell                  # autocorrect tab complete

source ~/.bash/work.sh
source ~/.bash/path.sh
source ~/.bash/env.sh
source ~/.bash/functions.bash
source ~/.bash/aliases.sh
source ~/.bash/bindings.bash
source ~/.bash/prompt.sh
