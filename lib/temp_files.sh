#!/usr/bin/env bash

###############################################################################
# temp_files()
#   A function to create temporary files
#
# Arguments:
#   create    Create a new set of temporary files and directories
#   remove    Remove existing temporary files and directories
###############################################################################

# Initialize variables
var=(file)
init_loop

function temp_files() {
  if [[ -z "${1}" ]]; then
    exit 78
  else
  # Setup tempfile list
  file=(ex1.tmp ex2.tmp ex3.tmp ex4.tmp)

    # Start the loop
    if [[ "${1}" == "remove" ]]; then
      for i in "${file[@]}" ; do
        var="${i}"
        if [[ -f "${!i:-}" ]] || [[ -d "${!i:-}" ]]; then
          rm -rf "${!i:-}"
        fi
      done
    elif [[ "${1}" == "create" ]]; then
      for i in "${file[@]}" ; do
        var="/tmp/${i}"; (umask 077 && touch "${var}" &> /dev/null)
        read -r "${i}" <<< "${var}"
      done
    fi
  fi
}
