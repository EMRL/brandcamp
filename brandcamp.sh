#!/usr/bin/env bash
#
# brandccamp.sh
#
###############################################################################
# Brandcamp!
#
# https://github.com/EMRL/brandcamp
###############################################################################

IFS=$'\n\t'
VERSION="0.1.0"
EPOCH="$(date +%s)"
NOW="$(date +"%B %d, %Y")"
AUTHOR="${USER}@${HOSTNAME}"

# Configuration
BC_PATH="."

# Set mode
set -uo pipefail

# Variable init loop
function init_loop {
  for i in "${var[@]}" ; do
    read -r "${i}" <<< ""
    echo "${i}" > /dev/null
  done
}

# Load function libraries
lib_path="${BC_PATH}/lib"
for file in "${lib_path}"/*; do
  source "${file}";
done

# Start it up
if [[ $# == "0" ]]; then
  echo "Usage: bc [OPTION] [input-file]"
  exit
else
  if [[ $1 == "-c" || $1 == "--comparison" ]]; then
    bc_comparison="1"
    bc_data="${2}"
  else
    bc_data="${1}"
  fi
fi

notice "Br&ndcamp version ${VERSION}"
info "Processing ${bc_data}"
process #& spinner $!

exit 0
