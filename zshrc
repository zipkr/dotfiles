#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

setxkbmap -option caps:escape
alias vim="nvim"

export IC="$HOME/go/src/github.com/zipkr/ic/"
export PATH="$HOME/go/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export GOPATH="$HOME/go"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
