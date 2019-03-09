# vim: set ft=zsh sw=2 ts=2 sts=2 et ai:

zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BNo matches for: %d%b'
autoload -Uz compinit
# Only regen zcompdump once daily; new shells hideously slow to load otherwise.
if [[ "$(uname)" == "darwin" ]]; then
  [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ] && compinit || compinit -C
elif [[ "$(uname)" == "Linux" ]]; then
  [ $(date +'%F') != $(stat -c '%y' ~/.zcompdump | cut -d' ' -f1) ] && compinit || compinit -C
fi

# Apparently ^X^E isn't standard like in Bash...
# ...also, yes, I edit in Vi but use Emacs movements in the shell.
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

HISTFILE=$HOME/.zsh_hist
SAVEHIST=10000
HISTSIZE=10000

bindkey -e

setopt autocd nobeep notify correct noglobdots longlistjobs interactivecomments
export EDITOR=nvim

# TODO: don't source if nonexistent (abstract into function?)

# Source prompt only in interactive sessions.
[[ $- = *i* ]] && source ~/.zsh_prompt
[[ $- = *i* ]] && source ~/.zsh_aliases

source_if_file () {
  [[ -f $1 ]] && source $1
}
source_if_file ~/.aliases
source_if_file ~/.zsh_keymap
source_if_file ~/.zsh_local
