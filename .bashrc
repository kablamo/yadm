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

source ~/.bash/work.bash
source ~/.bash/path.bash
source ~/.bash/env.bash
source ~/.bash/functions.bash
source ~/.bash/aliases.bash
source ~/.bash/bindings.bash
source ~/.bash/prompt.bash
