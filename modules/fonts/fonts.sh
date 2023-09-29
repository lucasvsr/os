#!/usr/bin/env bash
set -oue pipefail

export FONTS_MODULE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"


for source in "$FONTS_MODULE_DIR"/sources/*.sh; do

    chmod +x "$source"
    get_yaml_array FONTS ".fonts.${source%.*}[]" "$1"

    bash "$source" "${FONTS[@]}"
    
done