export PATH="./node_modules/.bin:$HOME/.dotfiles/node/node_modules/.bin:$PATH"
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH="$N_PREFIX/bin:$PATH"
