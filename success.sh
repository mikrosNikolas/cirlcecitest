#!/bin/sh

echo "On Success "

if [ $CIRCLE_BRANCH != "test-new-branch" ]; then

	exit 1;

fi

if [[ ! -z $CI_PULL_REQUEST ]] ; then

	echo "IS PULL REQUES" ; 

fi

echo "in $CIRCLE_BRANCH"

exit