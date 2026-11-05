#!/usr/bin/env bash
# Execute notebooks in place, in order (all, or the ones given), on the R kernel (default ir43 = "amosbase8 R4.3.3").
# A throwaway Jupyter config dir keeps personal Jupyter extensions out of the run.
# A notebook whose kernel died is run again (up to 3 attempts): tgstat's forked worker processes (tgs_cor) can, rarely,
# break the kernel's sockets. Errors in the notebook's code are not retried; a failed run leaves the notebook unchanged.
set -euo pipefail
cd "$(dirname "$0")/notebooks"
export JUPYTER_CONFIG_DIR="$(mktemp -d)"
log="$(mktemp)"
trap 'rm -rf "$JUPYTER_CONFIG_DIR" "$log"' EXIT
if [ $# -eq 0 ]; then set -- [0-9][0-9]_*.ipynb; fi
for nb in "$@"; do
    for attempt in 1 2 3; do
        if [ "$attempt" -eq 1 ]; then echo "== $nb"; else echo "== $nb (attempt $attempt: the kernel died)"; fi
        if jupyter nbconvert --to notebook --execute --inplace \
            --ExecutePreprocessor.kernel_name="${KERNEL:-ir43}" --ExecutePreprocessor.timeout=-1 \
            --ExecutePreprocessor.record_timing=False "$nb" 2>&1 | tee "$log"; then
            break
        fi
        if ! grep -q "DeadKernelError" "$log" || [ "$attempt" -eq 3 ]; then exit 1; fi
    done
done
