" vimとして起動
set nocompatible

" シンタックスをON
syntax on

" 行番号を表示する
set number

" ファイルのタイトルを表示する
set title

" 括弧入力時の対応する括弧を表示
set showmatch

" バックアップを作らない
set nobackup

" 文字コードの設定
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932
set fileformat=unix

" 全角記号の調整
set ambiwidth=double

" 他で書き換えられたら自動で読み直す
set autoread

" スワップファイルを作らない
set noswapfile

" コマンドの保存数を設定する(デフォルトは20)
set history=100

" 入力中のコマンドを右下に表示
set showcmd

" 検索結果をハイライト表示
set hlsearch

" 256色を使用
set t_Co=256

" カラースキーム
colorscheme hybrid

" ペーストモード
"set paste

" 自動インデント
" set autoindent
" set smartindent

" オートインデントを無効にする?
"set noautoindent
"set nosmartindent

" タブ入力時半角スペース２に変換
set expandtab

"連続した空白に対してタブキーやバックスペースでカーソルが動く幅
set softtabstop=2

" 画面上でタブ文字が締める幅
set tabstop=2

" 自動インデントでずれる幅
set shiftwidth=2

" ステータスラインの設定
set cmdheight=1
set laststatus=2
set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=%l,%c%V%8P

" 全角スペース・行末のスペース・タブの可視化
set list
set listchars=tab:__,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
if has("syntax")
    syntax on
    syn sync fromstart
    function! ActivateInvisibleIndicator()
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
    endf
    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif
