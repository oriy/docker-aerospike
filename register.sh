#!/usr/bin/env bash

function aqlCmd() {
  eval aql --host 0.0.0.0:3000 -c \"$1\"
}

function title() {
  echo '----------------------------'
  echo "$1"
  echo '----------------------------'
  echo
}

title 'CLEANING UP EXISTING MODULES'

for luaFile in `aqlCmd "SET OUTPUT RAW; SHOW MODULES" | grep filename | cut -d: -f2`
do
   aqlCmd "REMOVE MODULE $luaFile"
done

aqlCmd "SHOW MODULES"

title 'REGISTERING MODULES:'

for luaFile in $(ls /aerospike-udf/*.lua)
do
  aqlCmd "REGISTER MODULE '$luaFile'"
done

aqlCmd "SHOW MODULES"
