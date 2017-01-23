#!/bin/sh

echo "On Success "

date

echo "Testing"
echo $CIRCLE_TAG

echo $CIRCLE_BRANCH

GIT_MESSAGE=$(git log --format=%B -n 1 $CIRCLE_SHA1)

ISMERGECOMMIT=$(git show --format=%P $CIRCLE_SHA1 | awk '{print NF}' | head -n 1)

echo "$ISMERGECOMMIT"

if [ $ISMERGECOMMIT -eq 1 ]; then

	echo "Not a merge"
	exit
fi

if [ $CIRCLE_BRANCH != "test-new-branch" ]; then

	exit 0;

fi

echo $CIRCLE_BRANCH

echo $CI_PULL_REQUEST

if [ ! -z $CI_PULL_REQUEST ] ; then

	echo "IS PULL REQUEST"

	echo $CIRCLE_ARTIFACTS

	ls $CIRCLE_ARTIFACTS

else

	echo "IS NOT PULL REQUEST"

fi

echo "in $CIRCLE_BRANCH"

exit