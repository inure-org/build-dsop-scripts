#!/usr/bin/env bash

set -euxo pipefail

BRANCH_NAME="${1:-development}"
CNG_BRANCH_NAME="${2:-master}"

syncBranch() {
    local dir="${1}"
    local branch="${2:-development}"

    pushd "${dir}"
    git add .
    git stash
    git fetch origin
    git checkout "${branch}"
    git pull
    popd
}

for dir in repo1/*/
do
    if [ ! -d "${dir}/.git" ]; then
        continue
    fi
    
    syncBranch "${dir}" "${BRANCH_NAME}"
done

syncBranch "inure-com/CNG" "${CNG_BRANCH_NAME}"
