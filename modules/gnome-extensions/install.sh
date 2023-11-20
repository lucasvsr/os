#!/usr/bin/env bash
set -oue pipefail

EXTENSION=$1
VERSION=$2

download() {

    local zip="$1.$2.shell-extension.zip"
    local extensions_dir="/usr/share/gnome-shell/extensions"

    if [ -d "${extensions_dir}/$1" ]; 
    then

        echo "$1 já instalada"

    else

        if curl https://extensions.gnome.org/extension-data/"${zip//@/}" > "/tmp/${zip//@/}"
        then

            echo "$1 baixado com sucesso."
            echo "Iniciando instalação"
            gnome-extensions install "/tmp/${zip//@/}" && echo "$1 instalado com sucesso."
            mkdir -p "$extensions_dir/$1"
            unzip "/tmp/${zip//@/}" -d "$extensions_dir/$1"
            
        fi

    fi

}

download "$EXTENSION" "$VERSION"