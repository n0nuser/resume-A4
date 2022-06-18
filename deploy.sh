#!/bin/bash

# HELP HERE: https://gohugo.io/hosting-and-deployment/hosting-on-github/
# HELP HERE: https://gohugo.io/hosting-and-deployment/hosting-on-netlify/

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Run Hugo for folder Resources
hugo --gc --minify
printf "Resources folder generated"

# Add changes to git.
git add .
printf "Changes added to stage"

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi

git commit -m "$msg"
printf "Commit message set: $msg"

# Push source and build repos.
git push origin master
printf "Commit pushed!"