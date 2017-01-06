[ -f ~/.bash_env        ] && . ~/.bash_env
[ -f ~/.bash_aliases    ] && . ~/.bash_aliases
[ -f ~/.bash_functions  ] && . ~/.bash_functions
[ -f ~/.rex-environment ] && . ~/.rex-environment

if [ ! -f ~/.yadm/first-time ]; then
    cd
    yadm reset --hard origin/master
    yadm submodule init
    yadm submodule update
    touch ~/.yadm/first-time
    cd -
    exec bash -l
else
    yadm submodule init
    yadm submodule update
fi
