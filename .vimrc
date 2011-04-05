filetype off

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

" More natural line wrapping
nnoremap j gj
nnoremap k gk

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

let g:indent_guides_guide_size = 1


" Make vim autocompletion behave like other IDEs
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Set font and colorscheme.
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monaco\ 9
  elseif has("gui_win32")
    set guifont=Monaco:h9:cANSI
  endif
  colors xoria256
endif

" Setting the path for VimWiki
let g:vimwiki_list = [{'path': '$DROPBOX/Outlines/vimwiki/main'}, {'path': '$DROPBOX/Outlines/vimwiki/university'}]

" Setting up syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

