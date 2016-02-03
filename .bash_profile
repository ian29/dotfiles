# [[ -r ~/.bashrc ]] && . ~/.bashrc

# source ~/.bashrc
source "$(npm root -g)/mbxcli/mapbox.sh"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function mapbox_authed() {
    if [ -z $AWS_SESSION_TOKEN ]; then
        echo ""
    else
        echo "⎔ AUTHED "
    fi
}

export PS1="\[\033[01;34m\]\w \[\033[32m\]\$(parse_git_branch)\[\033[01;33m\] \$(mapbox_authed)\[\033[00m\]✿ "


# complete -C '/usr/local/aws/bin/aws_completer' aws

alias josm='java -jar -Xmx512M /Applications/josm-tested.jar'
alias mou='open -a Mou.app'
alias subl='open -a /Applications/Sublime\ Text.app/'
alias qgis='open -a /Applications/QGIS.app/'
alias grep='grep --color=auto'
alias start_postgres='pg_ctl -D /usr/local/var/postgres -l ~/.pg_log start'