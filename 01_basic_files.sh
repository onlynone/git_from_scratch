#!/bin/bash

pwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "${pwd}/common.sh"
begin

mkdir -p .git/refs
mkdir -p .git/objects
echo "ref: refs/heads/master" > .git/HEAD

end
