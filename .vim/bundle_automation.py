#!/usr/bin/env python

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

os.chdir(bundle_dir)

for command in commands_after_fetch:
    os.chdir(bundle_dir)
    os.chdir(os.path.join(bundle_dir, command[0]))
    os.system(command[1])
