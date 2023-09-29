#!/usr/bin/env bash
set -oue pipefail

mapfile -d '\n' -t FONTS <<< "$@"
URL="https://fonts.google.com/download?family="
DIR_PRINCIPAL=/usr/share/fonts/google-fonts

if [ ${#FONTS[@]} -gt 0 ]; then

    echo "Installation of google-fonts started"

    for font in "${FONTS[@]}"; do

        font="$(echo "$font" | tr -d '\n')"

        echo "$font"

        mkdir -p "$DIR_PRINCIPAL/$font"
        chmod +x "$FONTS_MODULE_DIR"/scripts/download.sh

        bash "$FONTS_MODULE_DIR"/scripts/download.sh "$font" "$URL${font// /%20}" "$DIR_PRINCIPAL/$font"

    done

    fc-cache -f $DIR_PRINCIPAL

fi