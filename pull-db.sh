#!/bin/sh

# shell script to export a given database from MAMP -- referenced by our standard makefile

/Applications/MAMP/Library/bin/mysqldump -u root -proot $1 > $2