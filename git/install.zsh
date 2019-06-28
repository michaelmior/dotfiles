if ! [ -f git/gitconfig.symlink ]; then
    git_credential='cache'
    if [ "$(uname -s)" = "Darwin" ]; then
        git_credential='osxkeychain'
    fi

    git_authorname=$GIT_AUTHOR_NAME
    if [ -z "$GIT_AUTHOR_NAME" ]; then
        echo ' - What is your github author name?'
        read -e git_authorname
    fi

    git_authoremail=$GIT_AUTHOR_EMAIL
    if [ -z "$GIT_AUTHOR_EMAIL" ]; then
        echo ' - What is your github author email?'
        read -e git_authoremail
    fi

    sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" git/gitconfig.symlink.example > git/gitconfig.symlink
fi

function copy_from_contrib {
  cp /usr/share/doc/git/contrib/$1 $HOME/bin/$2
  chmod +x $HOME/bin/$2
}

copy_from_contrib git-resurrect.sh git-resurrect
copy_from_contrib git-jump/git-jump git-jump
copy_from_contrib subtree/git-subtree git-subtree

ln -sf $HOME/.dotfiles/git/git-extra-commands/bin/* $HOME/bin
