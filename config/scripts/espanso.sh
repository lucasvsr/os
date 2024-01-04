#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail


echo "Instalando as dependências do Espanso via rpm-ostree"
rpm-ostree install make automake gcc gcc-c++ kernel-devel wl-clipboard libxkbcommon-devel dbus-devel wxGTK-devel.x86_64

echo "Instalando as dependências do Espanso via cargo"
cargo install --force cargo-make --version 0.34.0

git clone https://github.com/federico-terzi/espanso /tmp/espanso

cd /tmp/espanso
cargo make --profile release --env NO_X11=true build-binary 

mv target/release/espanso /usr/local/bin/espanso

setcap "cap_dac_override+p" "$(which espanso)"