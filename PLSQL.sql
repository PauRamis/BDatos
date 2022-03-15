DROP DATABASE IF EXISTS exercicis_plsql;
CREATE DATABASE exercicis_plsql;
USE exercicis_plsql;
 
DROP FUNCTION IF EXISTS gnums;
DELIMITER //
CREATE FUNCTION gnums(num1 INT, num2 INT, num3 INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE num INT;
    CASE
       WHEN num1 > num2 AND num1 > num3 THEN SET num = num1;
       WHEN num2 > num1 AND num2 > num3 THEN SET num = num2;
       ELSE SET num = num3;
   END CASE;
return (num);
END //

/* ----------- PRUEBAS ----------- */
SELECT gnums(22, 3, 4);3