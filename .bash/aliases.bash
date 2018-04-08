alias hg='history | grep --color=auto'
alias grep='grep --color=auto'
alias rg='rg --line-number --column --no-heading --colors path:none --colors line:none --colors match:style:bold --colors match:fg:green'
alias gf='git df | fzf --border'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -Fh --color=never'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias -- -='cd -'
alias cp='/bin/cp -v' 
alias mv='/bin/mv -v' 
alias rm='/bin/rm -v' 
alias ln='/bin/ln -v' 

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias irssi='TERM="screen-256color" irssi'
alias tunnel='autossh -v -R 9999:localhost:9999 -N -l eric iijo.org -p 4321'
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias t="$HOME/.dotfiles/bin/todo.sh -p -P"
alias tt="$HOME/.anyenv/envs/rbenv/shims/timetrap"
#alias p='sudo puppet apply --confdir=$HOME/.puppet ~/.puppet/manifests/site.pp -v'
alias p="watch -n 1 'ps awwwuxf | grep eric | grep -v awwwuxf'"
alias pw='genpass --minlength 15 --maxlength 15'
alias free='free -m'
alias findly='find . -name '
alias gdrive='grive'

alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias distupgrade='sudo apt-get dist-upgrade'
alias search="apt-cache search"
alias show="apt-cache show"

alias sstart='sudo systemctl start '
alias sstop='sudo systemctl stop '
alias sstatus='sudo systemctl status '
alias srestart='sudo systemctl restart '

alias minicpanm='cpanm --mirror ~/minicpan --mirror-only'
alias darkpan='cpanm --mirror http://mycompany.co.uk/DPAN --mirror-only'
alias pod='perlfind'
alias perl5lib='perl -E "say join \"\n\", split \":\", \$ENV{PERL5LIB}"'
alias static="plackup -e 'use Plack::Builder; builder { enable 'Static', path => qr{.*}, root => \".\" }'"

alias GET='lwp-request -m GET '
alias PUT='lwp-request -m PUT '
alias POST='lwp-request -m POST '
alias HEAD='lwp-request -m HEAD '

alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gcd='cd "$(git rev-parse --show-toplevel)"'
alias mysql2csv='sed '\''s/\t/","/g;s/^/"/;s/$/"/;s/\n//g'\'''

alias reload="exec bash -l"

alias tree="tree -I local"
alias env="env | sort"

alias scrot="gnome-screenshot"

# local bashrc
[ -f $HOME/.bashrc.local ] &&
   . $HOME/.bashrc.local

# vim: set ft=bash
