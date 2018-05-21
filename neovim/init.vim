" setting---------------------------------------------
" 文字コードをUFT-8に設定
set fenc=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
set ambiwidth=double

" 編集中のファイル名の表示
set title
" 行番号の追加
set number
" 行を折り返す
set wrap
" ルーラーを表示する
set ruler
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
set nowritebackup
" 未保存ファイルの終了時に保存確認を行なう
set confirm
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" マウス
set mouse=a
" ファイルが変更された際に自動で読み込む
set autoread
" 対応するカッコを強調
set showmatch
" バックスペースで削除
set backspace=indent,eol,start
" コマンドラインモードでの補完を有効にする
set wildmenu
" コマンドラインモードでの補完方法を設定する
set wildmode=list:longest,full
" ステータスバーを常に表示する
set laststatus=2

" Tab系
" 不可視文字を表示する
set list
" 不可視文字を可視化
set listchars=tab:>.,trail:･,extends:>,precedes:<,nbsp:%
" Tab文字を半角スペースにする
set expandtab
"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" 改行時にインデントの保持
set autoindent
" syntaxの有効化
syntax enable

" カーソル系
" クリップボードを他のアプリと共有
set clipboard+=unnamedplus
" tab幅
set tabstop=2
set shiftwidth=2
" 開業時に自動でインデント クリップボードの貼り付けがおかしくなるかも
"set smartindent
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" カーソルの回り込み
set whichwrap=b,s,[,],<,>
" 行の強調
set cursorline
" 列の強調
set cursorcolumn
" カーソル行の上下へのオフセットを設定する
set scrolloff=4

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" end setting----------------------------------------


" python---------------------------------------------
" python2
let g:python_host_prog=$PYENVROOT . '/versions/anaconda-4.0.0/bin/python'
" let g:python_host_prog='/usr/local/bin/python2'
" python3
let g:python3_host_prog=$PYENVROOT . '/versions/anaconda3-4.3.1/bin/python'
" let g:python3_host_prog='/usr/local/bin/python3'

" go-------------------------------------------------
" GOPATH
let g:go_bin_path=$GOPATH .'/bin'

" キーマップの設定-----------------------------------
" プレフィックスの変更 \->space
let mapleader="\<Space>"
" インサートモードから抜ける
inoremap jj <ESC>
" 行頭・行末に移動する
noremap <Leader>h ^
noremap <Leader>l $
" ウィンドウ間を移動する
nnoremap <Leader><Tab> <C-w>w
" タブを移動する
nnoremap <Leader>t gt
nnoremap <Leader>T gT
" 表示行で移動する 物理行
noremap j gj
noremap k gk
" 保存・終了する
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
" ターミナルモード
if has('nvim')
	" 新しいタブでターミナルを起動
	nnoremap @t :tabe<CR>:terminal<CR>
	" Ctrl + q でターミナルを終了
	tnoremap <C-q> <C-\><C-n>:q<CR>
	" ESCでターミナルモードからノーマルモードへ
	tnoremap <ESC> <C-\><C-n>
  " Ctrl + w でターミナルモードからノーマルモードへ
  tnoremap <C-w> <C-\><C-n>
	" ターミナルモードでのタブ移動
	tnoremap <C-l> <C-\><C-n>gt
	tnoremap <C-h> <C-\><C-n>gT
endif
" end キーマップ-------------------------------------

" dein.vimの設定
"dein Scripts----------------------------------------
if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings
let s:cache_home=empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir=s:cache_home . '/dein'
let s:dein_repo_dir=s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" dein.vimがなければ、dein.vim自体を自動インストール
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

" Required:
let &runtimepath=s:dein_repo_dir .",". &runtimepath

" プラグイン読み込み＆キャッシュ作成
" tomlファイルのパス
let s:toml_file=fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

	" tomlファイルからプラグインのリストをロードしキャッシュ
  call dein#load_toml(s:toml_file)

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
filetype indent on
syntax on

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------
