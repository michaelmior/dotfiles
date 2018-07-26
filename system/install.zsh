# Install ls from even-better-ls
if (which -a ls | grep ~/bin > /dev/null)  then
else
  >&2 echo "Installing ls..."
  pushd system/even-better-ls
  wget https://ftp.gnu.org/gnu/coreutils/coreutils-8.2.tar.xz
  tar -xf coreutils-8.2.tar.xz
  rm coreutils-8.2.tar.xz
  cd coreutils-8.2/src
  rm -rf ls.c
  wget https://raw.githubusercontent.com/illinoisjackson/even-better-ls/master/ls.c
  cd ..
  ./configure > /dev/null
  make > /dev/null
  cp src/ls ~/bin
  popd
fi
