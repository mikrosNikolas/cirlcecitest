#!/bin/sh

echo "On Success "

echo "Branch: " $CIRCLE_BRANCH

COMMIT_MESSAGE=$(git log --format=%B -n 1 $CIRCLE_SHA1)

echo "Commit: " $COMMIT_MESSAGE

cd ../

git config --global user.email "auto@sr.com"
git config --global user.name "autosr"

git clone https://github.com/mikrosNikolas/releases

cd releases

echo $(date) >> updates

git add -A 

git commit -a -m "CHANGED releases"

git push origin master


# it has more than 1 parent the commit is a merge
COUNT_COMMIT_PARENTS=$(git show --format=%P $CIRCLE_SHA1 | awk '{print NF}' | head -n 1)
if [ $COUNT_COMMIT_PARENTS -eq 1 ]; then
	# not a merge commit
	exit
fi



echo $CIRCLE_BRANCH

echo $CI_PULL_REQUEST

exit