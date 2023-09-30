#!/usr/bin/env bash
set -oue pipefail

mapfile -t FONTS <<< "$@"
URL="https://fonts.google.com/download?family="
DIR_PRINCIPAL=/usr/share/fonts/google-fonts

if [ ${#FONTS[@]} -gt 0 ]; then

    echo "Installation of google-fonts started"

    for font in "${FONTS[@]}"; do

        font="$(echo "$font" | sed -e 's|^[[:blank:]]||g' | tr -d '\n')"

        bash "$FONTS_MODULE_DIR"/scripts/download.sh "$font" "$URL${font// /%20}" "$DIR_PRINCIPAL/$font" "zip"

    done

    fc-cache -f $DIR_PRINCIPAL

fi