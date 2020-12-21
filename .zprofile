
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
# source "$(npm root -g)/@mapbox/mbxcli/bin/mapbox.sh"

alias weather='curl http://wttr.in/'
alias weather2='curl http://v2.wttr.in/'

alias ls="ls -lh" 

# mapbox-credentials setup 
export AWS_PROFILE=default

