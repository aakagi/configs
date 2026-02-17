##############################
## pyenv
##############################

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

## Lazy-load pyenv — defers ~100ms of shell startup until first use
if command -v pyenv &>/dev/null; then
  _pyenv_load() {
    unset -f pyenv python python3
    eval "$(pyenv init -)"
  }
  pyenv()   { _pyenv_load; pyenv "$@"; }
  python()  { _pyenv_load; python "$@"; }
  python3() { _pyenv_load; python3 "$@"; }
fi

##############################
## python
##############################

alias pyrun='python manage.py runserver 0.0.0.0:8000'
alias pymm='python manage.py makemigrations && python manage.py migrate'

##############################
## poetry
##############################

alias po='poetry'
alias pos='poetry shell'
alias poa='poetry add'
alias poad='poetry add -D'
alias porm='poetry remove'
alias por='poetry run'

##############################
## pipx
##############################

export PATH="$PATH:$HOME/.local/bin"

##############################
## virtualenv
##############################

# Unset this variable or else running `zr` will clear the venv but not clear this variable so without it, it still looks like the venv is active.
unset VIRTUAL_ENV

alias pv='eval $(poetry env activate)'

function virtualenv_info {
  [[ -n "$VIRTUAL_ENV" ]] && echo "\e[32m($(basename $VIRTUAL_ENV))\e[0m "
}
