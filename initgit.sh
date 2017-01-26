#!/bin/bash

sudo rm -rf .git

git init

git add .

git commit -m "Initialized Repo!"

git remote add origin https://github.com/mikrosNikolas/cirlcecitest

git remote -v 

git push -u origin master -f


# Create Bump

branch=bump-version-to-v1.0

$ git push origin --delete $branch

./test.sh $branch
