#!/usr/bin/env python

git_bundles = [
        "git://github.com/msanders/snipmate.vim.git",
        "git://github.com/scrooloose/nerdtree.git",
        "git://github.com/timcharper/textile.vim.git",
        "git://github.com/tpope/vim-git.git",
        "git://github.com/tpope/vim-haml.git",
        "git://github.com/tpope/vim-markdown.git",
        "git://github.com/tpope/vim-repeat.git",
        "git://github.com/tpope/vim-surround.git",
        "git://github.com/tpope/vim-vividchalk.git",
        "git://github.com/tsaleh/vim-align.git",
        "git://github.com/tsaleh/vim-supertab.git",
        "git://github.com/tsaleh/vim-tcomment.git",
        "git://github.com/mineiro/vim-latex.git",
        "git://github.com/nathanaelkane/vim-indent-guides.git",
        "git://repo.or.cz/vcscommand",
        "git://github.com/vim-scripts/vimwiki.git",
        "git://github.com/wincent/Command-T.git",
        "git://github.com/jceb/vim-orgmode.git",
        "git://github.com/vim-scripts/taglist.vim.git",
        "git://github.com/tpope/vim-ragtag.git",
        "git://github.com/2072/PHP-Indenting-for-VIm.git",
        #"git://github.com/hsitz/VimOrganizer.git",
        "git://github.com/mattn/zencoding-vim.git",
        "git://github.com/scrooloose/syntastic.git",
        "git://github.com/kevinw/pyflakes-vim.git",
        "git://github.com/tpope/vim-fugitive.git",
        # Color schemes
        "git://github.com/vim-scripts/Atom.git",
        "git://github.com/vim-scripts/codeburn.git",
        "git://github.com/cschlueter/vim-mustang.git",
        "git://github.com/vim-scripts/bclear.git",
        "git://github.com/nanotech/jellybeans.vim.git",
        "git://github.com/vim-scripts/molokai.git",
        "git://github.com/cschlueter/vim-wombat.git",
        "git://github.com/vim-scripts/xoria256.vim.git",
        "git://github.com/therubymug/vim-pyte.git",
        "git://github.com/vim-scripts/Fruidle.git",
        "git://github.com/vim-scripts/habiLight.git",
        "git://github.com/vim-scripts/nuvola.vim.git",
        ]

vim_org_scripts = [
        ]

commands_after_fetch = [
        ("Command-T", "rake make")
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
    os.chdir(os.path.join(bundle_dir, command[0]))
    os.system(command[1])
