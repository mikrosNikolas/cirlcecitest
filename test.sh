#!/bin/bash

function generate_commit()
{
	COMMITS=$1
	if [ $# -eq 0 ]; then 
		COMMITS=1
	fi

	for i in `seq 1 $COMMITS`;
	do
		echo "#### COMMIT $1 " $(date) > autoCommit.md
		git commit -a -m "From $0 $i"
	done
}    

git checkout master

git pull origin master

git checkout -b $1

echo "#### COMMIT $1 " $(date) > autoCommit.md
git commit -a -m "$1"

git push origin $1

exit