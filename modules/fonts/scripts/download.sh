#!/usr/bin/env bash
set -oue pipefail

NAME=$1
URL=$2
DEST=$3
TYPE=$4

mkdir -p "$DEST"

DOWNLOAD=$(ls "$DEST" | wc -l)
FILE="$NAME.$TYPE"

if [[ $DOWNLOAD -eq 0 ]]; then

    echo "Downloading $FILE"

    curl -o "$FILE" -OL "$URL"

    if [[ -f "$FILE" ]]; then

        case $TYPE in

        tar.xz) tar xvJf "$FILE" -C "$DEST" ;;
        zip) unzip "$FILE" -d "$DEST" ;;

        esac

        rm -rf "$FILE"

        echo "$FILE downloaded"

    else

        echo "Unable to download $FILE"

    fi

fi
