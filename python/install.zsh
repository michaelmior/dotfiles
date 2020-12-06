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
pyenv global 2.7.18

export PIP_CONFIG_FILE=~/.dotfiles/python/pip.conf
export VIRTUALENV_QUIET=1

pip install --upgrade pip
pip install --upgrade pdir
pip install --upgrade virtualenv
pip install --upgrade pipsi
pip install --upgrade pipenv
pyenv pip-update
pip install pathlib2==2.1.0 # for pipenv
pyenv rehash

function pipsi_install {
  [[ -d ~/.local/venvs/$2 ]] || pipsi --bin-dir=$HOME/bin install $1
}

pipsi_install cqlsh cqlsh
pipsi_install csvkit csvkit
pipsi_install http-prompt http-prompt
pipsi_install httpie httpie
pipsi_install httpstat httpstat
pipsi_install omnihash omnihash
pipsi_install pip-tools pip-tools
pipsi_install pydf pydf
pipsi_install Pygments pygments
pipsi_install shyaml shyaml

unset PIP_CONFIG_FILE
unset VIRTUALENV_QUIET
