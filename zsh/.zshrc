# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/mohenoo/.oh-my-zsh"
export TERM="xterm-256color"
# set language
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# function prompt_my_spotify () {
#     state=`osascript -e 'tell application "Spotify" to player state as string'`;
#     if [ $state = "playing" ]; then
#         artist=`osascript -e 'tell application "Spotify" to artist of current track as string'`;
#         track=`osascript -e 'tell application "Spotify" to name of current track as string'`;

#         p10k segment -f green -t "$artist - $track" 
#     fi
# }
# ZSH_THEME="powerlevel10k/powerlevel10k"
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS+=my_spotify
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
#     git vi-mode thefuck osx autojump vscode command-not-found safe-paste colored-man-pages
# )
# zsh-history-substring-search
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
# path
# alias python=python3
# alias pip=pip3
alias vim=nvim
# alias tmux="tmux -u"
eval $(thefuck --alias)
export GOPATH=/Users/mohenoo/Development/go
export PYTHONPATH=/Users/mohenoo/Library/Python/2.7/bin
export GOBIN=$GOPATH/bin
export PATH=$PYTHONPATH:$GOBIN:$PATH
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
#export PATH=/Users/mohenoo/opt/miniconda2/bin:$PATH
# export PATH=/usr/local/anaconda3/bin:$PATH
# export PATH=/Users/mohenoo/Development/flutter/bin:$PATH
# export JAVA_HOME=$(/usr/libexec/java_home)
# export PATH=$JAVA_HOME/bin:$PATH
# export ANDROID_HOME=/Users/mohenoo/Development/android/SDK

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

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
autoload -Uz compinit
compinit
# # Completion for kitty
kitty + complete setup zsh | source /dev/stdin

#tmux
 # if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
 #     # tmux attach -t default || cd ~ && tmux new -s terminal
 #     tmuxinator start terminal
 # fi

 # tmuxinator start terminal

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"
zplug "junegunn/fzf", use:"shell/*.zsh", defer:2

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/vi-mode",    from:oh-my-zsh
zplug "plugins/thefuck",    from:oh-my-zsh
zplug "plugins/osx",    from:oh-my-zsh
zplug "plugins/vscode",    from:oh-my-zsh
zplug "plugins/command-not-found",    from:oh-my-zsh
zplug "plugins/safe-paste",    from:oh-my-zsh
zplug "plugins/colored-man-pages",    from:oh-my-zsh

# clipboard
zplug "lib/clipboard", from:oh-my-zsh

# A next-generation cd command with your interactive filter
zplug "b4b4r07/enhancd", use:init.sh

# Rename a command with the string captured with `use` tag
zplug "b4b4r07/httpstat", \
    as:command, \
    use:'(*).sh', \
    rename-to:'$1'

# zsh 's theme
zplug "romkatv/powerlevel10k", as:theme, depth:1

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# tmux's panes plugs
zplug "greymd/tmux-xpanes"

# Directory listings for zsh with git features
zplug "supercrabtree/k"

# ZSH plugin that reminds you to use existing aliases for commands you just typed
zplug "MichaelAquilina/zsh-you-should-use"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mohenoo/opt/anaconda2/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mohenoo/opt/anaconda2/etc/profile.d/conda.sh" ]; then
        . "/Users/mohenoo/opt/anaconda2/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mohenoo/opt/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

