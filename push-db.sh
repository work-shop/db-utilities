#!/bin/bash

# shell script to import a database to MAMP -- referenced by our standard makefile
DB_NAME=$1
SQL_FILE=$2
DB_EXISTS=$(/Applications/MAMP/Library/bin/mysqlshow -u root -proot -count "$DB_NAME" | grep $DB_NAME | grep "Wildcard" | wc -l)

if [ $DB_EXISTS -eq 0 ]; then
	/Applications/MAMP/Library/bin/mysql -u root -proot $DB_NAME < $SQL_FILE
else
	/Applications/MAMP/Library/bin/mysql -u root -proot -e "CREATE DATABASE '$DB_NAME'";
	/Applications/MAMP/Library/bin/mysql -u root -proot $DB_NAME < $SQL_FILE
fi