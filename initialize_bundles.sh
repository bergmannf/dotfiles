#!/bin/bash
git submodule add https://github.com/msanders/snipmate.vim.git .vim/bundle/snipmate
git submodule add https://github.com/scrooloose/nerdtree.git .vim/bundle/nerdtree
git submodule add https://github.com/tpope/vim-git.git .vim/bundle/vim-git
git submodule add https://github.com/tpope/vim-repeat.git .vim/bundle/vim-repeat
git submodule add https://github.com/tpope/vim-surround.git .vim/bundle/vimsurround
git submodule add https://github.com/tsaleh/vim-align.git .vim/bundle/vim-align
git submodule add https://github.com/tsaleh/vim-supertab.git .vim/bundle/vim-supertab
git submodule add https://github.com/tsaleh/vim-tcomment.git .vim/bundle/vim-tcomment
git submodule add https://github.com/mineiro/vim-latex.git .vim/bundle/vim-latex
git submodule add https://github.com/wincent/Command-T.git .vim/bundle/Command-T
git submodule add https://github.com/majutsushi/tagbar.git .vim/bundle/tagbar
git submodule add https://github.com/tpope/vim-ragtag.git .vim/bundle/vim-ragtag
git submodule add https://github.com/mattn/zencoding-vim.git .vim/bundle/zencoding-vim
git submodule add https://github.com/scrooloose/syntastic.git .vim/bundle/syntastic
git submodule add https://github.com/kevinw/pyflakes-vim.git .vim/bundle/pyflakes-vim
git submodule add https://github.com/jeetsukumaran/vim-buffergator .vim/bundle/vim-buffergator
git submodule add https://github.com/tpope/vim-fugitive.git .vim/bundle/vim-fugitive
git submodule add https://github.com/mitechie/pyflakes-pathogen.git .vim/bundle/pyflakes-pathogen
git submodule add https://github.com/sjl/gundo.vim.git .vim/bundle/gundo
git submodule add https://github.com/fs111/pydoc.vim.git .vim/bundle/pydoc
git submodule add https://github.com/vim-scripts/TaskList.vim.git .vim/bundle/TaskList
git submodule add https://github.com/sontek/rope-vim.git .vim/bundle/rope-vim
git submodule add https://github.com/alfredodeza/pytest.vim.git .vim/bundle/pytest
git submodule add https://github.com/reinh/vim-makegreen .vim/bundle/vim-makegreen
git submodule add https://github.com/rson/vim-conque.git .vim/bundle/vim-conque
git submodule add https://github.com/godlygeek/tabular.git .vim/bundle/tabular
# Color schemes
git submodule add https://github.com/vim-scripts/Atom.git .vim/bundle/Atom
git submodule add https://github.com/vim-scripts/codeburn.git .vim/bundle/codeburn
git submodule add https://github.com/cschlueter/vim-mustang.git .vim/bundle/vim-mustang
git submodule add https://github.com/nanotech/jellybeans.vim.git .vim/bundle/jellybeans
git submodule add https://github.com/vim-scripts/molokai.git .vim/bundle/molokai
git submodule add https://github.com/cschlueter/vim-wombat.git .vim/bundle/vim-wombat
git submodule add https://github.com/gmarik/ingretu.git .vim/bundle/ingretu
git submodule add https://github.com/vim-scripts/xoria256.vim.git .vim/bundle/xoria256
git submodule add https://github.com/therubymug/vim-pyte.git .vim/bundle/vim-pyte
git submodule add https://github.com/tpope/vim-vividchalk.git .vim/bundle/vim-vividchalk
git submodule add https://github.com/vim-scripts/Sorcerer.git  .vim/bundle/Sorcerer
git submodule add https://github.com/vim-scripts/rdark.git .vim/bundle/rdark
git submodule add https://gist.github.com/1025957.git .vim/bundle/1025957
git submodule add https://github.com/altercation/vim-colors-solarized.git .vim/bundle/vim-colors-solarized
git submodule add https://github.com/jpo/vim-railscasts-theme.git .vim/bundle/vim-railscasts-theme
git submodule add https://github.com/vim-scripts/mayansmoke.git .vim/bundle/mayansmoke
git submodule add https://github.com/vim-scripts/Zenburn.git .vim/bundle/zenburn

git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
