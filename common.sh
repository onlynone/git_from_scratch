fail () {
    printf "%s\n" "${1}" >> /dev/stderr
    end
    exit 1
}


begin () {
    set -e
    test -n "${REPO_DIR}" || fail "REPO_DIR is empty"
    test -d "${REPO_DIR}" || fail "REPO_DIR is not a directory"

    pushd "${REPO_DIR}" >> /dev/null
}

end () {
    popd >> /dev/null
}
