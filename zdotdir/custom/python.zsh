##############################
## pyenv
##############################

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv &>/dev/null && eval "$(pyenv init -)"

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

###
# TODO 2025-03-16: Set these up in a hurry, would be good to get them cleaned up.

# Created by `pipx` on 2025-03-16 20:11:13
export PATH="$PATH:/Users/akagi/.local/bin"

# Unset this variable or else running `zr` will clear the venv but not clear this variable so without it, it still looks like the venv is active.
unset VIRTUAL_ENV

alias pv='eval $(poetry env activate)'

# https://stackoverflow.com/a/58574111
function virtualenv_info {
  # [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
  # PROMPT+='%{$fg[green]%}$(virtualenv_info)%{$reset_color%}%'
  # Had to update to this because `${` would show up in vscode
  [[ -n "$VIRTUAL_ENV" ]] && echo "\e[32m($(basename $VIRTUAL_ENV))\e[0m "
}
###
