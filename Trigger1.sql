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
   PRIMARY KEY (id)
);

delimiter $$

CREATE TRIGGER trigger_check_nota_before_insert
   BEFORE INSERT ON alumnes
   FOR EACH ROW
BEGIN
   IF new.nota < 0 THEN
   SET new.nota = 0;
   END IF;

   IF new.nota > 10 THEN
   SET new.nota = 10;
   END IF; 
END$$

CREATE TRIGGER trigger_check_nota_before_update
   BEFORE UPDATE ON alumnes
   FOR EACH ROW
BEGIN
   IF new.nota < 0 THEN
   SET new.nota = 0;
   END IF;

   IF new.nota > 10 THEN
   SET new.nota = 10;
   END IF;
END$$

/* inserts */
INSERT INTO `alumnes` 
VALUES (1,'et','soluta','Elise',5),(2,'in','quae','Jamie',-1),(3,'et','porro','Isaiah',629); 