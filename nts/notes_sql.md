# Relational Database

## Useful Links and Symbols

-   𝑳𝒊𝒔𝒕 𝒐𝒇 𝐔𝐬𝐞𝐟𝐮𝐥𝐥 𝑺𝒚𝒎𝒃𝒐𝒍𝒔: ⌘ ⌥ + ⌃ + ⤶ ⇧  ⤶ ⬋ ↩︎ ↲ ↵ ↫ ♥ ★ 🎾 &
-   [Learn PostgreSQL Tutorial - Full Course for Beginners](https://www.youtube.com/watch?v=qw--VYLpxG4&t=1615s)
-   [SQL Tutorial - Full Database Course for Beginners](https://www.youtube.com/watch?v=HXV3zeQKqGY&t=4269s)
-   🔥 MOS01:
    -   `ROOT` USER PASSWORD : `S...s.....`
    -   `Shah` USER PASSWORD : `s........9`
-   🔥 MOS02:
    -   `ROOT` USER PASSWORD : `AMs#....`
-   🔥 DOCUMENTATION OF MYSQL: https://dev.mysql.com/doc/refman/8.0/en/

## MYSQL

-   How to start/stop mysql server from terminal
    ```bash
    alias startmysql="sudo /usr/local/mysql/support-files/mysql.server start"
    alias stopmysql="sudo /usr/local/mysql/support-files/mysql.server stop"
    alias statusmysql="sudo /usr/local/mysql/support-files/mysql.server status"
    alias logmysql="tail -f /usr/local/mysql/data/$(hostname).err"
    ```

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

-   `mysql> CREATE user 'Shah'@'localhost' IDENTIFIED BY 'shah711409';`
-   `mysql> GRANT ALL PRIVILEGES ON *.* TO 'Shah'@'localhost' WITH GRANT OPTION;`
-   `mysql> FLUSH PRIVILEGES;`
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

-   `$ /usr/local/var/postgresql\@14/pg_hba.conf`
-   `$ /usr/local/var/postgresql\@14/postgresql.conf`
-   `$ createdb --help`

    -   createdb creates a PostgreSQL database.
    -   Usage:
        -   `$ createdb [OPTION]... [DBNAME] [DESCRIPTION]`

-   PostgreSQL installed through `Homebrew`:

    -   `$ brew info postgresql` → Find information about 'postgresql' installed through 'brew'.
    -   `$ brew services run/start postgresql` → Run/Start the service formula without/with registering to launch at login (or boot) of your machine.
    -   `$ brew services stop/kill postgresql` → Stop the service formula immediately and unregister/keeping-registered it from launching at login of your machine.
    -   `$ brew services restart postgresql@14` → To restart postgresql@14 after an upgrade.

-   Adds `PostgreSQL` to the `PATH` variable:
    -   `export PATH=${PATH}:/Applications/Postgres.app/Contents/Versions/13/bin`
-   note: `sudo mkdir -p /etc/paths.d && echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp`
-   MASTER PASSWORD: `AMs#....`

#### How to `search`/`install`/`run`/`start` and `stop` PostgreSQL through Homebrew.

-   `$ brew search postgres`
-   `$ brew install postgresql@14`
-   `$ brew services run/start postgresql`
-   `$ psql postgres` → Start using pre-defined 'postgres` database.
-   `$ brew services stop/kill postgresql`
-   `$ brew services list` → Check status

### Connect/Login:

-   `$ brew services run/start postgresql` → Run/Start the service formula without/with registering to launch at login (or boot) of your machine.
-   `$ psql -l` → List out available PostgreSQl DB.
-   `$ createdb am` → Create a DB using `createdb` utility included with PostgreSQl.
-   `$ psql` → login to PostgreSQL using the default DB name ('am') as Super-user ('am')
-   `$ psql db_name` → login to `db_name` DB as Super-user.

-   `$ psql --help`
-   `$ psql [OPTION]... [DBNAME [USERNAME]]`
-   `$ psql -U am`
    -   If database name explicitly is not provided, pg tries to login the user into the db ('am') named by the username ('am').
-   `$ psql -U am -d am`
-   `$ psql -h localhost -p 5432 -U amomin amomin`
-   `$ psql -h localhost -p 5432 -U airflow -d airflow_docker`
-   `$ psql -h localhost -p 5432 -U interview_questions -d interview_questions`
-   `$ psql -U interview_questions -d interview_questions`
-   `$ psql -U airflow -d airflow_docker`
-   `$ psql -h localhost -p 5432 -U am am`
-   `DBName-# \c database_name` → Connect to the given database from the current database (DBName).

    -   Connection options:
        -   `-d, --dbname=DBNAME`
            -   database name to connect
        -   `-h, --host=HOSTNAME`
            -   database server host or socket directory (default: "local socket")
        -   `-p, --port=PORT`
            -   database server port (default: "5432")
        -   `-U, --username=USERNAME`
            -   database user name (default: "am")
        -   `-w, --no-password`
            -   never prompt for password
        -   `-W, --password`
            -   force password prompt (should happen automatically)

```yml
-   User: am
    -   DBNAME: am
    -   Password: a.......4
-   User: amomin
    -   DBNAME: amomin
    -   Password: s...s.....
-   User: airflow
    -   DBNAME: airflow_docker
    -   Password: airflow
-   User: interview_questions
    -   DBNAME: interview_questions
    -   Password: 1111
```

### Usefull Commands:

-   `DBName-# \?`
-   `DBName-# \c` → opyright for distribution terms
-   `DBName-# \h` → for help with SQL commands
-   `DBName-# \?` → for help with psql commands
-   `DBName-# \g` → or terminate with semicolon to execute query
-   `DBName-# \q` → quit from the PostgreSQL.
-   `a.momin-# \l` → list out all the databases.
-   `a.momin-# \c postgres` → Conect to pre-defined `postgres` database from whatever database you'r are using.
-   `DBName-# \dt` → list of all tables in the currently connected database, along with information such as their schema and owner.
-   `DBName-# \du` → list all users and their attributes, including their username, whether they are a superuser or can create databases, and their role memberships.
-   `DBName-# \du UserName` → To check the group(s) the user is associated with.
-   `DBName-# \! clear` → To clear the psql CLI.

-   `DBName-# CREATE USER a.momin WITH PASSWORD 's...s.....';`
-   `DBName-# CREATE USER interview_questions WITH PASSWORD '1111';`
-   `postgres=# CREATE DATABASE interview_questions WITH OWNER = interview_questions;`
-   `postgres=# CREATE DATABASE your_database_name WITH OWNER = your_username;`
-   `postgres=# ALTER USER am WITH PASSWORD 's...s.....';`
-   `postgres=# SELECT * FROM pg_user WHERE usename = 'am';`
-   `postgres=# SELECT * FROM pg_user;`
-   `postgres=# SELECT usename FROM pg_user;`
-   `postgres=# `
-   `DBName=# \i my_script.sql`

-   How to delete a user?
    -   `$ DROP ROLE username;`
-   How to delete a database?
    -   `$ DROP DATABASE database_name;`

### PGAdmin

-   postgres
    -   Default username, a precreated database name
    -   Master password: AMs#1300
        -   Valid for all databases except for user created databases with different password
