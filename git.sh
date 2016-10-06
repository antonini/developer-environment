#!/bin/bash

. ./utils/utils.sh

echo ""

# Is it to configure git globally?
GIT_EXTRAS=""
if [ "$( ask "$i18n_git_global_config_confirmation" )" == "true" ]; then
  echo ""
  echo "$i18n_git_global_config_confirmed"
  echo ""
  GIT_EXTRAS=" --global "
fi

# Git user name and email
email="$(prompt_info "$i18n_git_user_email ")"
name="$(prompt_info "$i18n_git_user_name ")"
git config $GIT_EXTRAS user.email "$email"
git config $GIT_EXTRAS user.name "$name"

# Generates global ignore file
echo "*~" >>  ~/.gitignore_global
echo ".*.swp" >>  ~/.gitignore_global
echo ".DS_Store" >>  ~/.gitignore_global

# Add dealing with newlines for editor
git config $GIT_EXTRAS core.autocrlf input

# Configure to use the global ignore file
git config $GIT_EXTRAS core.excludesfile ~/.gitignore_global

# Configure to auto fix some whitespaces problems, such as:
#  * blank spaces at the end of the file
#  * blank spaces at the end of the line
git config $GIT_EXTRAS core.whitespace blank-at-eof,blank-at-eol

# Configure the git command to use colors.
git config $GIT_EXTRAS color.ui true

# Disable git gc --auto because GitLab runs git gc for us already.
git config $GIT_EXTRAS gc.auto 0

# Configure Git to generate packfile bitmaps (introduced in Git 2.0) during git gc.
git config $GIT_EXTRAS repack.writeBitmaps true

# Configure alias for the most options used with git client
git config $GIT_EXTRAS alias.st status
git config $GIT_EXTRAS alias.cm commit
git config $GIT_EXTRAS alias.co checkout
git config $GIT_EXTRAS alias.cp cherry-pick

# Sign each commit
# Disabled to configure to prompt configuration
# List the keys
if [ "$( ask "$i18n_git_gpg_confirmation" )" == "true" ]; then
  git config $GIT_EXTRAS gpg.program gpg
#gpg --list-secret-keys --keyid-format LONG
#gpg --armor --export <key>
#git config $GIT_EXTRAS user.signingkey "<gpg key>"
  git config $GIT_EXTRAS commit.gpgsign true
#git config $GIT_EXTRAS push.gpgSign true
fi
# CentOS problem with GPG stream
#export GPG_TTY=$(tty)
echo ""
