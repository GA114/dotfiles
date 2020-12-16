# vim: set ft=zsh sw=2 ts=2 sts=2 et ai:
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

setopt nobeep notify correct noglobdots longlistjobs interactivecomments histignorespace
export EDITOR=nvim

# Source prompt only in interactive sessions.
[[ $- = *i* ]] && source ~/.zsh_prompt && source ~/.zsh_aliases

source_if_file () {
  [[ -f $1 ]] && source $1 || :
}
source_if_file ~/.aliases
source_if_file ~/.zsh_keymap
source_if_file ~/.zsh_local
source_if_file ~/.p10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
