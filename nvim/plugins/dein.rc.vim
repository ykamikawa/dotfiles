if !&compatible
  set nocompatible
endif

" Reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

let s:cache_home=empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir=s:cache_home . '/dein'
let s:dein_repo_dir=s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" If there is no dein.vim, install dein.vim
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
if &compatible
  set nocompatible
endif

let &runtimepath=s:dein_repo_dir .",". &runtimepath

let s:plugin = '~/.config/nvim/plugins/config/dein.toml'
let s:plugin_lazy = '~/.config/nvim/plugins/config/dein_lazy.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:plugin, {'lazy': 0})
  call dein#load_toml(s:plugin_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if has("vim_starting") && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
filetype indent on
