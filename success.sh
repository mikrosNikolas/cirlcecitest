#!/bin/sh

echo "On Success "

if [ $CIRCLE_BRANCH != "test-new-branch" ]; then

	exit 1;

fi

echo "in $CIRCLE_BRANCH"

exit