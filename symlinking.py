import os
import sys
import platform
import glob
import ctypes

home_dir = os.path.expanduser("~")

source_dir = sys.path[0]

ignore_items = ['.git',
'symlinking.py',
'initialize_bundles.sh',
'hg-prompt',
'oh-my-zsh',
'README']

special_items = {'awesome': '.config/awesome',
'openbox': '.config/openbox'}

print("home is: ", home_dir)

print("source is: ", source_dir)

# TODO: Needs testing on Windows system
def create_windows_symlink(item, sym_location, is_dir):
    kdll = ctypes.windll.LoadLibrary("kernel32.dll")
    if (is_dir):
        if (os.path.basename(item) == ".vim"):
            sym_location = os.path.join(home_dir, "vimfiles")
        kdll.CreateSymbolicLinkW(sym_location, item, 1)
    else:
        kdll.CreateSymbolicLinkW(sym_location, item, 0)

# TODO: Needs testing on *NIX system
def create_unix_symlink(item_name, sym_location):
    os.symlink(item, sym_location)

def create_needed_folders(path):
    """Create all folders of the given path.

    Equivalent to
        mkdir -p path
    """
    os.makedirs(path, 755)

for item in glob.glob(os.path.join(source_dir, ".*")):
    item_name = os.path.basename(item)
    if item_name not in ignore_items:
        if item_name in special_items.keys():
            link_path = special_items[item_name]
            sym_location = os.path.join(home_dir, special_items[item_name])
            create_needed_folders(link_path)
        else:
            sym_location = os.path.join(home_dir, item_name)
        print("Attempting to symlink %s to %s." % (item, sym_location))
        # TODO: Clean an already existing symlink.
        if (os.path.exists(sym_location)):
            os.remove(sym_location)
        if (platform.system() == "Windows"):
            if os.path.isdir(item):
                create_windows_symlink(item, sym_location, True)
            else:
                create_windows_symlink(item, sym_location, False)
        else:
            create_unix_symlink(item_name, sym_location)
