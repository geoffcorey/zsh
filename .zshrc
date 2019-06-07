## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
bindkey -v
## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history # share command history data
# Node.js nvm
[[ -d ~/.nvm ]] && source ~/.nvm/nvm.sh

# External IP
~/bin/external-ip -r

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# profile paths
#[[ -f ~/.profile ]] && source ~/.profile

# Local config
[[ -f ~/.profile.local ]] && source ~/.profile.local
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local


### Added by the Bluemix CLI
source /usr/local/ibmcloud/autocomplete/zsh_autocomplete

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
#
# Customise the Powerlevel9k prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  #custom_medium custom_freecodecamp dir vcs newline status
  custom_kubeconfig dir vcs newline status
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_CUSTOM_KUBECONFIG="[[ ${KUBECONFIG} ]] && grep -a -m 1 -h -r name ${KUBECONFIG} | cut -d ":" -f 2"
POWERLEVEL9K_CUSTOM_KUBECONFIG_FOREGROUND="white"
POWERLEVEL9K_CUSTOM_KUBECONFIG_BACKGROUND="cyan"

# Add the custom Medium M icon prompt segment
#POWERLEVEL9K_CUSTOM_MEDIUM="echo -n $'\uF859'"
#POWERLEVEL9K_CUSTOM_MEDIUM_FOREGROUND="black"
#POWERLEVEL9K_CUSTOM_MEDIUM_BACKGROUND="white"

# Add the custom freeCodeCamp prompt segment
#POWERLEVEL9K_CUSTOM_FREECODECAMP="echo -n $'\uE242' freeCodeCamp"
#POWERLEVEL9K_CUSTOM_FREECODECAMP_FOREGROUND="white"
#POWERLEVEL9K_CUSTOM_FREECODECAMP_BACKGROUND="cyan"

# Load Nerd Fonts with Powerlevel9k theme for Zsh
POWERLEVEL9K_MODE='nerdfont-complete'
# Set a color for iTerm2 tab title background using rgb values
function title_background_color {
  echo -ne "\033]6;1;bg;red;brightness;$ITERM2_TITLE_BACKGROUND_RED\a"
  echo -ne "\033]6;1;bg;green;brightness;$ITERM2_TITLE_BACKGROUND_GREEN\a"
  echo -ne "\033]6;1;bg;blue;brightness;$ITERM2_TITLE_BACKGROUND_BLUE\a"
}

ITERM2_TITLE_BACKGROUND_RED="18"
ITERM2_TITLE_BACKGROUND_GREEN="26"
ITERM2_TITLE_BACKGROUND_BLUE="33"

title_background_color

# Set iTerm2 tab title text
function title_text {
    echo -ne "\033]0;"$*"\007"
}

title_text zsh

source ~/powerlevel9k/powerlevel9k.zsh-theme

# added by travis gem
[ -f /Users/gwcorey@us.ibm.com/.travis/travis.sh ] && source /Users/gwcorey@us.ibm.com/.travis/travis.sh
