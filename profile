export HISTSIZE=50000
export HISTFILESIZE=50000

#####
#ALIAS
######
alias ll="ls -lah"
alias getports="lsof -iTCP -sTCP:LISTEN -n -P"
alias getip="dig +short myip.opendns.com @resolver1.opendns.com"
findport () {
    lsof -n -i:$1 | grep LISTEN
}

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

####
#GIT
####
source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=Default
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

#####
#NODE
#####
export NVM_DIR="/Users/bGuerout/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use 6

#####
#RUBY
#####
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

