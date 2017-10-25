CREATE USER isucon@'%' IDENTIFIED BY 'isucon';
GRANT ALL on *.* TO isucon@'%';
CREATE USER isucon@'localhost' IDENTIFIED BY 'isucon';
GRANT ALL on *.* TO isucon@'localhost';

