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
source ~/.zsh_keymap
source ~/.zsh_local

# Source prompt only in interactive sessions.
[[ $- = *i* ]] && source ~/.zsh_prompt
[[ $- = *i* ]] && source ~/.zsh_aliases

[[ -f $HOME/.dircolors ]] &&  eval $(dircolors -b $HOME/.dircolors)

setopt autocd nobeep notify correct noglobdots longlistjobs interactivecomments
export EDITOR=vim
export BROWSER=firefox:lynx

export LYNX_CFG=$HOME/.lynxcfg
export PATH="$PATH:$HOME/bin"
