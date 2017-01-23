#!/bin/sh

echo "On Success"

if [ $CIRCLE_BRANCH = "test-new-branch" ]; then

	echo "OK"

fi

exit