# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# npm
alias ns="npm start"
alias nr="npm run"
alias nrd="npm run dev"
alias na="npm add"

# list npm versions of package
npmv() {
  npm view $1 versions
}

# yarn
alias y='yarn'
alias ya='yarn add'
alias ys='yarn start'
alias yad='yarn add -D'
alias yrm='yarn remove'
alias yl='yarn lint'
alias yd="yarn dev"
alias yt='yarn test' # typescript
alias yb='yarn build'
alias ysb='yarn storybook'
alias yp='yarn prisma'

# Might want to enable these? I forget why I disabled them...
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# export PATH="`yarn global bin`:$PATH"

# yarn left-hand-only shortcuts (exit w/ ctrl+c, quickly restart w/ left hand only)
alias st="yarn start"
alias ddd="yarn dev"

# yarn workspaces
alias yw='yarn workspace'
alias yws='yarn workspaces'
alias yadw='yarn add -D -W'

# pnpm (monorepo)
alias pn=pnpm
alias pna='pnpm add'
alias pnad='pnpm add -D'
alias pnrm='pnpm rm'
