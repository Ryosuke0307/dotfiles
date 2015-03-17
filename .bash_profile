eval "$(rbenv init -)"
eval "$(hub alias -s)"

export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:/usr/local/mysql/lib 
export PATH=$PATH:/usr/local/mysql/bin

if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="/usr/local/bin:$PATH"

alias ll="ls -l --color=auto"
alias ls="ls --color=auto"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/ryosuke/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/ryosuke/google-cloud-sdk/completion.bash.inc'
