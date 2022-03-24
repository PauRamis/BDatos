DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;
 
DROP TABLE IF EXISTS alumnes;

CREATE TABLE alumnes (
   id INT PRIMARY KEY AUTO_INCREMENT,
   nom CHAR(20),
   cognom1 CHAR(20),
   cognom2 CHAR(20),
   nota INT 
);

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
