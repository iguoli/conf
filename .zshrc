# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
ZSH_THEME="kafeitu"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git perl zsh-autosuggestions zsh-syntax-highlighting common-aliases z vi-mode docker)

zstyle ':completion:*:ssh:*' hosts off

source $ZSH/oh-my-zsh.sh

# User configuration
# 在tmux中使用vim-mode
# bindkey -v

bindkey "^B" backward-word
bindkey "^F" forward-word
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# Set options for GNU less
# --quit-if-one-screen --ignore-case --status-column
# --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD
# --tabs=4 --no-init --window=-4
export LESS='-F -i -J -M -R -W -x4 -X -z-4'
# Set colors for GNU less
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Syntax highlight output
if type pygmentize >/dev/null; then
    export LESSOPEN="|pygmentize -g -O style=solarized-dark %s"
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='gvim'
fi

# Java settings on macOS and Linux
if type java >/dev/null 2>&1; then
    case $(uname) in
        Darwin)
            export JAVA_HOME=$(/usr/libexec/java_home)
            ;;
        Linux)
            export JAVA_HOME=$(readlink -f $(which java) | sed 's:/bin/java::')
            ;;
    esac
fi

# Use grc with supported commands
case $(uname) in
    Darwin)
        [[ -s "$(brew --prefix)/etc/grc.zsh" ]] && source $(brew --prefix)/etc/grc.zsh
        ;;
    Linux)
        [[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh
        ;;
esac

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias tree="tree -C"
alias pcs="proxychains4"
alias goproxy="export all_proxy=socks5://127.0.0.1:7891 http_proxy=http://127.0.0.1:7890 https_proxy=http://127.0.0.1:7890"
alias noproxy="unset all_proxy http_proxy https_proxy"
