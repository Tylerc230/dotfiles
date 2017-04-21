#! /bin/sh
BRANCH=`git rev-parse --abbrev-ref HEAD`
git checkout develop
git pull
git checkout $BRANCH
git rebase develop
