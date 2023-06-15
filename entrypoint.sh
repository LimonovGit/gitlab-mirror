#!/bin/sh

set -u

DEFAULT_POLL_TIMEOUT=10
POLL_TIMEOUT=${POLL_TIMEOUT:-$DEFAULT_POLL_TIMEOUT}

git checkout "${GITHUB_REF##*/}"

branch="$(git symbolic-ref --short HEAD)"

sh -c "*****************************************     /cred-helper.sh"

sh -c "git config --global --add safe.directory /github/workspace"
sh -c "git config --global credential.username $GITLAB_USERNAME"
sh -c "git config --global core.askPass /cred-helper.sh"
sh -c "git config --global credential.helper cache"
sh -c "git remote add mirror $*"
sh -c "git pull $branch"
sh -c "echo pushing to $branch branch at $(git remote get-url --push mirror)"
sh -c "git push mirror $branch"
