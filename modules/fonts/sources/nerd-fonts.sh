#!/usr/bin/env bash
set -oue pipefail

declare FONTS=( "$@" )
declare URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/"
declare DIR_PRINCIPAL=/usr/share/fonts/nerd-fonts
declare FORMAT="tar.xz"

if [ ${#FONTS[@]} -gt 0 ]; then

    echo "Installation of nerd-fonts started"

    for font in "${FONTS[@]}"; do

        font="$(echo "$font" | sed -e 's|^[[:blank:]]||g' | tr -d '\n')"
        
        bash "$FONTS_MODULE_DIR"/scripts/download.sh "$font" "$URL$font.$FORMAT" "$DIR_PRINCIPAL/$font" "$FORMAT"

    done

    fc-cache -f $DIR_PRINCIPAL

fi