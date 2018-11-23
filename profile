#export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
#shopt -s histappend                      # append to history, don't overwrite it

####
#FUNCTIONS
###
function set_iterm2_tab_color {
    case $1 in
    green)
    echo -e "\033]6;1;bg;red;brightness;57\a"
    echo -e "\033]6;1;bg;green;brightness;197\a"
    echo -e "\033]6;1;bg;blue;brightness;77\a"
    ;;
    red)
    echo -e "\033]6;1;bg;red;brightness;270\a"
    echo -e "\033]6;1;bg;green;brightness;60\a"
    echo -e "\033]6;1;bg;blue;brightness;83\a"
    ;;
    orange)
    echo -e "\033]6;1;bg;red;brightness;227\a"
    echo -e "\033]6;1;bg;green;brightness;143\a"
    echo -e "\033]6;1;bg;blue;brightness;10\a"
    ;;
    purple)
    echo -e "\033]6;1;bg;red;brightness;148\a"
    echo -e "\033]6;1;bg;green;brightness;0\a"
    echo -e "\033]6;1;bg;blue;brightness;211\a"
    ;;
    default)
    echo -e "\033]6;1;bg;red;brightness;176\a"
    echo -e "\033]6;1;bg;green;brightness;181\a"
    echo -e "\033]6;1;bg;blue;brightness;175\a"
    esac
}

function set_iterm2_tab_title {
  echo -ne "\033]0;$1\007"
}

function ssh {
  local parameters=( "$@" )
  if [[ " ${parameters[@]} " =~ "env-1" ]]; then
    set_iterm2_tab_color orange
    set_iterm2_tab_title "recette"
  elif [[ " ${parameters[@]} " =~ "env-2" ]]; then
    set_iterm2_tab_color red
    set_iterm2_tab_title "env-2"
  else
   set_iterm2_tab_color green
  fi

  command ssh $@
  set_iterm2_tab_color default
}

#####
#ALIAS
######
alias ll="ls -lah"
alias getports="lsof -iTCP -sTCP:LISTEN -n -P"
alias getip="dig +short myip.opendns.com @resolver1.opendns.com"
alias jsify='pbpaste | jq '.' | json-to-js | pbcopy'
alias docker_exec="docker exec -ti ${1} /bin/bash"

####
#MONGO
####
export PATH=$PATH:~/dev/mongodb-osx-x86_64-4.0.1/bin

#####
#JAVA
####
source ~/findjdks
setjdk 1.8

####
#MAVEN
####
M2_REPO=/Users/bguerout/apache-maven-3.2.1
export PATH=$PATH:$M2_REPO/bin

####
#GIT
####
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=Default
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

#####
#NODE
#####
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use 8

#####
#RUBY
#####
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source /Users/bguerout/.rvm/scripts/rvm
