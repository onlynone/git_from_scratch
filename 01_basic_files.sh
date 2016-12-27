#!/bin/bash
set -e

fail () {
    printf "%s\n" "${1}" >> /dev/stderr
    exit 1
}


test -n "${GIT_DIR}" || fail "GIT_DIR is empty"
test -d "${GIT_DIR}" || fail "GIT_DIR is not a directory"

pushd "${GIT_DIR}"

test -d .git || mkdir .git

cat - > .git/config <<EOF
[core]
    repositoryformatversion = 0
    filemode = true
    bare = false
    logallrefupdates = true
    ignorecase = true
    precomposeunicode = true
EOF


popd
