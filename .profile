# use vim as the visual editor
export VISUAL=nvim
export EDITOR=$VISUAL
# add golang if exists
if [ -f ~/go ]; then
  export GOROOT=$HOME:/go
  export PATH=$PATH:$GOROOT/go
  export GOPATH=$HOME/src
fi
# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
# add bin directory
if [ -f ~/bin ]; then
  export PATH=$PATH:~/bin
fi
# use NeoVim if it exists
if [[ -f /usr/bin/nvim ]]; then
  alias vi=/usr/bin/nvim
  alias vim=/usr/bin/nvim
fi
# Colors
export TERM=xterm-256color
#export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
alias less='less --RAW-CONTROL-CHARS'
if [[ `uname` == "Linux" ]]; then
  export LS_OPTS='--color=auto'
fi
alias ls='ls ${LS_OPTS}'
#work-monitors

export PATH="$HOME/.cargo/bin:$PATH"
# Source .bashrc
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
# Source global definitions
echo "profile"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
