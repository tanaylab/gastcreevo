#!/usr/bin/env bash
# Link every input listed in MANIFEST.tsv into data/ (from its `source` path, or from $1/<file> when a directory holding
# the input files is given) and check the md5 of each.
set -euo pipefail
cd "$(dirname "$0")"
src_dir="${1:-}"
tail -n +2 MANIFEST.tsv | while IFS=$'\t' read -r file md5 bytes source description; do
    if [ ! -e "$file" ]; then
        if [ -n "$src_dir" ]; then target="$src_dir/$file"; else target="$source"; fi
        ln -s "$target" "$file"
    fi
    echo "$md5  $file"
done | md5sum --check --quiet -
echo "all inputs present, md5 ok"
