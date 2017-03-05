
Setting environment for using XAMPP for Windows.
NataliaN@LAPTOP-CPEDGFGH c:\xampp
# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 2
Server version: 10.1.21-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2016, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> create user 'natalia'@'localhost' identified by 'contrasena';
Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> select * from users;
ERROR 1046 (3D000): No database selected
MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+
5 rows in set (0.17 sec)

MariaDB [(none)]> create database escuela;
Query OK, 1 row affected (0.00 sec)
MariaDB [(none)]> GRANT ALL PRIVILEGES ON escuela.* TO 'natalia'@'localhost';
Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> exit
Bye

Setting environment for using XAMPP for Windows.
NataliaN@LAPTOP-CPEDGFGH c:\xampp
# mysql -u natalia -p
Enter password: **********
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 3
Server version: 10.1.21-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2016, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| escuela            |
| information_schema |
| test               |
+--------------------+
3 rows in set (0.00 sec)

MariaDB [(none)]> use escuela;
Database changed

MariaDB [escuela]> show tables;
Empty set (0.00 sec)

MariaDB [escuela]> create table usuario(
    -> id_usuario integer unsigned primary key auto_increment,
    -> nombre varchar(200) not null,
    -> apellido varchar(200) not null,
    -> email varchar(200) not null,
    -> password varchar(200) not null
    -> );
Query OK, 0 rows affected (0.36 sec)

MariaDB [escuela]> show tables;
+-------------------+
| Tables_in_escuela |
+-------------------+
| usuario           |
+-------------------+
1 row in set (0.00 sec)

MariaDB [escuela]> alter table usuario add constraint uq_email unique(email);
Query OK, 0 rows affected (0.44 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [escuela]> describe usuario;
+------------+------------------+------+-----+---------+----------------+
| Field      | Type             | Null | Key | Default | Extra          |
+------------+------------------+------+-----+---------+----------------+
| id_usuario | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| nombre     | varchar(200)     | NO   |     | NULL    |                |
| apellido   | varchar(200)     | NO   |     | NULL    |                |
| email      | varchar(200)     | NO   | UNI | NULL    |                |
| password   | varchar(200)     | NO   |     | NULL    |                |
+------------+------------------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

MariaDB [escuela]> create table libros(
    -> id_libros integer unsigned primary key auto_increment,
    -> nombre varchar(200) not null,
    -> fecha_creacion timestamp not null default current_timestamp,
    -> tipos enum('comedia', 'drama', 'suspenso', 'romance') not null,
    -> id_usuario integer unsigned
    -> );
Query OK, 0 rows affected (0.34 sec)

MariaDB [escuela]> show tables;
+-------------------+
| Tables_in_escuela |
+-------------------+
| libros            |
| usuario           |
+-------------------+
2 rows in set (0.00 sec)
MariaDB [escuela]> describe libros;
+----------------+----------------------------------------------+------+-----+-------------------+----------------+
| Field          | Type                                         | Null | Key | Default           | Extra          |
+----------------+----------------------------------------------+------+-----+-------------------+----------------+
| id_libros      | int(10) unsigned                             | NO   | PRI | NULL              | auto_increment |
| nombre         | varchar(200)                                 | NO   |     | NULL              |                |
| fecha_creacion | timestamp                                    | NO   |     | CURRENT_TIMESTAMP |                |
| tipos          | enum('comedia','drama','suspenso','romance') | NO   |     | NULL              |                |
| id_usuario     | int(10) unsigned                             | YES  |     | NULL              |                |
+----------------+----------------------------------------------+------+-----+-------------------+----------------+
5 rows in set (0.02 sec)
