if which rustup > /dev/null; then
  rustup self update
else
  curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -y
fi

~/.cargo/bin/rustup update

function rust_install {
  [[ -e ~/.cargo/bin/$2 ]] || ~/.cargo/bin/cargo install --quiet $1
}

rust_install cargo-edit cargo-add
rust_install ripgrep rg
rust_install tokei tokei
rust_install xsv xsv
