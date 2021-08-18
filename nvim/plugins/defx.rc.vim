nnoremap <silent>sf :<C-u>Defx<CR>

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  " ディレクトリ であれば展開,ファイルならdropで開く
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_tree') :
  \ defx#do_action('drop')
  " ディレクトリの展開を閉じる
  nnoremap <silent><buffer><expr> b
  \ defx#do_action('multi', ['close_tree'])
  " Focus current directory
  nnoremap <silent><buffer><expr> l
  \ defx#is_directory() ? defx#do_action('open') : 0
  " Move to parent directory
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  " Create file
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  " Delete file
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  " Rename file
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  " Quit
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
endfunction

call defx#custom#option('_', {
  \ 'winwidth': 50,
  \ 'split': 'vertical',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 1,
  \ 'buffer_name': 'exproler',
  \ 'toggle': 1,
  \ 'resume': 1,
  \ 'columns': 'indent:icon:icons:filename:git',
  \ })

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })

call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })
