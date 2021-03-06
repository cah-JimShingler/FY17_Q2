#!/bin/sh

set -e # fail fast
set -x # print commands
export TERM=${TERM:-dumb}

echo "Build and Publish to Maven Repo"

cd source-code
echo "Configuring Git"
git status
git config --global core.mergeoptions --no-edit
git config --global user.email "CI@concourse.ci"
git config --global user.name "Concourse.CI"
# git remote -v

# Run Test on unrebased branch
./gradlew test

# Rebase Origin Master on this branch and rerun test (Build Acceptance)
# git merge origin/master
# echo "Rebase master into branch"
# git pull --rebase origin master

# echo "Run Tests on rebase code"
# # Run Test on unrebased branch
# ./gradlew test
# echo "Passed Gate On: $(date)\n" >> README.md

# # git help
# git add README.md
# git commit -m "Dated README"

# # Copy to output areas so it can be pushed back up to repo
# git clone . ../source-code2

# echo "=============================="
# echo "Build and Publish -- Done"