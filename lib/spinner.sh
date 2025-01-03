#!/usr/bin/env bash
#
###############################################################################
# spinner()
#   A function to create a spinner
###############################################################################

# Initialize variables
var=(pid delay spinstr temp)
init_loop

# Progress spinner; we'll see if this works
function spinner() {
  local pid=$1
  local delay=0.15
  # Is there a better way to format this thing?  It's wonky
  local spinstr='|/-\'
  tput civis;
  while [[ "$(ps a | awk '{print $1}' | grep ${pid})" ]]; do
    local temp=${spinstr#?}
    printf "Working... %c  " "$spinstr"
    local spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
  done
  printf "            \b\b\b\b\b\b\b\b\b\b\b\b"
  tput cnorm;
}
