#!/usr/bin/env bash
set -oue pipefail

EXTENSION=$1
VERSION=$2

download() {

    local zip="$1.$2.shell-extension.zip"
    local extensions_dir="/usr/share/gnome-shell/extensions"

    if [ -d "${extensions_dir}/${zip%.*}" ]; 
    then

        echo "${zip%.*} já instalada"

    else

        if curl https://extensions.gnome.org/extension-data/"${zip//@/}" > "${extensions_dir}/${zip//@/}"
        then

            echo "${zip} baixado com sucesso."
            echo "Iniciando instalação"
            gnome-extensions install "${extensions_dir}/${zip//@/}" && echo "${zip} instalado com sucesso." 
            
        fi

    fi

}

download "$EXTENSION" "$VERSION"