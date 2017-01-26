#!/bin/sh

echo "$0"

echo "Branch: " $CIRCLE_BRANCH

COMMIT_MESSAGE=$(git log --format=%B -n 1 $CIRCLE_SHA1)

echo "Commit: " $COMMIT_MESSAGE

echo "SHA1: " $CIRCLE_SHA1

if [ "$CIRCLE_PULL_REQUEST" = true ]; then
	echo "IS PR"
else
	echo "NOT A PR"
fi

# it has more than 1 parent the commit is a merge
COUNT_COMMIT_PARENTS=$(git show --format=%P $CIRCLE_SHA1 | awk '{print NF}' | head -n 1)
if [ $COUNT_COMMIT_PARENTS -eq 1 ]; then
	echo "Not a merge commit"
	# not a merge commit
	exit
fi

echo "MERGE"

V=$(git show --format=%B $CIRCLE_SHA1 | grep -iE "(^[ ]*bump[ -]+version[ -]+to[ -]+[v]?[0-9][\.0-9]*)")
	
if [ "$V" = "" ];  then
	exit
fi

echo "BUMP FOUND: $V"

JAR=$(find $(pwd) -name "*.JAR" -type f | head -1) 

echo $JAR

cd ../

git config --global user.email "auto@sr.com"
git config --global user.name "autosr"

git clone https://github.com/mikrosNikolas/releases

cd releases

git checkout master

echo "## CHANGED $(date)" > README.md

git checkout -b android

cp $JAR ./ 

ls 

git add .

git add $(basename $JAR)

git commit -a -m "$V"

#git push origin master

git push origin android

git tag -a $V -m $V android

git push origin $V

echo "DONE!"

exit
