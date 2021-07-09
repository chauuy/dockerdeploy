CREATE USER 'myuser'@'%' IDENTIFIED BY 'mypass'; //remote access

GRANT ALL PRIVILEGES ON *.* TO 'mariadb'@'%' IDENTIFIED BY 'pass' WITH GRANT OPTION;
 FLUSH PRIVILEGES;

UPDATE user SET Password=PASSWORD(‘pass’) where USER='mariadb';

SELECT User, Host FROM mysql.user;

show databases;

show tables;

GRANT ALL PRIVILEGES ON database.sampledb TO 'mariadb'@'%';
