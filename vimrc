if ! has('nvim')
    set nocompatible
    set noflash
endif
set nobackup
set noerrorbells
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
"set listchars=tab:→\ ,trail:·,eol:↓
set listchars=tab:\·\ ,trail:·

set background=dark

set number
set relativenumber
set autoindent
set hlsearch
set ruler
set showcmd
set incsearch
set history=50
"set scrolloff=15
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
    set go=e

    if has('gui_macvim')
        set noantialias
        set transparency=5 " will only work with experimental renderer
        set guifont=Monaco:h14
    else
        set guifont=Terminus\ 13
    endif
endif

if has('gui_running')
    if has('mouse')
        set mouse=a
    endif
else
    set background=dark
    if ! has('nvim')
        set t_Co=256
        set term=screen-256color
    endif
endif

" kalisi neovim colorscheme
try
    colorscheme kalisi
catch /^Vim\%((\a\+)\)\=:E185/
    " in case the scheme is not available for some reason
    colorscheme elflord
endtry

" syntastic
let g:syntastic_stl_format = '[%E{Error: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
set statusline=''
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%F%m%r%h%w\ [%l,%v][%p%%]\ [%L]
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html'] }

" signify settings
let g:signify_disable_by_default = 0
let g:signify_sign_add               = '+'
let g:signify_sign_change            = '!'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '|'

" better airline
set laststatus=2
set noshowmode
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline_theme='kalisi'

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

" nohlsearch with <cr>
nnoremap <cr> :noh<cr><cr>

" unite config
call unite#custom#profile('ido', 'context', {
\   'start_insert' : 1,
\   'prompt' : '>> ',
\   'prompt_direction' : 'below',
\   'prompt_visible' : 1,
\   'direction' : 'dynamicbottom'
\ })
call unite#filters#matcher_default#use(['matcher_fuzzy'])
highlight uniteInputPrompt guifg=#adffdd gui=none ctermfg=70

" ctrl-p
nnoremap <C-p> :Unite -profile-name=ido file_rec/async<cr>

" yank history
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite -profile-name=ido history/yank<cr>

" grep
nnoremap <space>g :Unite -auto-preview -vertical grep:.<cr>

" outline
nnoremap <space>o :Unite -profile-name=ido outline<cr>
nnoremap <space>t :TagbarToggle<cr>

" git changes
nnoremap <space>s :SignifyToggle<cr>

" explore buffers
nnoremap <space>b :Unite -profile-name=ido buffer<cr>

" movement in insert mode
autocmd FileType unite call s:unite_movement()
function! s:unite_movement()
    imap <buffer> <C-n> <Plug>(unite_select_next_line)
    imap <buffer> <C-p> <Plug>(unite_select_previous_line)
endfunction

" toggle explorer
nnoremap <c-n> :VimFilerExplorer<cr>

" toggle fullscreen (needs wmctrl)
map <silent> <f11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<cr>

" faster window navigation
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" go qa
let g:go_fmt_command = "goimports"

" go fancy
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" go map commands
" definition
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>df <Plug>(go-def)
" doc
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
" type info
au FileType go nmap <Leader>gi <Plug>(go-info)
" rename
au FileType go nmap <Leader>gr <Plug>(go-rename)
" test
au FileType go nmap <Leader>gt <Plug>(go-test)

" run go lint
autocmd BufWritePost *.go GoLint

" sniptastic
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" tagbar for code navigation
let g:tagbar_autoclose = 1

" use pgsql by default
let g:sql_type_default = 'pgsql'

" mapleader
let mapleader = ","

" use ag for ack
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

"deoplete/neocomplete
" enable at startup
if has('nvim')
    let g:deoplete#enable_at_startup = 1
else
    let g:neocomplete#enable_at_startup = 1
endif

" ansible settings
let g:ansible_attribute_highlight = 'ob'
let g:ansible_name_highlight = 'd'
let g:ansible_extra_syntaxes = ''

" <TAB>: completion.
function! s:check_back_space()
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

if has('nvim')
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ deoplete#start_manual_complete()
else
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ neocomplete#start_manual_complete()
endif
