#!/bin/sh
# This is a simple script that pulls down the latest version of Wordpress
# from the public repository. 
TARGET=$1

git clone https://github.com/WordPress/WordPress.git $TARGET
cd $TARGET
git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
rm -rf .git
