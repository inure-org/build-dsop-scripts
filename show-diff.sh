#!/usr/bin/env bash

set -euxo pipefail

BRANCH_NAME="${1:-development}"

for dir in repo1/*/
do
    if [ ! -d "${dir}/.git" ]; then
        continue
    fi

    pushd "${dir}"
    git diff --src-prefix="a-${dir}" --dst-prefix="b-${dir}" "origin/${BRANCH_NAME}"
    popd
done
