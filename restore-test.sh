#!/usr/bin/env bash
set -euo pipefail
export BORG_REPO="ssh://allan@nas.allanso.dk/./borg/$(hostname)"
latest=$(borg list --last 1 --short)
borg extract --dry-run -v "::$latest"
echo "Dry-run restore af $latest OK"
