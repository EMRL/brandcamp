#!/usr/bin/env bash

###############################################################################
# trace()
#   Outputs timestamped, verbose info to console
#
# Arguments:
#   status      Will place the next trace output on the same line, e.g.
#               [trace 1]Checking database... [trace 2]OK will render 
#               Checking database... OK in the logs
#   notime      Output trace with no timestamp, generally used after a 
#               `trace status "blahblah"`  
###############################################################################      

# Initialize variables
var=(timestamp)
init_loop

function trace() {
  timestamp="$(date '+%H:%M:%S')"
  if [[ "${1}" == "status" ]]; then
    echo -e -n "$(tput setaf 3)${timestamp}$(tput sgr0) ${2}"
  elif [[ "${1}" == "notime" ]]; then
      echo -e "${2}"
    else
      echo -e "$(tput setaf 3)${timestamp}$(tput sgr0) $*"
  fi
}
