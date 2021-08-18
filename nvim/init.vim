" python settings
let g:python_host_prog=$PYENV_ROOT . '/shims/python'
" let g:python_host_prog='/usr/local/bin/python2'
" let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog=$PYENV_ROOT . '/shims/python'
" let g:python3_host_prog='/usr/local/bin/python3'
" let g:python3_host_prog='/usr/bin/python3'

" Plugins
runtime! plugins/dein.rc.vim
source ~/.config/nvim/plugins/coc.rc.vim
" Keymap
runtime! keymap.vim
" Color
let g:colors_name = 'hybrid'
runtime! colorscheme.vim

" Enable syntax
syntax enable
" Set UTF-8
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set ambiwidth=double " view file name
set title
" Add number to column
set number
" Return row
set wrap
" View ruler
set ruler
" no backup file
set nobackup
" no swap file
set noswapfile
set nowritebackup
" Confirm unsaved file
set confirm
" Autoread, if file is chenged
set autoread
" Open hidden file
set hidden
" Display command on status
set showcmd
" mouse
set mouse=a
" Emphasis match
set showmatch
" Use back space to delete
set backspace=indent,eol,start
" wild menu
set wildmenu
set wildmode=list:longest,full
" Display status bar always
set laststatus=2
" Display unvisible char
set list
set listchars=tab:>.,trail:･,extends:>,precedes:<,nbsp:%
" Change tab to space
set expandtab
" Highlight ZenkakuSpace
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
" Tab space
set tabstop=2
" Tab width
set shiftwidth=2
" Keep indent
set autoindent

" Cursor
" Share clipboard with other apps
set clipboard+=unnamedplus
" Add one virtual char
set virtualedit=onemore
set whichwrap=b,s,[,],<,>
" Emphasis line
set cursorline
" Emphasis column
set cursorcolumn
" Set offset to cursor row
set scrolloff=4

" Search
" Dont distinguish, if search word is lowercase
set ignorecase
" Distinguish uppercase and lowercase
set smartcase
" Wrap word
set incsearch
set wrapscan
" Highlight results
set hlsearch
set pumblend=30
