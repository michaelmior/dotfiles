source python/path.zsh
eval "$(pyenv init -)"

function plugin_install {
  if [[ ! -d ~/.pyenv/plugins/$2 ]]; then
    git clone $1 ~/.pyenv/plugins/$2
  fi
}

plugin_install git://github.com/pyenv/pyenv-doctor.git pyenv-doctor
plugin_install git://github.com/massongit/pyenv-pip-update.git pyenv-pip-update
plugin_install git://github.com/pyenv/pyenv-update.git pyenv-update

pyenv update
pyenv doctor || return 1

pyenv install --skip-existing 2.7.18
pyenv install --skip-existing 3.9.0
pyenv global 3.9.0

export PIP_CONFIG_FILE=~/.dotfiles/python/pip.conf
export VIRTUALENV_QUIET=1

pip install --upgrade pip
pip install --upgrade pdir
pip install --upgrade virtualenv
pip install --upgrade pipx
pip install --upgrade pipenv
pyenv pip-update
pip install pathlib2==2.1.0 # for pipenv
pyenv rehash

pipx install csvkit
pipx install http-prompt
pipx install httpie
pipx install pip-tools

unset PIP_CONFIG_FILE
unset VIRTUALENV_QUIET

source $HOME/.dotfiles/python/path.zsh
source $HOME/.dotfiles/python/python.zsh
