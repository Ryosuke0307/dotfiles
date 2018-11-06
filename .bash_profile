eval "$(rbenv init -)"
# eval "$(hub alias -s)"

export DYLD_FALLBACK_LIBRARY_PATH=$DYLD_FALLBACK_LIBRARY_PATH:/usr/local/mysql/lib
export PATH=$PATH:/usr/local/mysql/bin

if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

# export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="/usr/local/bin:$PATH"

export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH=${PYENV_ROOT}/bin:$PATH
  eval "$(pyenv init -)"
fi
