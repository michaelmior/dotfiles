#!/usr/bin/env python

import fnmatch
import os

registry_path = os.path.expanduser('~/.cargo/registry/src')

crate_versions = {}
matches = []

# Find all man pages for binaries
for root, dirnames, filenames in os.walk(registry_path):
    # Filter to things which look like man pages
    filenames = fnmatch.filter(filenames, '*.1')
    if len(filenames) == 0:
        continue

    # Get the crate name and version number
    crate_folder = root[len(registry_path):].split('/')[2]
    crate_split = crate_folder.split('-')
    version = map(int, crate_split[-1].split('+')[0].split('.'))
    crate_name = ''.join(crate_split[:-1])

    # If we didn't do this already or we found a newer version, prepare to link
    if crate_name not in crate_versions or crate_versions[crate_name] < version:
        crate_versions[crate_name] = version

        for filename in filenames:
            if filename.islower():
                matches.append(os.path.join(root, filename))

man_path = os.path.expanduser('~/.dotfiles/rust/man/man1')

for match in matches:
    target = os.path.join(man_path, os.path.basename(match))

    # Remove existing symlinks if needed and symlink again
    if os.path.islink(target):
        os.remove(target)
    os.symlink(match, target)
