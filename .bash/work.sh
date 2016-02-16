[ -f ~/.bash_aliases    ] && . ~/.bash_aliases
[ -f ~/.bash_functions  ] && . ~/.bash_functions
[ -f ~/.rex-environment ] && . ~/.rex-environment

if [ ! -f ~/.yadm/first-time ]; then
    cd
    yadm reset --hard origin/master
    yadm submodule init
    yadm submodule update
    touch ~/.yaadm/first-time
    exec bash -l
fi
