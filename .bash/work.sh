[ -f ~/.bash_aliases    ] && . ~/.bash_aliases
[ -f ~/.bash_functions  ] && . ~/.bash_functions
[ -f ~/.rex-environment ] && . ~/.rex-environment

if [ -d ~/.yadm ]; then
    cd
    yadm pull > /dev/null 2>&1 
    if [ ! -f ~/.vim/bundle/vim-fugitive/.git ]; then
        yadm submodule init
        yadm submodule update
        exec bash -l
    fi
fi
