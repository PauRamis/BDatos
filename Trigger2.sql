DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DROP TABLE IF EXISTS alumnes;
CREATE TABLE alumnes (
   id INT NOT NULL AUTO_INCREMENT,
   nom CHAR(20),
   cognom1 CHAR(20),
   cognom2 CHAR(20),
   nota INT,
   domini CHAR(20),
   PRIMARY KEY (id)
);

DROP PROCEDURE IF EXISTS crear_email;
DELIMITER //
CREATE PROCEDURE crear_email(IN gmail CHAR)
BEGIN
 
END //