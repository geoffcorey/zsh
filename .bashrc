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
export PATH=$PATH:$GOPATH/bin:~/src/github.com/razee-io/Kube-cloud-scripts/bin
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

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
[ -f /usr/local/ibmcloud/autocomplete/bash_autocomplete ] && source /usr/local/ibmcloud/autocomplete/bash_autocomplete
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

# set iTerm2 title if present
if [[ $ITERM_SESSION_ID ]]; then
  # Display the current git repo, or directory, in iterm tabs.
  get_iterm_label() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      local directory
      directory=${PWD##*/}
      echo -ne "\\033];$directory\\007"
    else
      local branch
      local branchdir
      branchdir=$(basename "$(git rev-parse --show-toplevel)")
      branch=$(git branch 2>/dev/null | grep -e '\* ' | sed "s/^..\(.*\)/{\1}/")
      echo -ne "\\033];$branchdir $branch\\007"
    fi
  }
  export PROMPT_COMMAND=get_iterm_label;"${PROMPT_COMMAND}"
fi
