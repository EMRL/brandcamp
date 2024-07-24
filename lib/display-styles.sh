#!/usr/bin/env bash
#
# display-styles.sh
#
###############################################################################
# Handles text colors and other screen output
############################################################################### 

# Define color codes
black='\E[30;47m'
red='\e[0;31m'
green='\e[0;32m'
yellow='\E[33;47m'
blue='\E[34;47m'
magenta='\E[35;47m'
cyan='\E[36;47m'
white='\E[37;47m'
endColor='\e[0m'
bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)
purple=$(tput setaf 171)
tan=$(tput setaf 3)


#  Standard text output only to console
function console() {
  echo -e "${reset}$*${endColor}"
}

# Standard text output to console and log_file
function info() {
  echo -e "${reset}$*${endColor}"
}

function input() {
  echo -e "${reset}$*${endColor}"
}

# Sectional header
function notice() {
  echo; echo -e "${green}$*${endColor}"
}

function error() {
  # Set to ERROR
  message_state="ERROR"
  echo -e "${red}$*${endColor}"
  error_msg="$*"
}

function warning() {
  echo -e "${red}$*${endColor}"
}

function empty_line() {
  echo ""
}
