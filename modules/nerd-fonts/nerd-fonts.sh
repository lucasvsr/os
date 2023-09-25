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
    local file

    mkcd "$1"

    for type in "${COMPRESS_TYPES[@]}"; do

        baixado=$(ls | wc -l)
        file="$1.$type"

        echo "Tentando com .$type"
        echo "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$file"

        if [[ $baixado -eq 0 ]]; then

            curl -o "$file" -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$file

            if [[ -f "$file" ]]; then

                case $type in

                tar.xz) tar xvJf "$file" ;;
                zip) unzip "$file" ;;

                esac

                rm -rf "$file"
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
