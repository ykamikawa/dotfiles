" テキスト背景色
au ColorScheme * hi Normal ctermbg=none
" 括弧対応
au ColorScheme * hi MatchParen cterm=bold ctermfg=214 ctermbg=black
" スペルチェック
au Colorscheme * hi SpellBad ctermfg=23 cterm=none ctermbg=none

if (has("termguicolors"))
  set termguicolors
endif

set background=dark

if g:colors_name == 'hybrid'
  colorscheme hybrid
  let g:airline_theme='molokai'
endif

if g:colors_name == 'ayu'
  colorscheme ayu
  let ayucolor='dark' " available: light / dark / mirage
  let g:airline_theme = 'ayu_dark' " available: ayu_light / ayu_dark / ayu_mirage
endif

if g:colors_name == 'onedark'
  colorscheme onedark
  let g:airline_theme = 'onedark'
endif

if g:colors_name == 'gruvbox'
  colorscheme gruvbox
  set t_Co=256
  let g:airline_theme = 'gruvbox'
endif

if g:colors_name == 'elly'
  colorscheme elly
  let g:airline_theme = 'elly'
endif

if g:colors_name == 'tokyonight'
  colorscheme tokyonight
  let g:tokyonight_style = 'night' " available: night / storm
  let g:tokyonight_enable_italic = 1
  let g:airline_theme= 'tokyonight'
endif
