[ -f ~/.bash_env        ] && . ~/.bash_env
[ -f ~/.bash_aliases    ] && . ~/.bash_aliases
[ -f ~/.bash_functions  ] && . ~/.bash_functions
[ -f ~/.rex-environment ] && . ~/.rex-environment

if [ ! -f ~/.yadm/first-time ]; then
    cd
    yadm reset --hard origin/master
    touch ~/.yadm/first-time
    cd -
    exec bash -l
fi

yadm pull

[ -r $HOME/.dataprinter ] && chmod g-w $HOME/.dataprinter
