#!/usr/bin/env python

git_bundles = [
        "git://github.com/msanders/snipmate.vim.git",
        "git://github.com/scrooloose/nerdtree.git",
        "git://github.com/tpope/vim-git.git",
        "git://github.com/tpope/vim-repeat.git",
        "git://github.com/tpope/vim-surround.git",
        "git://github.com/tsaleh/vim-align.git",
        "git://github.com/tsaleh/vim-supertab.git",
        "git://github.com/tsaleh/vim-tcomment.git",
        "git://github.com/mineiro/vim-latex.git",
        "git://github.com/wincent/Command-T.git",
        "git://github.com/jceb/vim-orgmode.git",
        "git://github.com/majutsushi/tagbar.git",
        "git://github.com/tpope/vim-ragtag.git",
        "git://github.com/mattn/zencoding-vim.git",
        "git://github.com/scrooloose/syntastic.git",
        "git://github.com/kevinw/pyflakes-vim.git",
        "git://github.com/jeetsukumaran/vim-buffergator",
        "git://github.com/tpope/vim-fugitive.git",
        "git://github.com/mitechie/pyflakes-pathogen.git",
        "git://github.com/sjl/gundo.vim.git",
        "git://github.com/fs111/pydoc.vim.git",
        "git://github.com/vim-scripts/TaskList.vim.git",
        "git://github.com/sontek/rope-vim.git",
        "git://github.com/alfredodeza/pytest.vim.git",
        "git://github.com/reinh/vim-makegreen",
        "git://github.com/rson/vim-conque.git",
        # Color schemes
        "git://github.com/vim-scripts/Atom.git",
        "git://github.com/vim-scripts/codeburn.git",
        "git://github.com/cschlueter/vim-mustang.git",
        "git://github.com/nanotech/jellybeans.vim.git",
        "git://github.com/vim-scripts/molokai.git",
        "git://github.com/cschlueter/vim-wombat.git",
        "git://github.com/vim-scripts/xoria256.vim.git",
        "git://github.com/therubymug/vim-pyte.git",
        "git://github.com/vim-scripts/Fruidle.git",
        "git://github.com/vim-scripts/habiLight.git",
        "git://github.com/tpope/vim-vividchalk.git",
        "git://github.com/vim-scripts/Sorcerer.git" ,
        "git://github.com/vim-scripts/rdark.git",
        "git://gist.github.com/1025957.git",
        "git://github.com/altercation/vim-colors-solarized.git",
        ]

vim_org_scripts = [
        ]

commands_after_fetch = [
        ("Command-T", "rake make"),
        ("1025957", "mkdir -p ../bespin/colors; mv *.vim ../bespin/colors"),
        ]

import sys
import shutil
import os

source_dir = sys.path[0]

bundle_dir = os.path.join(source_dir, "bundle")

# Verify that the bundle directory exists.
# Create it if not.
if not os.path.isdir(bundle_dir):
    os.mkdir(bundle_dir)

for dir in os.listdir(bundle_dir):
    print "A directory exists: %s\nIt will be deleted." % (dir)
    shutil.rmtree(os.path.join(source_dir, "bundle/"+dir))

os.chdir(bundle_dir)

for repo in git_bundles:
    dir_name = repo.split("/")[-1].replace(".git", "")
    print "Fetching repository %s into %s" % (repo, dir_name)
    os.system("git clone %s" % (repo))

for command in commands_after_fetch:
    os.chdir(bundle_dir)
    os.chdir(os.path.join(bundle_dir, command[0]))
    os.system(command[1])
