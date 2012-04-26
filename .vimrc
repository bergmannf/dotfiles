filetype off " Needed for pathogen to load all filetype plugins

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set encoding=utf8
set fileencoding=utf8
set fileformat=unix

set hidden

"************************
"* Indendation Settings *
"************************
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set softtabstop=4
set shiftwidth=4  " number of spaces to use for autoindenting
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

"*******************
"* Search Settings *
"*******************
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

"********************************
"* Remapping Movement in Splits *
"********************************
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"********************
"* Other Remappings *
"********************
let mapleader="," "remapping the mapleader from \ to ,
nmap j gj
nnoremap k gk
map <leader>g :GundoToggle<CR>
map <leader>td <Plug>TaskList
map <leader>pt <Plug>MakeGreen
let g:ctrlp_max_height = 20
imap jk <esc>

map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"***************"
" Rope Settings "
"***************"

" Rope AutoComplete
let ropevim_vim_completion = 1
let ropevim_extended_complete = 1
let g:ropevim_autoimport_modules = ["os.*","traceback","django.*", "xml.etree", "PyQt4.*"]
imap <c-space> <C-R>=RopeCodeAssistInsertMode()<CR>


"*******************
"* Random Settings *
"*******************
set expandtab
set history=1000
set undolevels=1000 "allow many undo levels
set title
set nobackup " do not write backup files
set noswapfile " do not write swap files.
set nocompatible
set list    " Show invisible characters
set listchars=tab:▸\ ,eol:¬
set number        " always show line numbers
set relativenumber  " Vim will display how far each line is away relative from the current
". Start scrolling three lines before a buffer ends.
set scrolloff=3

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
"filetype on
"filetype plugin on
"filetype indent on

set ofu=syntaxcomplete#Complete


" Allow supertab and snipMate to work together.
let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:indent_guides_guide_size = 1

" Make vim autocompletion behave like other IDEs
set completeopt=menuone,longest,preview
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Set font and colorscheme.
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Envy\ Code\ R\ 10
    elseif has("gui_win32")
        set guifont=ProggyCleanTT:h12:cANSI
    endif
    colors wombat
else
    set t_Co=256
    colors wombat256
endif

set cursorline
set cursorcolumn

" Hide Toolbar
set guioptions-=T

" Setting up syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1

let g:Powerline_symbols='fancy'

" Omnicompletion settings
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Other completions (like wildmenu)

set wildmenu
set wildmode=longest:full

" Zen coding changes
let g:user_zen_expandabbr_key = '<c-e>'

" Tlist_Ctags only on mac (TODO: does not work for cmd vim)
if has("macunix")
    let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
endif

" Status line hacks
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set laststatus=2

" Ensure vim-latex is used even on empty tex-files
let g:tex_flavor='latex'


let g:pyflakes_use_quickfix = 0

"****************
"* Python stuff *
"****************
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
