export HISTSIZE=50000
export HISTFILESIZE=50000
alias ll="ls -lah"

#####
# GIT
# brew install bash-git-prompt
#####
source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=Default
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

######
# JAVA
######
function setjdk() {
   if [ $# -ne 0 ];
      then export JAVA_HOME=`/usr/libexec/java_home -v $@`;
   fi;
   java -version;
}

function findjdks() {
 /usr/libexec/java_home -V
}
setjdk 1.8

######
# NODE
######
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm use 6.9.4

######
# BREW
######
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
