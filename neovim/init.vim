" Set UTF-8
set fenc=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set ambiwidth=double " view file name
set title
" Add row
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
" Enable syntax
syntax enable

" Cursor settings
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

" Search settings
" Dont distinguish, if search word is lowercase
set ignorecase
" Distinguish uppercase and lowercase
set smartcase
" Wrap word
set incsearch
set wrapscan
" Highlight results
set hlsearch
" end setting

" Key binding
" Change prefix \ to space
let mapleader="\<Space>"

" Move to begging / end of line
noremap <Leader>h ^
noremap <Leader>l $
" Move between display line
noremap j gj
noremap k gk

" Normal mode
" Reset highlight by putting ESC
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" Move between windows
nnoremap <Leader><Tab> <C-w>w
" Move between tab
nnoremap <Leader>t gt nnoremap <Leader>T gT
" Save and finish
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
if has('nvim')
  " Start terminal on new tab
	nnoremap @t :tabe<CR>:terminal<CR>
endif

" Insert mode
" Escape from insert mode
inoremap jj <ESC>

" Terminal mode
if has('nvim')
  " Finish terminal by Ctrl + q
	tnoremap <C-q> <C-\><C-n>:q<CR>
  " Move to normal mode from terminal mode by ESC
	tnoremap <ESC> <C-\><C-n>
  " Move to normal mode from terminal mode by Ctrl + w
  tnoremap <C-w> <C-\><C-n>
  " Tab move in terminal mode
	tnoremap <C-l> <C-\><C-n>gt
	tnoremap <C-h> <C-\><C-n>gT
endif
" End key binding

" Tex settings
" Disable conceal
let g:tex_conceal = ""
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_compiler_latexmk = {
      \ 'background': 1,
      \ 'build_dir': '',
      \ 'continuous': 1,
      \ 'options': [
      \    '-pdfdvi',
      \    '-verbose',
      \    '-file-line-error',
      \    '-synctex=1',
      \    '-interaction=nonstopmode',
      \],
      \}


" Markdown settings
" Disable conceal
let g:vim_markdown_conceal=''
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" python settings
" python2 path
let g:python_host_prog=$PYENV_ROOT . '/shims/python'
" let g:python_host_prog='/usr/local/bin/python2'
" let g:python_host_prog='/usr/bin/python2'
" python3 path
let g:python3_host_prog=$PYENV_ROOT . '/shims/python'
" let g:python3_host_prog='/usr/local/bin/python3'
" let g:python3_host_prog='/usr/bin/python3'

" ALE
let g:ale_linters = {
    \ 'vim': ['vint'],
    \ 'python': ['flake8'],
    \ 'html': ['htmlhint'],
    \ 'css': ['csslint'],
    \ 'javascript': ['eslint'],
    \ }

let g:ale_fixers = {
    \ 'vim': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'python': ['autopep8', 'black', 'isort'],
    \ 'go': ['gofmt', 'goimports'],
    \ 'html': ['tidy'],
    \ 'css': ['stylelint', 'prettier'],
    \ 'javascript': ['prettier'],
    \ 'markdown': [
    \   {buffer, lines -> {'command': 'textlint -c ~/.config/textlintrc -o /dev/null --fix --no-color --quiet %t', 'read_temporary_file': 1}}
    \   ],
    \ }

let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m autopep8'
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black'
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'


nmap <silent> <Leader>x <Plug>(ale_fix)
let g:ale_fix_on_save = 0
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
let g:ale_sign_column_always = 1
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
" Jump to next error with Ctrl + k or Ctrl + j
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" dein.vim settings
"dein Scripts
if !&compatible
  set nocompatible
endif

" Reset augroup
augroup MyAutoCmd
  autocmd!
augroup END
" dein.vimがなければinstall
let s:cache_home=empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir=s:cache_home . '/dein'
let s:dein_repo_dir=s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" If there is no dein.vim, install dein.vim
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

" Required:
let &runtimepath=s:dein_repo_dir .",". &runtimepath

" Load plugin and create cache
" Path to dein.toml
let s:toml_file=fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Get plugin list and cache them
  call dein#load_toml(s:toml_file)

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
filetype indent on
syntax on

" Install plugins in dein.toml
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" End dein.vim settings
