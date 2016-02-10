[ -f ~/.bash_aliases    ] && . ~/.bash_aliases
[ -f ~/.bash_functions  ] && . ~/.bash_functions
[ -f ~/.rex-environment ] && . ~/.rex-environment

if [ ! -f ~/.vim/bundle/vim-fugitive/.git ]; then
    yadm submodule init
    yadm submodule update
fi
