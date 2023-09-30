#!/usr/bin/env bash
set -oue pipefail

COMPRESS_TYPES=("zip" "tar.gz")

NAME=$1
URL=$2
DEST=$3

mkdir -p "$DEST"

echo "${COMPRESS_TYPES[@]}" | while IFS=$'\n' read -r type; do

    DOWNLOAD=$(ls "$DEST" | wc -l)
    FILE="$NAME.$type"

    if [[ $DOWNLOAD -eq 0 ]]; then

        echo "Downloading $FILE"

        curl -o "$FILE" -OL "$URL"

        if [[ -f "$FILE" ]]; then

            case $type in

            tar.xz) tar xvJf "$FILE" -C "$DEST" ;;
            zip) unzip "$FILE" -d "$DEST" ;;

            esac

            rm -rf "$FILE"

            echo "$FILE DOWNLOAD"

        else

            echo "Unable to download $FILE"

        fi

    fi

done