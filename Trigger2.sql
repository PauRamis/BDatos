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
   domini CHAR(10),
   gmail CHAR(30) DEFAULT NULL,
   PRIMARY KEY (id)
);

DROP PROCEDURE IF EXISTS crear_email;
DELIMITER //
CREATE PROCEDURE crear_email(IN nom CHAR(20), IN cognom1 CHAR(20), IN cognom2 CHAR(20), IN domini CHAR(20), OUT defgmail VARCHAR(20))
BEGIN
   SELECT SUBSTRING(nom, 1, 1) AS Exnom;
   SELECT SUBSTRING(cognom1, 1, 3) AS Excognom1;
   SELECT SUBSTRING(cognom2, 1, 3) AS Excognom2;

   SET defgmail = Exnom + Excognom1 + Excognom2 + "@" + domini;
END //

delimiter $$

CREATE TRIGGER trigger_crear_email_before_insert
   BEFORE INSERT ON alumnes
   FOR EACH ROW
BEGIN
   IF new.gmail = NULL THEN
   CALL crear_email(nom, cognom1, cognom2, domini);
   SET new.gmail = defgmail;
   END IF;
END$$

/* inserts */
INSERT INTO `alumnes` (id, nom, cognom1, cognom2, nota, domini)
VALUES (1,'et','soluta','Elise',5,'blala'),(2,'in','quae','Jamie',-1,'blala'),(3,'et','porro','Isaiah',629,'blala'); 