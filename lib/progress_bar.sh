#!/usr/bin/env bash
#
###############################################################################
# spinner()
#   A function to create a spinner
###############################################################################

# Set up the progress bar function
function progress_bar() {
  let _progress=\(${1}*100/${2}*100\)/100
  let _done=\(${_progress}*4\)/10
  let _left=40-$_done
  _fill=$(printf "%${_done}s")
  _empty=$(printf "%${_left}s")
  printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"
}

# Display progress bar
function show_progress() {
  _start=1
  _end=100
  for number in $(seq ${_start} ${_end}) 
  do
    progress_bar "${number}" ${_end}
  done;
  empty_line; sleep 3
}