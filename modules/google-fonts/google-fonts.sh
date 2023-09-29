#!/usr/bin/env bash
set -oue pipefail

GOOGLE_FONTS_DIR=/usr/share/fonts/google-fonts
COMPRESS_TYPES=("zip" "tar.gz")

mkcd() {

    if [ -d "$1" ]; then

        rm -rf "$1"

    fi

    mkdir -p "$1"
    cd "$1" || exit 0

}

download() {

    local downloaded
    local file

    mkcd "$1"

    echo "${COMPRESS_TYPES[@]}" | while IFS=$'\n' read -r -d ' ' type; do

        downloaded=$(ls | wc -l)
        file="$1.$type"

        if [[ $downloaded -eq 0 ]]; then

            echo "--- Downloading $file ---"

            curl -o "$file" -OL https://fonts.google.com/download?family="$file"

            if [[ -f "$file" ]]; then

                case $type in

                tar.xz) tar xvJf "$file" ;;
                zip) unzip "$file" ;;

                esac

                rm -rf "$file"

                echo "--- $file downloaded ---"

            else

                echo "--- Unable to download $file ---"

            fi

        fi

    done

    cd $GOOGLE_FONTS_DIR

}

mkcd $GOOGLE_FONTS_DIR

echo "--- Downloading selected google-fonts ---"

get_yaml_array googlefonts '.fonts[]' "$1"

for font in "${googlefonts[@]}"; do

    download "${font// /%20}"

done

ls -l $GOOGLE_FONTS_DIR

fc-cache -f $GOOGLE_FONTS_DIR

echo "--- Google-fonts installed ---"

cd /

echo "----"