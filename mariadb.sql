mysql -u root
CREATE DB sampledb;
CREATE USER 'mariadb'@'%' IDENTIFIED BY 'pass'; //remote access all IPs
CREATE USER 'mariadb'@'localhost' IDENTIFIED BY 'pass'; //local access

GRANT ALL PRIVILEGES ON *.* TO 'mariadb'@'%' IDENTIFIED BY 'pass' WITH GRANT OPTION; //pour toutes les DBs
GRANT ALL PRIVILEGES ON *.* TO 'mariadb'@'localhost' IDENTIFIED BY 'pass' WITH GRANT OPTION;
FLUSH PRIVILEGES;


GRANT ALL PRIVILEGES ON database.sampledb TO 'mariadb'@'%'; //pour 1 DB specifique

USE sampledb;
CREATE OR REPLACE TABLE t1(c1 int,c2 char(10));

INSERT INTO t1 VALUES(1,"item 1");
INSERT INTO t1 VALUES(2,"item 2");
INSERT INTO t1 VALUES(3,"item 3");
--
UPDATE user SET Password=PASSWORD(‘pass’) where USER='mariadb';

SELECT User, Host FROM mysql.user;

show databases;
show tables;


mysql -u mariadb -ppass -h localhost sampledb
