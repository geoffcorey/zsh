# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

for function in ~/.zsh/functions/*; do
  source $function
done

# automatically enter directories without cd
setopt auto_cd

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# Use Plaidchat if available
if [[ -f ~/.nvm/versions/node/v6.2.2/bin/plaidchat ]]; then
  alias slack="plaidchat >/dev/null 2>/dev/null &"
fi

# use NeoVim if it exists
if [[ -f /usr/bin/nvim ]]; then
  alias vi=/usr/bin/nvim
  alias vim=/usr/bin/nvim
fi
# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '
# GIT PROMPT
if [[ ! -f ~/src/github.com/olivierverdier/zsh-git-prompt/zshrc.sh ]]; then
  mkdir -p ~/src/github.com/olivierverdier/zsh-git-prompt
  git clone git@github.com:olivierverdier/zsh-git-prompt.git ~/src/github.com/olivierverdier/zsh-git-prompt
fi
source ~/src/github.com/olivierverdier/zsh-git-prompt/zshrc.sh
PROMPT='%B%m%~%b$(git_super_status) %# '
# ignore duplicate history entries
setopt hist_ignore_dups

# keep TONS of history
export HISTSIZE=4096
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB

# Colors
export TERM=xterm-256color
#export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
alias less='less --RAW-CONTROL-CHARS'
if [[ `uname` == "Linux" ]]; then
  export LS_OPTS='--color=auto'
fi
alias ls='ls ${LS_OPTS}'
# GoLang
if [[ -d ~/go ]]; then
  export GOROOT=~/go
  export PATH=$PATH:$GOROOT/bin
	export GOPATH=~
fi
# Node.js nvm 
[[ -d ~/.nvm ]] && source ~/.nvm/nvm.sh

# Ruby RVM

# External IP
~/bin/external-ip -r

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

[[ -d ~/bin ]] && export PATH=$PATH:~/bin

# added by travis gem
[ -f /home/gwcorey/.travis/travis.sh ] && source /home/gwcorey/.travis/travis.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
