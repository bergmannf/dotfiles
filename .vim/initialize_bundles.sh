#!/bin/bash
git submodule add git://github.com/msanders/snipmate.vim.git
git submodule add git://github.com/scrooloose/nerdtree.git
git submodule add git://github.com/timcharper/textile.vim.git
git submodule add git://github.com/tpope/vim-git.git
git submodule add git://github.com/tpope/vim-haml.git
git submodule add git://github.com/tpope/vim-markdown.git
git submodule add git://github.com/tpope/vim-repeat.git
git submodule add git://github.com/tpope/vim-surround.git
git submodule add git://github.com/tpope/vim-vividchalk.git
git submodule add git://github.com/tsaleh/vim-align.git
git submodule add git://github.com/tsaleh/vim-supertab.git
git submodule add git://github.com/tsaleh/vim-tcomment.git
git submodule add git://github.com/mineiro/vim-latex.git
git submodule add git://github.com/nathanaelkane/vim-indent-guides.git
git submodule add git://repo.or.cz/vcscommand
git submodule add git://github.com/vim-scripts/vimwiki.git
git submodule add git://github.com/wincent/Command-T.git
git submodule add git://github.com/jceb/vim-orgmode.git
git submodule add git://github.com/vim-scripts/taglist.vim.git
git submodule add git://github.com/majutsushi/tagbar.git
git submodule add git://github.com/tpope/vim-ragtag.git
git submodule add git://github.com/mattn/zencoding-vim.git
git submodule add git://github.com/scrooloose/syntastic.git
git submodule add git://github.com/kevinw/pyflakes-vim.git
git submodule add git://github.com/jeetsukumaran/vim-buffergator
git submodule add git://github.com/tpope/vim-fugitive.git
git submodule add git://github.com/vim-scripts/Atom.git
git submodule add git://github.com/vim-scripts/codeburn.git
git submodule add git://github.com/cschlueter/vim-mustang.git
git submodule add git://github.com/vim-scripts/bclear.git
git submodule add git://github.com/nanotech/jellybeans.vim.git
git submodule add git://github.com/vim-scripts/molokai.git
git submodule add git://github.com/cschlueter/vim-wombat.git
git submodule add git://github.com/vim-scripts/xoria256.vim.git
git submodule add git://github.com/therubymug/vim-pyte.git
git submodule add git://github.com/vim-scripts/Fruidle.git
git submodule add git://github.com/vim-scripts/habiLight.git
git submodule add git://github.com/vim-scripts/nuvola.vim.git
git submodule add git://github.com/sontek/rope-vim.git bundle/ropevim

git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
