if [ ! -d ~/n ]; then
    curl -L https://git.io/n-install | bash -s -- -y -n
    source $HOME/.dotfiles/node/path.zsh
fi

n stable

npm set progress=false
npm install -g yarn --loglevel=warn
(cd $HOME/.dotfiles/node && yarn; rm -f node_modules/.bin/watch)
npm set progress=true

npm completion > $HOME/.dotfiles/node/completion.zsh
