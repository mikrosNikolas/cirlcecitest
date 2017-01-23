#!/bin/sh

echo "On Success "

date

echo "Branch: " $CIRCLE_BRANCH

COMMIT_MESSAGE=$(git log --format=%B -n 1 $CIRCLE_SHA1)

echo "Commit: " $COMMIT_MESSAGE

cd ../

git clone https://github.com/mikrosNikolas/releases

cd releases

pwd

echo $(date) >> updates

git add -A 

git commit -a -m "CHANGED releases"

git push origin releases


ISMERGECOMMIT=$(git show --format=%P $CIRCLE_SHA1 | awk '{print NF}' | head -n 1)
if [ $ISMERGECOMMIT -eq 1 ]; then
	# NOT A MERGE COMMIT
	exit
fi

echo $CIRCLE_BRANCH

echo $CI_PULL_REQUEST

exit