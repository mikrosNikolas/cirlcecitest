#!/bin/sh

echo "On Success "

if [ $CIRCLE_BRANCH != "test-new-branch" ]; then

	exit 1;

else

	echo $CIRCLE_BRANCH

fi

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