##
## nvm
##

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

## Always load nvmrc when entering a directory
autoload -U add-zsh-hook
load-nvmrc() {
  if [ -f .nvmrc ]; then
    nvm use --silent
  elif [ -n "$NVM_RC_VERSION" ]; then
    nvm use default --silent
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
# /end

##
## npm
##

alias ns="npm start"
alias nr="npm run"
alias nrd="npm run dev"
alias na="npm add"

## list npm versions of package
npmv() {
  npm view $1 versions
}

##
## yarn
##

alias y='yarn'
alias ya='yarn add'
alias ys='yarn start'
alias yad='yarn add -D'
alias yrm='yarn remove'
alias yl='yarn lint'
alias yd="yarn dev"
alias yt='yarn test' # typescript
alias yb='yarn build'
alias ysb='yarn storybook dev -p 6006'
alias yp='yarn prisma'

##
## pnpm
##

alias pn=pnpm
alias pna='pnpm add'
alias pnad='pnpm add -D'
alias pnrm='pnpm rm'
alias pnd='pnpm dev'
alias pni='pnpm install'

export PNPM_HOME="/Users/akagi/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

##
## Bun
##

## bun completions
## I commented out the following line because it wasn't working but using `add_path` below worked.
# [ -s "/Users/akagi/.bun/_bun" ] && source "/Users/akagi/.bun/_bun"
add_path "/Users/akagi/.bun/bin"

