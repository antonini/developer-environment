#!/bin/bash

# Disabled to configure to prompt configuration
#git config user.email "antonini@users.noreply.github.com"
#git config user.name "Endrigo Antonini"

# Generates global ignore file
echo "*~" >>  ~/.gitignore_global
echo ".*.swp" >>  ~/.gitignore_global
echo ".DS_Store" >>  ~/.gitignore_global

# Add dealing with newlines for editor
git config --global core.autocrlf input

# Configure to use the global ignore file
git config --global core.excludesfile ~/.gitignore_global

# Configure to auto fix some whitespaces problems, such as:
#  * blank spaces at the end of the file
#  * blank spaces at the end of the line
git config --global core.whitespace blank-at-eof,blank-at-eol

# Configure the git command to use colors.
git config --global color.ui true

# Disable git gc --auto because GitLab runs git gc for us already.
git config --global gc.auto 0

# Configure Git to generate packfile bitmaps (introduced in Git 2.0) during git gc.
git config --global repack.writeBitmaps true

# Configure alias for the most options used with git client
git config --global alias.st status
git config --global alias.cm commit
git config --global alias.co checkout
git config --global alias.cp cherry-pick

# Sign each commit
# Disabled to configure to prompt configuration
# List the keys
#git config --global gpg.program gpg2
#gpg --list-secret-keys --keyid-format LONG
#gpg --armor --export <key>
#git config --global user.signingkey "<gpg key>"
#git config --global commit.gpgsign true
#git config --global push.gpgSign true

# CentOS problem with GPG stream
#export GPG_TTY=$(tty)
