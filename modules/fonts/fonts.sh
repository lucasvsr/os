#!/usr/bin/env bash
set -oue pipefail

get_yaml_array NERD '.fonts.nerd-fonts[]' "$1"
get_yaml_array GOOGLE '.fonts.google-fonts[]' "$1"

COMPRESS_TYPES=("zip" "tar.gz")
DIR_FONTS=/usr/share/fonts

mkcd() {

    if [ -d "$1" ]; then

        rm -rf "$1"

    fi

    mkdir -p "$1"
    cd "$1" || exit 0

}

download() {

    local name=$1
    local url=$2
    local dir_principal=$3
    local add_name_and_extension_url=$4
    local downloaded
    local file

    mkcd "$name"

    echo "${COMPRESS_TYPES[@]}" | while IFS=$'\n' read -r -d ' ' type; do

        downloaded=$(ls | wc -l)
        file="$name.$type"

        if [[ $downloaded -eq 0 ]]; then

            echo "--- Downloading $file ---"

            if [[ -n "${add_name_and_extension_url}" ]]; then

                curl -o "$file" -OL "$url$file"
            else

                curl -o "$file" -OL "$url"

            fi

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

    cd "$dir_principal" || exit 0

}

if [ ${#GOOGLE[@]} -gt 0 ]; then

    mkcd $DIR_FONTS/google-fonts

    for font in "${GOOGLE[@]}"; do

        font="$(echo "$font" | tr -d '\n')"

        download "$font" "https://fonts.google.com/download?family=${font// /%20}" $DIR_FONTS/google-fonts

    done

fi

if [ ${#NERD[@]} -gt 0 ]; then

    mkcd $DIR_FONTS/nerd-fonts

    for font in "${NERD[@]}"; do

        font="$(echo "$font" | tr -d '\n')"

        download "$font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/" $DIR_FONTS/nerd-fonts "y"

    done

fi
