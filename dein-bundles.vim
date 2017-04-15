" Easy motion
call dein#add('easymotion/vim-easymotion')
" Airline
call dein#add('vim-airline/vim-airline-themes')
call dein#add('vim-airline/vim-airline-themes')
" git
call dein#add('tpope/vim-fugitive')
" vim shell. mainly for windows where there are no realy good shells
call dein#add('Shougo/vimshell')
" snippets
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')
" autoclose quotes
call dein#add('Raimondi/delimitMate')
" pairs of brackets
call dein#add('tpope/vim-unimpaired')
" easyly edit surrounding brackets and tags
call dein#add('tpope/vim-surround')
" colors
call dein#add('mkrull/vim-kalisi')

" syntax checker
call dein#add('scrooloose/syntastic')
" file explorer
call dein#add('Shougo/vimfiler')
" easy commenting
call dein#add('scrooloose/nerdcommenter')
" better terminal colors
call dein#add('godlygeek/csapprox')
" easy alignment
call dein#add('godlygeek/tabular')
" tagbar
call dein#add('majutsushi/tagbar')
call dein#add('Shougo/unite-outline')

" fuzzy finding everything
call dein#add('Shougo/unite.vim')

" Perl support
call dein#add('vim-perl/vim-perl')
call dein#add('vim-scripts/perl-support.vim')
call dein#add('yko/mojo.vim')

" golang support
call dein#add('fatih/vim-go')
call dein#add('cespare/vim-go-templates')

" javascript support
call dein#add('pangloss/vim-javascript')
call dein#add('jelera/vim-javascript-syntax')

" Ruby/Rails support
call dein#add('vim-ruby/vim-ruby')

" HTML editing
call dein#add('mattn/emmet-vim')

" Postgresql support
call dein#add('exu/pgsql.vim')

" beautifications
call dein#add('mhinz/vim-signify')
" complete everything
if has('nvim')
    call dein#add('Shougo/deoplete.nvim')
else
    call dein#add('Shougo/neocomplete')
endif

" ack
call dein#add('mileszs/ack.vim')

" racket
call dein#add('wlangstroth/vim-racket')

" improve ansible support
call dein#add('pearofducks/ansible-vim')

" Fancy startup screen and session handling
call dein#add('mhinz/vim-startify')

" Manage marks
call dein#add('kshenoy/vim-signature')
call dein#add('tacroe/unite-mark')

" Play radio streams from vim
call dein#add('klen/unite-radio.vim')
