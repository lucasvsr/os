#!/usr/bin/env bash
set -oue pipefail

IFS=$'\n' read -r -a FONTS <<< "$@"
URL="https://fonts.google.com/download?family="
DIR_PRINCIPAL=/usr/share/fonts/google-fonts

oldIFS=$IFS
IFS=$'\n'

if [ ${#FONTS[@]} -gt 0 ]; then

    echo "Installation of google-fonts started"

    for font in ${FONTS[@]}; do

        font="$(echo "$font" | tr -d '\n')"

        echo "$font"

        mkdir -p "$DIR_PRINCIPAL/$font"

        bash "$FONTS_MODULE_DIR"/scripts/download.sh "$font" "$URL${font// /%20}" "$DIR_PRINCIPAL/$font"

    done

    fc-cache -f $DIR_PRINCIPAL

fi

IFS=$oldIFS