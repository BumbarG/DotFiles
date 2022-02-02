
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
emulate zsh -c "$(direnv export zsh)"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
emulate zsh -c "$(direnv hook zsh)"

path=('/Users/galbumbar/go/bin' $path)
export EDITOR=nvim
typeset -U PATH
bindkey -v # vim keybindings

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    # zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-vi-mode
    fzf
    kubectl
    )
# zsh completions thing
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# kubectl () {
#     command kubectl $*
#     if [[ -z $KUBECTL_COMPLETE ]]
#     then
#         source <(command kubectl completion zsh)
#         KUBECTL_COMPLETE=1 
#     fi
# }

source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit
# gpg and ssh something
export GPG_TTY=$TTY
# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)


unsetopt share_history

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
