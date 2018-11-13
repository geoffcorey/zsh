# .bashrc

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# Source local .profile
# if [ -f ~/.profile ]; then
	# . ~/.profile
# fi

# Source local .profile
if [ -f ~/.bashrc.local ]; then
	. ~/.bashrc.local
fi

# Source local .aliases
if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

# Markdown previewer
if [ -f ~/.cargo/env ]; then
  . ~/.cargo/env
fi
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export GOPATH=~/
export PATH=$PATH:$GOPATH/bin
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Git prompt
if [ -d ~/.bash-git-prompt ]; then
  echo "bash-git-prompt installed"
else
  git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
fi
GIT_PROMPT_THEME=Single_line
GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh
echo "bashrc"

### Added by the Bluemix CLI
source /usr/local/ibmcloud/autocomplete/bash_autocomplete
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# GIT completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
else
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
  . ~/.git-completion.bash
fi
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
 . /usr/local/etc/bash_completion.d/git-completion.bash
fi
