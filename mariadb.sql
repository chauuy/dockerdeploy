CREATE USER 'myuser'@'%' IDENTIFIED BY 'mypass';

GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'%' IDENTIFIED BY 'mypass' WITH GRANT OPTION;
 FLUSH PRIVILEGES;

SELECT User, Host FROM mysql.user;


GRANT ALL PRIVILEGES ON database.sampledb TO 'mariadb'@'%';
