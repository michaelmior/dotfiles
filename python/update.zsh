#!/bin/zsh

versions=$(curl -s https://www.python.org/downloads/ | pup '.download-list-widget ol li .release-number text{}' | cut -d' ' -f2 | tr '\n' ' ')
ver2=$(xargs semver -r '> 2.7.18' -r '< 3.0.0' <<< "$versions" | tail -1)
ver3=$(xargs semver -r '> 3.9.0' <<< "$versions" | tail -1)

if [ "x$ver2" != "x" ]; then
    echo "Updating Python 2 to $ver2"
    sed -i "s/2.7.18/$ver2/" python/update.zsh python/install.zsh
fi

if [ "x$ver3" != "x" ]; then
    echo "Updating Python 3 to $ver3"
    sed -i "s/3.9.0/$ver3/" python/update.zsh python/install.zsh
fi
