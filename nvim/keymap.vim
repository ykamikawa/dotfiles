" Change prefix \ to space
let mapleader="\<Space>"

" Move to begging / end of line
noremap <Leader>h ^
noremap <Leader>l $
" Move between display line
noremap j gj
noremap k gk
nnoremap <Space>w :w!<CR>

" Normal mode
" Reset highlight by putting ESC
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" Move between windows
nnoremap <Leader><Tab> <C-w>w
" Tab
nmap <C-t>n :tabnew<CR>
nmap <C-t>N :tabNext<CR>
nmap <C-t>p :tabprevious<CR>
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
inoremap <silent> jj <ESC>
inoremap <silent> jjw <ESC>:w!<CR>
inoremap <silent> jjq <ESC>:wq!<CR>

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
