mysql -u root
CREATE DB sampledb;
CREATE USER 'mariadb'@'%' IDENTIFIED BY 'pass'; //remote access
CREATE USER 'mariadb'@'localhost' IDENTIFIED BY 'pass';

GRANT ALL PRIVILEGES ON *.* TO 'mariadb'@'%' IDENTIFIED BY 'pass' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'mariadb'@'localhost' IDENTIFIED BY 'pass' WITH GRANT OPTION;
FLUSH PRIVILEGES;

USE sampledb;
CREATE OR REPLACE TABLE t1(c1 int,c2 char(10));

UPDATE user SET Password=PASSWORD(‘pass’) where USER='mariadb';

SELECT User, Host FROM mysql.user;

show databases;
show tables;

GRANT ALL PRIVILEGES ON database.sampledb TO 'mariadb'@'%';

mysql -u mariadb -ppass -h localhost sampledb
