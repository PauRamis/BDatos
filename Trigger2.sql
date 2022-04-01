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
CREATE PROCEDURE crear_email(IN nom CHAR(20), IN cognom1 CHAR(20), IN cognom2 CHAR(20), IN domini CHAR(20), OUT gmail VARCHAR(20))
BEGIN
   SELECT SUBSTRING(nom, 1, 1) AS ExtractString;
   SET gmail = ExtractString;
END //

/* El primer caràcter de l'paràmetre nom.
Els tres primers caràcters de l'paràmetre cognom1.
Els tres primers caràcters de l'paràmetre cognom2.
El caràcter @.
El domini passat com a paràmetre. */



/* inserts */
INSERT INTO `alumnes` 
VALUES (1,'et','soluta','Elise',5,'blala'),(2,'in','quae','Jamie',-1,'blala'),(3,'et','porro','Isaiah',629,'blala'); 