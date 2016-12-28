#!/bin/bash

pwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${pwd}/common.sh"
begin

test -n "$1" || fail "No file content given as argument"
content="$1"

# Write some file content out to a file
file=$(mktemp -t XXXXX)
printf "%s" "$1" > ${file}


# Get the size of the content
size=$(wc -c ${file} | awk '{print $1}')


# Write the file out as a git 'blob' object
file_object=$(mktemp -t XXXXX)
printf "blob %d\000" ${size} >> ${file_object}
cat ${file} >> ${file_object}


# Find the sha1 hash of the object
file_object_hash=$(sha1sum ${file_object} | cut -f1 -d' ')


# Get the file name under .git/objects for the object
object_sub_dir=$(echo ${file_object_hash} | cut -c1,2)
object_fname=$(echo ${file_object_hash} | cut -c3-)


# Write the compressed object to the objects directory
mkdir -p .git/objects/${object_sub_dir}
zlib-flate -compress <${file_object} > .git/objects/${object_sub_dir}/${object_fname}

rm ${file}
rm ${file_object}
