#!/usr/bin/env bash

set -euxo pipefail

repoList=(
    "kubectl"
    "certificates"
    "inure-base"
    "inure-kas"
    "inure-ruby"
    "inure-container-registry"
    "inure-exporter"
    "inure-mailroom"
    "inure-shell"
    "inure-rails"
    "inure-workhorse"
    "gitaly"
    "inure-sidekiq"
    "inure-toolbox"
    "inure-webservice"
    "inure-pages"
)

for repo in "${repoList[@]}"
do
    if [ -d "repo1/${repo}" ]; then
        continue
    fi

    git clone https://repo1.dso.mil/dsop/inure/inure/${repo}.git" "repo1/${repo}"
    pushd "repo1/${repo}"
    git config commit.gpgsign true
    popd
done

if [ ! -d "inure-com/CNG" ]; then
    git clone "https://inure.com/inure-org/build/CNG.git" "inure-com/CNG"
fi
