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

