#!/bin/zsh

versions=$(curl -s https://www.python.org/downloads/ | pup '.download-list-widget ol li .release-number text{}' | cut -d' ' -f2 | tr '\n' ' ')
ver2=$(semver -r '> 2.7.15' -r '< 3.0.0' $=versions)
ver3=$(semver -r '> 3.6.5' $=versions)

if [ "x$ver2" != "x" ]; then
    echo "Updating Python 2 to $ver2"
    sed -i "s/2.7.15/$ver2/" python/update.zsh python/install.zsh
fi

if [ "x$ver3" != "x" ]; then
    echo "Updating Python 3 to $ver3"
    sed -i "s/3.6.5/$ver3/" python/update.zsh python/install.zsh
fi
