#!/usr/bin/env bash
set -oue pipefail

export MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

EXTENSIONS=$(echo "$1" | yq eval '.extensions[]')
EXTENSIONS_LIST=""
EXTENSIONS_LIST_REGEX="<EXTENSIONS_LIST>"
EXTENSIONS_LIST_TO_ENABLE_FILE="$MODULE_DIR/extensions.d/default"

while IFS= read -r extension; do

    name=$(echo "$extension" | yq eval '.name' -)
    version=$(echo "$extension" | yq eval '.version' -)

    if [[ -n "${name}" ]] && [[ ! "${name}" == "null" ]]; then

        bash "$MODULE_DIR"/install.sh "$name" "$version"

    fi

    if [[ -z "${EXTENSIONS_LIST}" ]]; then
        
        EXTENSIONS_LIST="\'$name\'"

    else

        EXTENSIONS_LIST="$EXTENSIONS_LIST,\'$name\'"

    fi

done <<<"$EXTENSIONS"

echo "Habilitando extensões"
sed -i "s/$EXTENSIONS_LIST_REGEX/$EXTENSIONS_LIST/g" "$EXTENSIONS_LIST_TO_ENABLE_FILE"
cp -r "$MODULE_DIR"/extensions.d /etc/dconf/db/


