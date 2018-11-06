"" Start Neobundle Settings.
"---------------------------
"" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
"
" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'fuenor/im_control.vim'
call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
"
"-------------------------
" End Neobundle Settings.
"-------------------------

"Ctags
"保存時に実行
" let g:auto_ctags = 1
"保存先のディレクトリ指定
" let g:auto_ctags_directory_list = ['.git']
"生成されるctagsのファイル名
" let g:auto_ctags_tags_name = 'tags'
"ctagsのオプション
" let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes --langmap=RUBY:.rb --exclude="*.js"  --exclude=".git*" -R'


" キーバインド
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" 環境設定系
" シンタックスハイライト
syntax on
" エンコード
set encoding=utf8
" ２バイト文字対応
set ambiwidth=double
" ファイルエンコード
set fileencoding=utf-8
" スクロールする時に下が見えるようにする
set scrolloff=5
" .swapファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nowritebackup
" バックアップをしない
set nobackup
" バックスペースで各種消せるようにする
set backspace=indent,eol,start
" OSのクリップボードを使う
set clipboard=unnamedplus
" 行番号を表示
set number
" 右下に表示される行・列の番号を表示する
set ruler
" compatibleオプションをオフにする
set nocompatible
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" 対応括弧をハイライト表示する
set showmatch
" 対応括弧の表示秒数を3秒にする
set matchtime=3
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" 不可視文字を表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" インデントをshiftwidthの倍数に丸める
set shiftround
" 補完の際の大文字小文字の区別しない
set infercase
" 文字がない場所にもカーソルを移動できるようにする
set virtualedit=all
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
" 小文字の検索でも大文字も見つかるようにする
set ignorecase
" ただし大文字も含めた検索の場合はその通りに検索する
set smartcase
" インクリメンタルサーチを行う
set incsearch
" 検索結果をハイライト表示
set hlsearch
" コマンド、検索パターンを10000個まで履歴に残す
set history=10000
" マウスモード有効
set mouse=a
" xtermとscreen対応
set ttymouse=xterm2
" コマンドを画面最下部に表示する
set showcmd
"タブ入力を複数の空白入力に置き換える
set expandtab
"画面上でタブ文字が占める幅
set tabstop=2
"自動インデントでずれる幅
set shiftwidth=2
"連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2
"改行時に前の行のインデントを継続する
set autoindent
"改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white

match ZenkakuSpace /　/
augroup rbsyntaxcheck
	autocmd!
	autocmd BufWrite *.rb w !ruby -c
  autocmd BufWritePre * :%s/\s\+$//ge
augroup END
" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;

" 「日本語入力固定モード」の動作モード
let IM_CtrlMode = 1
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>

" IBus 1.5以降
function! IMCtrl(cmd)
  let cmd = a:cmd
  if cmd == 'On'
    let res = system('ibus engine "mozc-jp"')
  elseif cmd == 'Off'
    let res = system('ibus engine "xkb:us::eng"')
  endif
  return ''
endfunction
