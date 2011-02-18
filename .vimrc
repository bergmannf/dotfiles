call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set hidden
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000
set undolevels=1000 "allow many undo levels
set title

set nobackup " do not write backup files
set noswapfile " do not write swap files
" Start scrolling three lines before a buffer ends.
set scrolloff=3

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on

set ofu=syntaxcomplete#Complete
 
" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

" Make linenumbering on by default
set number

let mapleader="," "remapping the mapleader from \ to ,

set nocompatible
" Allow supertab and snipMate to work together.
let g:SuperTabDefaultCompletionType = "context"

" Set font and colorscheme.
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monaco\ 10
  elseif has("gui_win32")
    set guifont=Monaco:h9:cANSI
  endif
  colors molokai 
endif

