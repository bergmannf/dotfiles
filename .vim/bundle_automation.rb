#!/usr/bin/env ruby

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

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

exec_dir = Dir.pwd

execution_after_clone = [
    "cd #{exec_dir}/bundle/Command-T; rake make",
]
FileUtils.cd(bundles_dir)

puts "Trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
	dir = url.split('/').last.sub(/\.git$/, '')
	puts "  Unpacking #{url} into #{dir}"
	`git clone #{url} #{dir}`
	FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
	puts "  Downloading #{name}"
	local_file = File.join(name, script_type, "#{name}.vim")
	FileUtils.mkdir_p(File.dirname(local_file))
	File.open(local_file, "w") do |file|
		file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
	end
end

execution_after_clone.each do |task|
    puts "Running #{task}"
    `#{task}`
end
