#BAckup Base de Dados
DATABASENAME="projectary-master"
mysqldump -u $1 -p --routines --databases $DATABASENAME --result-file="projectary-bd-dump.sql"
