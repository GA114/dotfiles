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

<<<<<<< HEAD
setopt autocd nobeep notify correct noglobdots longlistjobs interactivecomments
=======
>>>>>>> 80a8de040e38fc82ee9b470bb418f8e105b3833d
[[ -f $HOME/.dircolors ]] &&  eval $(dircolors -b $HOME/.dircolors)

setopt autocd nobeep noclobber notify correct noglobdots longlistjobs
export EDITOR=vim
export BROWSER=firefox:lynx
export LYNX_CFG=$HOME/.lynxcfg
export PATH="$PATH:$HOME/bin"
