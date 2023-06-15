#!/bin/sh

export GITLAB_HOSTNAME="gitlab.autoecommerce.ru"
export GITLAB_USERNAME="d.shishlov"
export GITLAB_PASSWORD="glpat-fY6xxpqGg4V1Xvr3n9bq"
export GITLAB_PROJECT_ID="45"

set -u
DEFAULT_POLL_TIMEOUT=10
POLL_TIMEOUT=${POLL_TIMEOUT:-$DEFAULT_POLL_TIMEOUT}

git checkout "${GITHUB_REF:11}"

branch="$(git symbolic-ref --short HEAD)"

sh -c "git config --global credential.username $GITLAB_USERNAME"
sh -c "git config --global core.askPass $GITLAB_PASSWORD"
sh -c "git config --global credential.helper cache"
sh -c "git remote add mirror $*"
sh -c "git pull"
sh -c "echo pushing to $branch branch at $(git remote get-url --push mirror)"
sh -c "git push mirror $branch"
