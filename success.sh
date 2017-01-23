#!/bin/sh

echo "On Success "

date

echo "Testing"
echo $CIRCLE_TAG

echo $CIRCLE_BRANCH

GIT_MESSAGE=$(git log --format=%B -n 1 $CIRCLE_SHA1)

echo $GIT_MESSAGE

echo $CIRCLE_SHA1
echo
echo "----"
echo
git cat-file -p $CIRCLE_SHA1
echo

git cat-file -p $CIRCLE_SHA1 | grep parent
git cat-file -p $CIRCLE_SHA1 | grep parent | wc -l


echo "dump out"
git show --summary --format="%P" $CIRCLE_SHA1

git show --summary --format="%P" $CIRCLE_SHA1 | wc -l

git show --pretty=%P $CIRCLE_SHA1

git show --pretty=%P $CIRCLE_SHA1 | wc -l

git log --pretty=%P $CIRCLE_SHA1


git log --pretty=%P $CIRCLE_SHA1 | wc -l


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