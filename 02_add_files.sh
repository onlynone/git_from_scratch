#!/bin/bash

pwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${pwd}/common.sh"
begin


# Write some file content out to a file
first_file=$(mktemp -t XXXXX)
cat > ${first_file} <<EOF
first
file
content
EOF


# Get the size of the content
size=$(wc -c ${first_file} | awk '{print $1}')


# Write the file out as a git 'blob' object
first_file_object=$(mktemp -t XXXXX)
printf "blob %d\000" ${size} >> ${first_file_object}
cat ${first_file} >> ${first_file_object}


# Find the sha1 hash of the object
first_file_object_hash=$(sha1sum ${first_file_object} | cut -f1 -d' ')


# Get the file name under .git/objects for the object
object_sub_dir=$(echo ${first_file_object_hash} | cut -c1,2)
object_fname=$(echo ${first_file_object_hash} | cut -c3-)


# Write the compressed object to the objects directory
mkdir -p .git/objects/${object_sub_dir}
zlib-flate -compress <${first_file_object} > .git/objects/${object_sub_dir}/${object_fname}

rm ${first_file}
rm ${first_file_object}

end
