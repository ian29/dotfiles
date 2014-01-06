# paths

export PATH=$PATH:$HOME/.rvm/bin
export PATH=/usr/local/bin:$PATH
export CXXFLAGS="-mmacosx-version-min=10.9":$PATH

# colors

function _update_ps1() {
  export PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

export PROMPT_COMMAND="_update_ps1"
export LSCOLORS=GxFxCxDxBxegedabagaced

# laziness

alias josm='java -jar -Xmx512M /Applications/josm-tested.jar'
alias mou='open -a Mou.app'
alias subl='open -a /Applications/Sublime\ Text.app/'
alias qgis='open -a /Applications/QGIS.app/'
alias grep='grep --color=auto'
alias start_postgres='pg_ctl -D /usr/local/var/postgres -l ~/.pg_log start'

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
