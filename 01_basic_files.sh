#!/bin/bash
set -e

fail () {
    printf "%s\n" "${1}" >> /dev/stderr
    exit 1
}


test -n "${REPO_DIR}" || fail "REPO_DIR is empty"
test -d "${REPO_DIR}" || fail "REPO_DIR is not a directory"

pushd "${REPO_DIR}"

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


popd
