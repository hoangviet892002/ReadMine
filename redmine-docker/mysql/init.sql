CREATE DATABASE redmine CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER 'redmine'@'%' IDENTIFIED BY 'your_password_here';
GRANT ALL PRIVILEGES ON redmine.* TO 'redmine'@'%';

USE redmine;

-- You can add initial data or other setup commands here if needed.