#!/bin/bash
ORGANIZATION='iptomar'
PROJECT='projectary-bd'
TIMESTAMP="${date +"%T"}"
DATABASENAME="projectary-master"
git remote add upstream git@github.com:$ORGANIZATION/$PROJECT.git
git stash
git fetch upstream
git pull upstream master
git stash pop
mysqldump -u $1 -p --routines --databases $DATABASENAME --result-file="projectary-bd-dump_$TIMESTAMP.sql"
mysql -u $1 -p < projectary-bd-dump.sql
