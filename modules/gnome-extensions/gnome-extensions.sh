#!/usr/bin/env bash
set -oue pipefail

export MODULE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

get_yaml_array EXTENSIONS ".extensions[]" "$1"

while IFS= read -r extension; do

    name=$(echo "$extension" | yq eval '.name' -)
    version=$(echo "$extension" | yq eval '.version' -)

 if [[ -n "${name}" ]] && [[ ! "${name}" == "null" ]]; then
    
    bash "$MODULE_DIR"/install.sh "$name" "$version"

 fi
 

done <<< "$EXTENSIONS"