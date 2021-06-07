#!/usr/bin/env bash
set -ue

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd) 

echo "[INFO] Execute all install script"
for f in $script_dir/*.sh; do
    [[ $(basename $f) == "install-all.sh" ]] && continue
    source $f
done
