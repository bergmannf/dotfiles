import os
import sys
import subprocess
import platform
import glob
import ctypes

home_dir = os.path.expanduser("~")

source_dir = sys.path[0]

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

# Will only work for *NIX style operating systems.
for item in glob.glob(os.path.join(source_dir, ".*")):
    item_name = os.path.basename(item)
    if item_name != ".git":
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

