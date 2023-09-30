#!/usr/bin/env bash
set -oue pipefail

declare FONTS=( "$@" )
declare URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/"
declare DIR_PRINCIPAL=/usr/share/fonts/nerd-fonts

if [ ${#FONTS[@]} -gt 0 ]; then

    echo "Installation of nerd-fonts started"

    for font in "${FONTS[@]}"; do

        font="$(echo "$font" | sed -e 's|^[[:blank:]]||g' | tr -d '\n')"
        
        bash "$FONTS_MODULE_DIR"/scripts/download.sh "$font" "$URL$font" "$DIR_PRINCIPAL/$font" "tar.xz"

    done

    fc-cache -f $DIR_PRINCIPAL

fi