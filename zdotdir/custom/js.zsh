##
## nvm
##

export NVM_DIR="$HOME/.nvm"

## Lazy-load nvm — defers ~300ms of shell startup until first use
if [ -s "$NVM_DIR/nvm.sh" ]; then
  _nvm_load() {
    unset -f nvm node npm npx
    \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  }
  nvm()  { _nvm_load; nvm "$@"; }
  node() { _nvm_load; node "$@"; }
  npm()  { _nvm_load; npm "$@"; }
  npx()  { _nvm_load; npx "$@"; }

  ## Auto-load nvmrc when entering a directory
  autoload -U add-zsh-hook
  load-nvmrc() {
    if [ -f .nvmrc ]; then
      _nvm_load
      nvm use --silent
    elif [ -n "$NVM_RC_VERSION" ]; then
      _nvm_load
      nvm use default --silent
    fi
  }
  add-zsh-hook chpwd load-nvmrc
  load-nvmrc
fi
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

# alias y='yarn'
# alias ya='yarn add'
# alias ys='yarn start'
# alias yad='yarn add -D'
# alias yrm='yarn remove'
# alias yl='yarn lint'
# alias yd="yarn dev"
# alias yt='yarn test' # typescript
# alias yb='yarn build'
# alias ysb='yarn storybook dev -p 6006'
# alias yp='yarn prisma'

_detect_pm() {
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    [[ -f "$dir/pnpm-lock.yaml" ]] && echo "pnpm" && return
    [[ -f "$dir/yarn.lock" ]] && echo "yarn" && return
    [[ -f "$dir/package-lock.json" ]] && echo "npm" && return
    dir="$(dirname "$dir")"
  done
  echo "yarn"
}

# Run a package.json script (adds "run" and "--" for npm)
_pm_run() {
  local pm="$(_detect_pm)"
  if [[ "$pm" == "npm" ]]; then
    if (( $# > 1 )); then
      npm run "$1" -- "${@:2}"
    else
      npm run "$1"
    fi
  else
    "$pm" "$@"
  fi
}

# Functions (handle direct enter without expansion)
y()   { "$(_detect_pm)" "$@"; }
ya()  { "$(_detect_pm)" add "$@"; }
yad() { "$(_detect_pm)" add -D "$@"; }
yrm() { "$(_detect_pm)" remove "$@"; }
ys()  { "$(_detect_pm)" start "$@"; }
yt()  { "$(_detect_pm)" test "$@"; }
yl()  { _pm_run lint "$@"; }
yd()  { _pm_run dev "$@"; }
yb()  { _pm_run build "$@"; }
ysb() { _pm_run storybook dev -p 6006 "$@"; }
yp()  { _pm_run prisma "$@"; }

# Expansion lookup
typeset -A _y_expand=(
  [y]=""
  [ya]="add"
  [ys]="start"
  [yad]="add -D"
  [yrm]="remove"
  [yl]="lint"
  [yd]="dev"
  [yt]="test"
  [yb]="build"
  [ysb]="storybook dev -p 6006"
  [yp]="prisma"
)

# Scripts that need "run" with npm
typeset -A _y_npm_run=([lint]=1 [dev]=1 [build]=1 [storybook]=1 [prisma]=1)

globalias() {
  if [[ -n "${_y_expand[$LBUFFER]+x}" ]]; then
    local pm="$(_detect_pm)"
    local args="${_y_expand[$LBUFFER]}"

    if [[ -z "$args" ]]; then
      LBUFFER="$pm"
    else
      local script="${args%% *}"
      if [[ "$pm" == "npm" && -n "${_y_npm_run[$script]+x}" ]]; then
        if [[ "$args" == *" "* ]]; then
          LBUFFER="$pm run $script -- ${args#* }"
        else
          LBUFFER="$pm run $args"
        fi
      else
        LBUFFER="$pm $args"
      fi
    fi
  fi

  zle _expand_alias
  zle expand-word
  zle self-insert
}
zle -N globalias
bindkey " " globalias


##
## pnpm
##

alias pn=pnpm
alias pna='pnpm add'
alias pnad='pnpm add -D'
alias pnrm='pnpm rm'
alias pnd='pnpm dev'
alias pni='pnpm install'

export PNPM_HOME="$HOME/Library/pnpm"
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
