#!/bin/sh

echo "On Success "

if [ $CIRCLE_BRANCH != "test-new-branch" ]; then

	exit 1;

fi

echo $CI_PULL_REQUEST

if [ ! -z $CI_PULL_REQUEST ] ; then

	echo "IS PULL REQUEST"

else

	echo "IS NOT PULL REQUEST"

fi

echo "in $CIRCLE_BRANCH"

exit