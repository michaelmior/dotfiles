if [ ! -d ~/.gvm ]; then
    GVM_NO_GIT_BAK=1
    GVM_NO_UPDATE_PROFILE=1
    SRC_REPO=$DOTFILES_ROOT/go/gvm $DOTFILES_ROOT/go/gvm/binscripts/gvm-installer
    gvm version > /dev/null 2>&1 || source $HOME/.gvm/scripts/gvm
    gvm install go1.4.3 --prefer-binary
    gvm use go1.4.3
    gvm install go1.6.2 --prefer-binary
fi

go get github.com/ericchiang/pup
go get github.com/ichinaski/pxl
go get github.com/aykamko/tag
