sed -i "s/\${DATABASE_NAME}/$DATABASE_NAME/g"			/database.sql
sed -i "s/\${DATABASE_USER}/$DATABASE_USER/g"			/database.sql
sed -i "s/\${DATABASE_USER_PWD}/$DATABASE_USER_PWD/g"	/database.sql
sed -i "s/\${DATABASE_ROOT_PWD}/$DATABASE_ROOT_PWD/g"	/database.sql

mysql_install_db --user=mysql --datadir=/var/lib/mysql

exec mariadbd --no-defaults --user=root --datadir=/var/lib/mysql --init-file=/create_db.sql