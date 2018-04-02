#!/bin/zsh

versions=$(curl -s 'https://go.googlesource.com/go' | pup 'h3 + ul.RefList-items a[href*=/+/go] text{}' | grep -v 'beta\|rc' | sed 's/go//;s/\(^[0-9]\+.[0-9]\+$\)/\1.0/')
newver=$(semver -r '> 1.10.1' $=versions)

if [ "x$newver" != "x" ]; then
    echo "Updating Go $newver"
    sed -i "s/1.10.1/$newver/" go/update.zsh
    newver=$(echo "$newver" | sed 's/\.0$//')
    sed -i "s/1.10/$newver/" go/install.zsh
fi
