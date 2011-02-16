call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set hidden
set history=1000

" Start scrolling three lines before a buffer ends.
set scrolloff=3

" Intuitive backspacing in insert mode
set backspace=indent,eol,start
 
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

