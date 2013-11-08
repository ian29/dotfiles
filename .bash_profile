# paths

export PATH=/usr/local/bin:$PATH
# export CXXFLAGS="-mmacosx-version-min=10.8":$PATH

# colors

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git::\1)/'
}

if [ $TERM = 'dumb' ] ; then
   # No color, no unicode.
   export PS1="\w \$(parse_git_branch) > "
else
   export PS1="\[\033[01;34m\]\w \[\033[32m\]\$(parse_git_branch)\[\033[00m\] ▶ "
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# laziness

alias josm='java -jar -Xmx512M /Applications/josm-tested.jar'
alias mou='open -a Mou.app'
alias subl='open -a /Applications/Sublime\ Text\ 2.app/'
alias qgis='open -a /Applications/QGIS.app/'
alias grep='grep --color=auto'

# boxes

alias sshtm='ssh -CA -L20009:localhost:20009 -L20008:localhost:20008'

# lil helpers

function path() {
	echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1") | tr -d '\n' | pbcopy
}

function img_enc() {
  openssl enc -base64 -in $1 | tr -d '\n' | pbcopy
}

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM

## eats web mercator coordinates, outputs lat lon
function coords() {
	psql -d gis -c "select st_astext(st_transform(st_geomfromtext('POINT($1 $2)',3857),4326))"
}