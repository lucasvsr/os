#!/usr/bin/env bash
set -oue pipefail

FONTS_DIR=/usr/share/fonts/nerd-fonts
COMPRESS_TYPES=("tar.xz" "zip")

mkcd() {

    mkdir -p "$1"
    cd "$1" || exit 0

}

download() {

    local baixado

    mkcd "$1"

    for type in "${COMPRESS_TYPES[@]}"; do

        baixado=$(ls | wc -l)

        echo "Tentando com .$type"

        if [[ $baixado -eq 0 ]]; then

            curl -o "$1.$type" -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/"$1.$type"

            if [[ -f "$1.$type" ]]; then

                case $type in

                tar.xz) tar xvJf "$1.$type" ;;
                zip) unzip "$1.$type" ;;

                esac

                rm -rf "$1.$type"
                cd ..
                baixado="yes"
                echo "--- $font baixada ---"

            else

                echo "--- Não foi possível baixar $1 ---"
                cd ..
                rm -rf "$1"

            fi

        fi

    done

}

mkcd $FONTS_DIR

echo "--- Fazendo download das nerd-fonts ---"

get_yaml_array nerdfonts '.fonts[]' "$1"

for font in "${nerdfonts[@]}"; do

    echo "--- Baixando $font ---"
    download "$font"

done

fc-cache -f $FONTS_DIR

echo "--- Fontes instaladas ---"

cd /

echo "----"
