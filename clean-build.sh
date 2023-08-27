#!/usr/bin/env bash

set -euxo pipefail

for dir in repo1/*/
do
    if [ ! -d "${dir}/.git" ]; then
        continue
    fi

    pushd "${dir}"
    rm -f ubi8-build-dependencies*
    ./build-scripts/cleanup.sh
    popd
done
