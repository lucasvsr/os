#!/usr/bin/env bash
set -oue pipefail

get_yaml_array NERD '.fonts.nerd-fonts[]' "$1"
get_yaml_array GOOGLE '.fonts.google-fonts[]' "$1"
export FONTS_MODULE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if [ ${#GOOGLE[@]} -gt 0 ]; then

    "$FONTS_MODULE_DIR"/sources/google-fonts.sh "${GOOGLE[@]}"

fi

if [ ${#NERD[@]} -gt 0 ]; then

    "$FONTS_MODULE_DIR"/sources/nerd-fonts.sh "${NERD[@]}"

fi