#!/bin/bash

if [ $# -ne 1 ]; then 
	echo "No version"
	exit
fi

VERSION=$1

MESSAGE=$(git log $(git log --grep "Bump.*version" --format=format:%H | head -1)..HEAD | grep Merge | grep pull | sort -t: -k2,2nr | awk -F/ '{print $NF}' | sed 's/[_-]/ /g'  | sed 's/\(.\)/- \U\1/')

echo $MESSAGE

git checkout master

git checkout -b bump-version-$VERSION

echo $MESSAGE > file-to-change

git commit -a -m "Bump verion to $VERSION"

git push origin bump-version-$VERSION