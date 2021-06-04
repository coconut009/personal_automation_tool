Initial setup
Install git: https://git-scm.com/downloads

 
Before change (Pull)
git fetch --all
git reset --hard origin/master

After change (Push)
git add . 
git status //Check the changes are correct
git commit -m “commit_message”
git push -u origin master //git push -u origin [branchName]


