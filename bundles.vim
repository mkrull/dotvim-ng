let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
        let g:make = 'make'
endif
NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}
" Airline
NeoBundle 'bling/vim-airline'
" git
NeoBundle 'tpope/vim-fugitive'
" vim shell. mainly for windows where there are no realy good shells
NeoBundle 'Shougo/vimshell'
" snippets
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
" autoclose quotes
NeoBundle 'Raimondi/delimitMate'
" pairs of brackets
NeoBundle 'tpope/vim-unimpaired'
" easyly edit surrounding brackets and tags
NeoBundle 'tpope/vim-surround'
" colors
NeoBundle 'mkrull/vim-kalisi'

" syntax checker
NeoBundle 'scrooloose/syntastic'
" file explorer
NeoBundle 'Shougo/vimfiler'
" easy commenting
NeoBundle 'scrooloose/nerdcommenter'
" better terminal colors
NeoBundle 'godlygeek/csapprox'
" easy alignment
NeoBundle 'godlygeek/tabular'
" tagbar
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Shougo/unite-outline'

" fuzzy finding everything
NeoBundle 'Shougo/unite.vim'

" database support
NeoBundle 'vim-scripts/dbext.vim'

" Perl support
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'vim-scripts/perl-support.vim'
NeoBundle 'yko/mojo.vim'

" golang support
NeoBundle 'fatih/vim-go'
NeoBundle 'cespare/vim-go-templates'

" javascript support
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'

" Ruby/Rails support
NeoBundle 'vim-ruby/vim-ruby'

" HTML editing
NeoBundle 'mattn/emmet-vim'

" Postgresql support
NeoBundle 'exu/pgsql.vim'

" beautifications
NeoBundle 'mhinz/vim-signify'
" complete everything
NeoBundle 'Shougo/neocomplete'

" ack
NeoBundle 'mileszs/ack.vim'

" racket
NeoBundle 'wlangstroth/vim-racket'

" improve ansible support
NeoBundle 'pearofducks/ansible-vim'

" Fancy startup screen and session handling
NeoBundle 'mhinz/vim-startify'
