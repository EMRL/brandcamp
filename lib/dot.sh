#!/usr/bin/env bash
#
###############################################################################
# dot()
#   A function to create a spinner
###############################################################################

function dot {  
  if [[ "${1-default}" == "newline" ]]; then
    echo "."
  else
    echo -n "."
  fi
}