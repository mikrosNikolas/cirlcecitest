#!/bin/sh

echo "On Success "

echo "Branch: " $CIRCLE_BRANCH

COMMIT_MESSAGE=$(git log --format=%B -n 1 $CIRCLE_SHA1)

echo "Commit: " $COMMIT_MESSAGE

echo "SHA1: " $CIRCLE_SHA1

# get Version and create tag on release

exit