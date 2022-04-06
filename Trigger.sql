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

DROP TABLE IF EXISTS log_cambios_email;
CREATE TABLE log_cambios_email (
   id INT NOT NULL AUTO_INCREMENT,
   id_alumno INT,
   fecha_hora DATETIME,
   old_email CHAR(100),
   new_email CHAR(100),
   FOREIGN KEY (id_alumno)
      REFERENCES alumnes(id),
   PRIMARY KEY (id)
);
DROP TABLE IF EXISTS log_alumnos_eliminados;
CREATE TABLE log_alumnos_eliminados (
   id INT NOT NULL AUTO_INCREMENT,
   id_alumno INT,
   fecha_hora DATETIME,
   nom CHAR(20),
   cognom1 CHAR(20),
   cognom2 CHAR(20),
   gmail CHAR(30),
   FOREIGN KEY (id_alumno)
      REFERENCES alumnes(id),
   PRIMARY KEY (id)
);


DROP PROCEDURE IF EXISTS crear_email;
DELIMITER //
CREATE PROCEDURE crear_email(IN nom CHAR(20), IN cognom1 CHAR(20), IN cognom2 CHAR(20), IN domini CHAR(20), OUT defgmail VARCHAR(100))
BEGIN
   SET defgmail = LOWER(CONCAT(SUBSTRING(nom, 1, 1), SUBSTRING(cognom1, 1, 3), SUBSTRING(cognom2, 1, 3), "@", domini, ".com"));
END //

delimiter $$
/*Trigger1*/
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

/*Trigger2*/

CREATE TRIGGER trigger_crear_email_before_insert
   BEFORE INSERT ON alumnes
   FOR EACH ROW
BEGIN
   IF new.gmail IS NULL THEN
      CALL crear_email(new.nom, new.cognom1, new.cognom2, new.domini, new.gmail);
   END IF;
END$$

/*Trigger3*/
CREATE TRIGGER trigger_guardar_email_after_update
AFTER UPDATE ON alumnes
FOR EACH ROW
BEGIN
   IF new.gmail != old.gmail THEN
      INSERT INTO log_cambios_email (id_alumno, fecha_hora, old_email, new_email) 
      VALUES (new.id, NOW(), old.gmail, new.gmail);
   END IF;
END$$

/*Trigger4*/
CREATE TRIGGER trigger_guardar_alumnos_eliminados
AFTER DELETE ON alumnes
FOR EACH ROW
BEGIN
      INSERT INTO log_alumnos_eliminados (id_alumno, fecha_hora, nom, cognom1, cognom2, gmail) 
      VALUES (old.id, NOW(), old.nom, old.cognom1, old.cognom2, old.gmail);
END$$

/* inserts */
INSERT INTO alumnes (id, nom, cognom1, cognom2, nota, domini)
VALUES (1,'et','soluta','Elise',5,'blala'),(2,'in','quae','Jamie',-1,'blala'),(3,'et','porro','Isaiah',629,'blala'); 