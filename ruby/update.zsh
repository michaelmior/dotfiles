#!/bin/zsh

rvm get head
ver=$(rvm list known 2> /dev/null | tr -d '[]' | grep -Ev '(^#|^$)' | grep '^ruby-' | sed 's/^ruby-//' | xargs semver -r '>2.7.2' | tail -1)

if [ "x$ver" != "x" ]; then
    echo "Updating Ruby to $ver"
    sed -i "s/2.7.2/$ver/" ruby/update.zsh ruby/install.zsh
fi
