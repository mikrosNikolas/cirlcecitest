## cirlcecitest

### How it works

#### CircleCi
If a commit is merge on the branch master 
and
If the message syntax is like Bump version to <version>
then execute commit-release.sh

#### commit-relase.sh

initialize git relases 
git add a change to README.md
Copy and ad VERSION.JAR
push to release
git tag version


## Helpers

### init repo

This will recreate git with the contents of this folder and push it back to github!

```
$ ./initgit.sh
```
Also creates a branch for a new version

