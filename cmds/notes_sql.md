# Relational Database

## Useful Links and Symbols

-   𝑳𝒊𝒔𝒕 𝒐𝒇 𝐔𝐬𝐞𝐟𝐮𝐥𝐥 𝑺𝒚𝒎𝒃𝒐𝒍𝒔: ⌘ ⌥ + ⌃ + ⤶ ⇧  ⤶ ⬋ ↩︎ ↲ ↵ ↫ ♥ ★ 🎾 &
-   🔥 MYSQL: PASSWORD FOR MY CURRENT DATABASE: `AMs#....`
-   🔥 DOCUMENTATION OF MYSQL: https://dev.mysql.com/doc/refman/8.0/en/

## MYSQL

### LOGIN & LOGOUT

-   `$ mysql -u root -p`

    -   to connect to mysql server as 'root' user using password.

-   `$ mysql -u Farzana -p`

    -   login with username - 'Farzana'

-   `$ mysql -h host -u user -p`

    -   If the server runs on a machine other than the one where you log in, you must also specify a host name along username

-   `mysql> QUIT;`

    -   to quit mysql server

-   `mysql> mysql.server start;`

    -   Turn the mysql server on

-   `mysql> mysql.server stop;`

    -   Turn the mysql server off.

-   `mysql> source file_name.sql;`
    -   to execute a sql file named file_name.sql

### PRIMARYLY USEFULL MYSQL COMMAND

-   `mysql> SHOW DATABASES;`

    -   Lists out the databases that are accessible by the MySQL DBMS.

-   `mysql> USE Databasename;`

    -   This will be used to select a database in the MySQL workarea.

-   `mysql> SHOW [FULL] TABLES;`

    -   Shows the tables in the database once a database has been selected with the use-command (`USE Databasename`).

-   `mysql> SHOW COLUMNS FROM tablename;`

    -   Shows the attributes, types of attributes, key information, whether NULL is permitted, defaults, and other information for a table.

-   `mysql> SHOW INDEX FROM tablename;`

    -   Presents the details of all indexes on the table, including the PRIMARY KEY.

-   `mysql> SHOW TABLE STATUS LIKE tablename\G;`

    -   Reports details of the MySQL DBMS performance and statistics.

-   `DESCRIPBE TABLE;`

    -   Describe the given table.

-   `EXPLAIN DATABASE.TABLE;`
    -   Describe the given table as `DESCRIBE TABLE` does

### ADMINISTRATIVE OPERATIONS

-   `mysql> CREATE user 'Farzana'@'localhost' IDENTIFIED BY 'FBs#7591';`

    -   Create a user by username 'Farzana' with password 'FBs#7591'

-   `mysql> DROP USER 'Farzana'@'localhost';`

    -   Delete a user 'Farzana' from the database.

-   `mysql> delete from mysql.user where user='Farzana' and host='localhost';`

    -   Delete a user named 'Farzana' from the user table

-   `mysql> SELECT VERSION(), CURRENT_DATE;`

    -   to asks the server to tell you its version number and the current date

-   `mysql> SELECT CURRENT_USER();`

    -   Returns the current MySQL username and hostname.

-   `mysql> SELECT user FROM mysql.user;`

    -   Select user column from user table of mysql databases

-   `mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('AMs#....');`

    -   Set password as 'AMs#....' for root user

-   `mysql> UPDATE mysql.user SET Password=PASSWORD('ABs#1234') WHERE User='A.Momin';`

    -   Set password as 'AMs#....' for root user

-   `mysql> GRANT ALL ON book_shop.* TO 'Farzana' IDENTIFIED BY 'FBs#7591';`

    -   Give a user, 'Farzana', all privileges of the database, book_shop

-   `mysql> FLUSH PRIVILEGES;`

    -   Rereads the privileges from the grant tables in the mysql system schema

-   `mysql> help ALTER`
    -   provide help about `ALTER`

#### ALTER

-   `mysql> help ALTER SERVER`

    -   Provide help of the command, 'ALTER' with item 'SERVER'.

-   `mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'PASS#...’;`

    -   Change password of 'root' user from old password to new password, PASS#...

-   `mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Shahs#1300';`

    -   Update password of root user

-   `mysql> ALTER USER 'jeffrey'@'localhost' PASSWORD EXPIRE;`

    -   To expire an account password manually

-   `mysql> SELECT SIN(PI()/4), (4+1)*5;`
    -   Performs mathematical operations.

#### PRIVILEGES

-   `mysql> GRANT ALL ON interview_questions.* TO 'A.Momin'@'localhost';`

### UNINSTAL MYSQL

-   Open a terminal window.
-   Use mysqldump to backup your databases to text files!
-   Stop the database server.
-   sudo rm /usr/local/mysql.
-   sudo rm -rf /usr/local/mysql\*
-   sudo rm -rf /Library/StartupItems/MySQLCOM.

## POSTGRESQL

-   Adds `PostgreSQL` to the `PATH` variable:
    -   `export PATH=${PATH}:/Applications/Postgres.app/Contents/Versions/13/bin`
-   note: sudo mkdir -p /etc/paths.d && echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp
-   MASTER PASSWORD: `AMs#....`

### Connection:

-   `$ psql --help`
-   `$ psql [OPTION]... [DBNAME [USERNAME]]`
-   `$ psql -h localhost -p 5432 -U a.momin a.momin`

    -   USERNAME: a.momin
    -   DBNAME: a.momin

    -   Connection options:
        -   `-h, --host=HOSTNAME`
            -   database server host or socket directory (default: "local socket")
        -   `-p, --port=PORT`
            -   database server port (default: "5432")
        -   `-U, --username=USERNAME`
            -   database user name (default: "a.momin")
        -   `-w, --no-password`
            -   never prompt for password
        -   `-W, --password`
            -   force password prompt (should happen automatically)

### Usefull Commands:

-   `UserName-# \c`
    -   opyright for distribution terms
-   `UserName-# \h`
    -   for help with SQL commands
-   `UserName-# \?`
    -   for help with psql commands
-   `UserName-# \g`
    -   or terminate with semicolon to execute query
-   `UserName-# \q`
    -   to quit
-   `a.momin-# \l`
    -   `a.momin-#` -> The `psql` prompt
    -   list out all the databases
-   `a.momin-# \c postgres`
    -   Conect to `postgres` database from whatever database your are using.

### PGAdmin

-   postgres
    -   Default username, a precreated database name
    -   Master password: AMs#1300
        -   Valid for all databases except for user created databases with different password
