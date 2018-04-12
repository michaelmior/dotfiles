function app_install {
  [[ -e $HOME/bin/$2 ]] && return
  wget --quiet -O $HOME/bin/$2 $1
  chmod +x $HOME/bin/$2
}

app_install https://raw.githubusercontent.com/k4rthik/git-cal/master/git-cal git-cal
app_install https://raw.githubusercontent.com/mhagger/git-imerge/master/git-imerge git-merge
app_install https://github.com/uber/prototool/releases/download/v0.1.0/prototool-$(uname -s)-$(uname -m) prototool
