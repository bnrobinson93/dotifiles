#!/usr/bin/zsh -f
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Autostart tmux
export TERM=xterm-256color
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

if [[ -z $HOME/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ ! -a $HOME/.oh-my-zsh/themes/oxide.zsh-theme ]]; then
  wget -q https://raw.githubusercontent.com/dikiaap/dotfiles/master/.oh-my-zsh/themes/oxide.zsh-theme -O $HOME/.oh-my-zsh/themes/oxide.zsh-theme
fi
ZSH_THEME="oxide"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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

if [[ ! -a ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
if [[ ! -a ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

ZSH_HIGHLIGHT_MAXLENGTH=300
plugins=(git catimg dotenv zsh-autosuggestions zsh-syntax-highlighting node npm sudo)

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
fi

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

export ANDROID_SDK=$HOME/Android/Sdk
export PATH=~/.npm-global/bin:$ANDROID_SDK/platform-tools:$PATH

grep="grep --color"
alias vi="nvim"

unalias la
function la {
  if type "exa" >/dev/null 2>&1; then
    exa -la --header --git --sort=modified $*
  else
    ls -larth $*
  fi
}

unalias ll
function ll {
  if type "exa" >/dev/null 2>&1; then
    exa -l --header --git --sort=modified $*
  else
    ls -lrth $*
  fi
}

function lt {
  if type "exa" >/dev/null 2>&1; then
    exa -l --git --header --sort=modified $* | tail -15
  else
    ls -larth $*
  fi
}

function lss {
  if type "exa" >/dev/null 2>&1; then
    exa -l --header --git --sort=modified $* | less -reXF
  else
    ls -lrth $* | less -erXF
  fi
}

if type "exa" >/dev/null 2>&1; then
  alias ls="exa"
else
  ls="ls --color=tty"
fi

if type "bat" >/dev/null 2>&1; then
  alias cat="bat"
fi
if type "nala" >/dev/null 2>&1; then
  alias sudo='sudo '
  alias apt="nala"
fi

# Fix issue with apt <thing>* not working
unsetopt no_match

# pnpm
export PNPM_HOME="/home/brad/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# bun completions
[ -s "/home/brad/.bun/_bun" ] && source "/home/brad/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

