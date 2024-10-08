# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jgund/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Add in the zsh aliases
if [[ -f ~/.zshrc_aliases ]]; then
  source ~/.zshrc_aliases
else
  touch ~/.zshrc_aliases
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Enable starship
eval "$(starship init zsh)"

eval "$(zoxide init zsh)"

FILES_TO_EXCLUDE='.cache,.cargo,dotfiles,.git,go,.local,.mozilla'
source <(fzf --zsh)
export FZF_DEFAULT_COMMAND='fd -f'
export FZF_CTRL_T_OPTS='--walker-skip ${FILES_TO_EXCLUDE} -m --preview="bat -n --color=always {}"'
_fzf_compgen_path() {
  fd --hidden --follow --exclude ${FILES_TO_EXCLUDE} . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ${FILES_TO_EXCLUDE} . "$1"
}

export EDITOR=nvim

export PATH=$PATH:/usr/local/go/bin
