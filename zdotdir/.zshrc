#!/usr/bin/env zsh

###################################################################################################
# -- .zshrc --
# Typically reserved for things that are not inheritable by subshells
# aliases, functions, custom prompts, history customizations, etc.
###################################################################################################

##############################
# -- oh-my-zsh --
##############################

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to custom oh-my-zsh plugins.
export ZSH_CUSTOM="$ZDOTDIR/custom"

# Set zsh theme.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git        # git shortcuts
  globalias  # expand aliases
  poetry     # [python] poetry completions
  virtualenv # [python] sets $VIRTUAL_ENV and shows in theme
)

##############################
# -- homebrew --
##############################

# Add `brew` to path.
[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

##############################
# -- orbstack --
##############################

# Add `orb` to path and its completions to fpath (must run before oh-my-zsh calls compinit).
[[ -r ~/.orbstack/shell/init.zsh ]] && source ~/.orbstack/shell/init.zsh

#######################################################################################
# -- Load `oh-my-zsh` --
source $ZSH/oh-my-zsh.sh
# This should always go last!
# zsh files in `zdotdir/custom` should load next, in alphabetical order.
# END: Remove anything below here and re-organize it, it was likely added by a script.
#######################################################################################
