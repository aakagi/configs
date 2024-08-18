# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# python
alias pyrun='python manage.py runserver 0.0.0.0:8000'
alias pymm='python manage.py makemigrations && python manage.py migrate'

# poetry
alias po='poetry'
alias pos='poetry shell'
alias poa='poetry add'
alias poad='poetry add -D'
alias porm='poetry remove'
alias por='poetry run'
