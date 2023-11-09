#!/usr/bin/zsh -f
# Autostart tmux
export TERM=xterm-256color
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

if [[ ! -d ${XDG_CONFIG_HOME:-$HOME/.config}/zsh ]]; then
  mkdir ${XDG_CONFIG_HOME:-$HOME/.config}/zsh &>/dev/null
fi

# Auto suggestions
if [[ ! -a ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zsh-autosuggestions
fi

source ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Syntax highlighting
if [[ ! -a ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zsh-syntax-highlighting
fi

source ${XDG_CONFIG_HOME:-~/.config}/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_MAXLENGTH=300

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

eval "$(starship init zsh)"

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
alias vi=$EDITOR

#unalias la
function la {
  if type "exa" >/dev/null 2>&1; then
    exa -la --header --git --sort=modified $*
  else
    ls -larth $*
  fi
}

#unalias ll
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

