CREATE DATABASE wordpress;
CREATE USER 'wp_user'@'%' IDENTIFIED BY 'securepassword';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'%';
FLUSH PRIVILEGES;