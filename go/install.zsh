if [ ! -d ~/.gvm ]; then
    GVM_NO_GIT_BAK=1
    GVM_NO_UPDATE_PROFILE=1
    SRC_REPO=$HOME/.dotfiles/go/gvm $HOME/.dotfiles/go/gvm/binscripts/gvm-installer
    gvm version > /dev/null 2>&1 || source $HOME/.gvm/scripts/gvm
    gvm install go1.4.3 --prefer-binary
    gvm use go1.4.3
fi

current_version=$(gvm list | grep '=>' | cut -d' ' -f2 )
if [ "go1.10.3" != "$current_version" ]; then
    gvm install go1.10.3 --prefer-binary
fi

source ~/.gvm/scripts/gvm
gvm use go1.10.3

go get -u github.com/tomnomnom/gron
go get -u github.com/ericchiang/pup
go get -u github.com/ichinaski/pxl
go get -u github.com/aykamko/tag
go get -u github.com/asciimoo/wuzz
