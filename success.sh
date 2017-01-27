#!/bin/sh

echo "On Success "

echo "Branch: " $CIRCLE_BRANCH

COMMIT_MESSAGE=$(git log --format=%B -n 1 $CIRCLE_SHA1)

echo "Commit: " $COMMIT_MESSAGE

echo "SHA1: " $CIRCLE_SHA1

throw_error ()
{
	echo
	echo "\033[31;1m $1 \033[0m"
	echo
	exit 1
}

throw_error "@#@3"

# get Version and create tag on release

exit