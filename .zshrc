# TODO: understand this gobbledygook
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'      
zstyle ':completion:*:warnings' format '%BNo matches for: %d%b'        
autoload -Uz compinit
compinit

HISTFILE=$HOME/.zsh_hist
SAVEHIST=10000
HISTSIZE=10000

bindkey -e

source ~/.aliases
source ~/.zsh_prompt
source ~/.zsh_keymap
source ~/.zshrc.local

setopt autocd beep notify correct
export EDITOR=vim
export BROWSER=firefox
