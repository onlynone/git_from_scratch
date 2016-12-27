#!/bin/bash

pwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${pwd}/common.sh"
begin


# printf "tree 77\000100644 first_file.txt\000%s040000 one_dir\000%s" "$(echo 56bc2126bce6aa55572dd7e8f75e0c5a360b67c4 | xxd -r -p)" "$(echo ab81e3c8d3bd1447284b3859aa871e0977df7a22 | xxd -r -p)" | zlib-flate -compress > .git/objects/68/f5c93f0a96f6984710a24d4394d816ab6918b5

end
