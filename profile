export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

#####
#ALIAS
######
alias ll="ls -lah"
alias getports="lsof -iTCP -sTCP:LISTEN -n -P"
alias getip="dig +short myip.opendns.com @resolver1.opendns.com"
alias jsifify='pbpaste | jq '.' | json-to-js | pbcopy'

#####
#FUNCTIONS
######
findport () {
    lsof -n -i:$1 | grep LISTEN
}

#####
#JAVA
####
source ~/findjdks
setjdk 1.8
export PATH="$HOME/dev/apache-maven-3.5.2/bin:$PATH"

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
export NVM_DIR="/Users/bGuerout/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use 8

#####
#RUBY
#####
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

