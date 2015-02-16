set nocompatible
set nobackup
set noerrorbells
set noflash
set nowrap
syntax on

filetype off

" install plugins
if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Manage bundles in ~/.vim/bundles.vim
source ~/.vim/bundles.vim

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" load custom functions
source ~/.vim/functions.vim

" hidden chars
set list
set listchars=tab:\|-,trail:.,eol:¬

set background=dark

set number
set autoindent
set hlsearch
set ruler
set showcmd
set incsearch
set history=50
"set scrolloff=10
set wildmenu
set ruler
set smartindent         " smart auto indenting
set smarttab            " smart tab handling for indenting

" search
set hlsearch       " highlight search (very useful!)
set incsearch      " search incremently (search while typing)
set ignorecase     " case insensitive searching
set smartcase      " but become case sensitive if you type uppercase characters

" tabs and shifts
set vb
set expandtab
set ts=4
set shiftwidth=4

if has('gui')
  set go=re

  if has('gui_macvim')
    set noantialias
    set transparency=5 " will only work with experimental renderer
    set guifont=Monaco:h14
  else
    set guifont=Terminus\ 12
  endif
endif

if has('gui_running')
  if has('mouse')
    set mouse=a
  endif

  let g:solarized_contrast   = "high"
  let g:solarized_italic     = 0
  let g:solarized_bold       = 0
  let g:solarized_underline  = 0

  let g:solarized_visibility = "low"

  call SetupNERDTree()
else
  set background=dark
  set t_Co=256
  let g:solarized_termcolors = 256
  let g:solarized_visibility = "low"
  let g:solarized_contrast   = "high"
endif

colorscheme solarized
" fix gutter colours
highlight SignColumn ctermbg=235 guibg='#073642'

" syntastic
let g:syntastic_stl_format = '[%E{Error: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
set statusline=''
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%F%m%r%h%w\ [%l,%v][%p%%]\ [%L]
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html'] }

" show signify only when toggled
let g:signify_disable_by_default = 1
let g:signify_sign_add               = '+'
let g:signify_sign_change            = '!'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '|'

" better airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_left_sep=' '
let g:airline_right_sep=' '

" mojolicious highlighting
let mojo_highlight_data = 1

" force me to use vim features to navigate
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" toggle explorers
nnoremap <C-N> :NERDTreeToggle<CR>
nnoremap <f2> :BufExplorer<cr>
nnoremap <f3> :TagbarToggle<cr>
nnoremap <f4> :SignifyToggle<cr>

" faster window navigation
map <C-H> <C-w>h
map <C-J> <C-w>j
map <C-K> <C-w>k
map <C-L> <C-w>l

" go qa
let g:go_fmt_command = "goimports"

" go fancy
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" sniptastic
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" unite config
" fuzzy matcher by default
call unite#filters#matcher_default#use(['matcher_regex'])
" ctrl-p
nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
" yank history
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>

" grep
nnoremap <space>/ :Unite -auto-preview grep:.<cr>

" movement in insert mode
autocmd FileType unite call s:unite_movement()
function! s:unite_movement()
    imap <buffer> <C-n> <Plug>(unite_select_next_line)
    imap <buffer> <C-p> <Plug>(unite_select_previous_line)
endfunction

" use pgsql by default
let g:sql_type_default = 'pgsql'

