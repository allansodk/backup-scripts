#!/usr/bin/env bash
set -euo pipefail
export BORG_REPO="ssh://allan@nas.allanso.dk/./borg/$(hostname)"
export BORG_PASSPHRASE="${BORG_PASSPHRASE:?saet BORG_PASSPHRASE}"
borg create --stats --compression zstd ::"{hostname}-{now:%Y%m%d}" /etc /home /srv
borg prune --keep-daily 7 --keep-weekly 4 --keep-monthly 6
borg compact
