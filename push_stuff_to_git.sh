#!/bin/bash

git add . # add all files in the current directory to the git commit
git commit -m "jetzt steht da etwas anderess" # create the commit and add the commit message "this is a commit"
git push # push all commits to git that are not on git yet
# note doing it this way is very bad practice as the commit message has no meaning and pushing evry 
#file that was changes makes a mess when working with multiple people