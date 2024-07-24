#!/usr/bin/env bash
#
###############################################################################
# process()
# 
# Process exported csv file by column, and output each column as an
# individual file
###############################################################################

var=(bc_comparison bc_data data_points)
init_loop

function process() {
  if [[ "${bc_comparison}" == "1" ]]; then 
    # Start working on comparison statements, .csv first
    cp "${bc_data}" /tmp/process.tmp
    bc_data="${bc_data//.csv/.processed.csv}"
    mv /tmp/process.tmp "${bc_data}"
    
    # Remove first line
    sed -i '1d' "${bc_data}"
    
    # Substitute ',' for new line
    sed -i 's/,/\n/g' "${bc_data}"
    
    # Remove blank lines
    sed -i '/^[[:space:]]*$/d' "${bc_data}"
    
    # Substitute '|' for ',' 
    sed -i 's/|/,/g' "${bc_data}"
    
    # Delete all lines that start with a comma
    sed -i '/^,/d' "${bc_data}"
    
    # Add new header
    sed -i '1s/^/More,than\n/' "${bc_data}"
    
    # Now we start making a readable text file
    cp "${bc_data}" /tmp/process.tmp
    bc_data="${bc_data//.csv/.txt}"
    mv /tmp/process.tmp "${bc_data}"
    
    # Remove first line (again lol)
    sed -i '1d' "${bc_data}"
    
    # Substitute ',' for 'than' 
    sed -i 's/,/ than /g' "${bc_data}"
    # Start each line with 'More'
    sed -i 's/^/More /' "${bc_data}"
    
    # Button things up
    sleep 2
    data_points="$(wc -l < ${bc_data})"
    info "${data_points} data points processed"
    info "Saved to ${bc_data}"
    return
  fi

  cp "${bc_data}" /tmp/process.tmp
  bc_data="${bc_data//.csv/.processed}"

  # Extract column, this is horrible and I feel ashamed
  awk -F "\"*,\"*" '{print $1}' /tmp/process.tmp > "${bc_data}_01.csv"
  awk -F "\"*,\"*" '{print $2}' /tmp/process.tmp > "${bc_data}_02.csv"
  awk -F "\"*,\"*" '{print $3}' /tmp/process.tmp > "${bc_data}_03.csv"
  rm /tmp/process.tmp

  var=(01 02 03) 
  for i in "${var[@]}" ; do
    # Substitute '|' for new line
    sed -i 's/|/\n/g' "${bc_data}_${i}.csv"
    
    # Substitute ';' for new line
    sed -i 's/;/\n/g' "${bc_data}_${i}.csv"
    
    # Remove blank lines
    sed -i '/^$/d' "${bc_data}_${i}.csv"
    
    # Remove quotes
    sed -i 's/\"//g' "${bc_data}_${i}.csv"
    
    # Remove leading spaces
    awk '{$1=$1;print}' "${bc_data}_${i}.csv" > /tmp/process.tmp
    
    # Convert everthing to lower case
    tr '[:upper:]' '[:lower:]' < /tmp/process.tmp > /tmp/tr.tmp
    rm /tmp/process.tmp
    
    # This is magically getting around a bug
    strings /tmp/tr.tmp > "${bc_data}_${i}.csv"
    rm /tmp/tr.tmp
    
    # Uppercase first letter
    sed -i 's/^./\U&/' "${bc_data}_${i}.csv"
    
    # Button things up
    sleep 2
    data_points="$(wc -l < ${bc_data}_${i}.csv)"
    info "${data_points} data points processed"
    info "Saved to ${bc_data}_${i}.csv"
  done
  sleep 5
}
