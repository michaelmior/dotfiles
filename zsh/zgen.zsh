#!/bin/zsh
source "$HOME/.dotfiles/zsh/zgen/zgen.zsh"

zgen oh-my-zsh

zgen oh-my-zsh plugins/bundler
zgen oh-my-zsh plugins/django
zgen oh-my-zsh plugins/go
zgen oh-my-zsh plugins/grunt
zgen oh-my-zsh plugins/nmap
zgen oh-my-zsh plugins/pep8
zgen oh-my-zsh plugins/pip
zgen oh-my-zsh plugins/pj
zgen oh-my-zsh plugins/python
zgen oh-my-zsh plugins/sudo

zgen oh-my-zsh themes/muse

zgen load zsh-users/zsh-autosuggestions
zgen load zsh-users/zsh-syntax-highlighting
zgen load zsh-users/zsh-completions src
zgen load micha/resty
zgen load psprint/zsh-editing-workbench
zgen load g-plane/zsh-yarn-autocompletions

rm -rf "$HOME/.zgen/local/dotfiles-plugin-master"
(cd zsh/dotfiles-plugin; rm -rf .git; git init; git add .; git commit -am Init)
zgen load zsh/dotfiles-plugin

zgen save
