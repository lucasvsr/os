#!/usr/bin/env bash
set -oue pipefail

EXTENSION=$1
VERSION=$2

download() {

    local zip="$1.v$2.shell-extension.zip"
    local extensions_dir="/usr/share/gnome-shell/extensions"
    local download_dir="/tmp/${zip//@/}"

    if [ -d "${extensions_dir}/$1" ]; then

        echo "$1 já instalada"

    else

        if curl https://extensions.gnome.org/extension-data/"${zip//@/}" >"${download_dir}"; then

            echo "$1 baixado com sucesso."
            echo "Iniciando instalação"
            mkdir -p "$extensions_dir/$1"
            unzip "${download_dir}" -d "$extensions_dir/$1"

        fi

    fi

}

download "$EXTENSION" "$VERSION"
