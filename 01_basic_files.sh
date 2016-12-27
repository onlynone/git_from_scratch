#!/bin/bash

pwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. "${pwd}/common.sh"

begin

mkdir -p .git/refs
mkdir -p .git/objects
echo "ref: refs/heads/master" > .git/HEAD

#cat - > .git/config <<EOF
#[core]
#    repositoryformatversion = 0
#    filemode = true
#    bare = false
#    logallrefupdates = true
#    ignorecase = true
#    precomposeunicode = true
#EOF

end
