export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# スクリプト読み込み
source ~/.git-completion.bash
source ~/.git-prompt.sh

# プロンプトに各種情報を表示
# GIT_PS1_SHOWDIRTYSTATE=1
# GIT_PS1_SHOWUPSTREAM=1
# GIT_PS1_SHOWUNTRACKEDFILES=1
# GIT_PS1_SHOWSTASHSTATE=1

############### ターミナルのコマンド受付状態の表示変更
# \u ユーザ名
# \h ホスト名
# \W カレントディレクトリ
# \w カレントディレクトリのパス
# \n 改行
# \d 日付
# \[ 表示させない文字列の開始
# \] 表示させない文字列の終了
# \$ $
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
##############

function grepall() {
  # git ls-files | xargs grep -l $1
  git ls-files | xargs grep $1
}

function sedall()  {
  grepall $1 | xargs sed -i -e "s/$1/$2/g"
}

function tenki() {
  curl wttr.in/$1
}

alias ll="ls -l --color=auto"
alias ls="ls --color=auto"
alias ip_address='ipconfig getifaddr en0'
alias pbcopy='xsel --clipboard --input'

# The next line updates PATH for the Google Cloud SDK.
source '/home/ryo-sk/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/home/ryo-sk/google-cloud-sdk/completion.bash.inc'
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"
