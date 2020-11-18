# set language
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# path
# alias python=python3
# alias pip=pip3
alias ec='emacsclient -t -a ""'
alias tmux="tmux -u"
alias ll="exa -alig"
alias ls="exa"
eval $(thefuck --alias)
export GOPATH=/Users/mohenoo/Development/go
export GOBIN=$GOPATH/bin
export PATH=$PYTHONPATH:$GOBIN:$PATH
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

alias vim=nvim
#alias cat=bat

#fzf
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
'
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.vim,.vscode} --type f"
    
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# # Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--reverse --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--select-1 --exit-0 --preview 'tree -C {} | head -200'"

#kitty
# autoload -Uz compinit
# compinit
# Completion for kitty
# kitty + complete setup zsh | source /dev/stdin


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

# zsh's prompt
# zinit light denysdovhan/spaceship-prompt

# OMZ
zinit ice lucid wait="0" atload="zpcompinit; zpcdreplay"
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/functions.zsh
zinit snippet OMZ::plugins/git-auto-fetch/git-auto-fetch.plugin.zsh
zinit snippet OMZ::plugins/vscode/vscode.plugin.zsh
zplugin ice svn
zplugin snippet OMZ::plugins/osx
zinit snippet OMZ::plugins/safe-paste/safe-paste.plugin.zsh
zinit snippet OMZ::plugins/thefuck/thefuck.plugin.zsh
zinit snippet OMZ::plugins/tmux/tmux.plugin.zsh
zinit snippet OMZ::plugins/tmuxinator/tmuxinator.plugin.zsh
# zinit snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh
zinit snippet OMZ::plugins/httpie/httpie.plugin.zsh
zinit snippet OMZ::plugins/extract/extract.plugin.zsh
# zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

zinit ice blockf
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-autosuggestions

zinit light zdharma/fast-syntax-highlighting
zinit light b4b4r07/enhancd
export ENHANCD_FILTER=fzf-tmux

zinit pack"bgn-binary+keys" for fzf

# zinit snippet 'https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh'

zinit light greymd/tmux-xpanes
zinit light supercrabtree/k
zinit light MichaelAquilina/zsh-you-should-use
zinit light mafredri/zsh-async

# key mapping
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

### End of Zinit's installer chunk

. /usr/local/opt/asdf/asdf.sh
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
eval "$(starship init zsh)"
export PATH="/usr/local/opt/redis@4.0/bin:$PATH"
