DROP DATABASE IF EXISTS exercicis_plsql;
CREATE DATABASE exercicis_plsql;
USE exercicis_plsql;
-- Escriu un procediment que rebi un nombre real d'entrada
--  i mostri un missatge indicant si el número és positiu,
--  negatiu o zero.
DROP PROCEDURE IF EXISTS prueba;
DELIMITER //
CREATE PROCEDURE prueba(IN num DECIMAL, OUT resultat VARCHAR(20))
BEGIN
    IF num >= 0 AND num < 5 THEN
        SELECT resultat = "Insuficient";
    ELSE IF num < 6 THEN
        SELECT resultat = "Aprovat";
    ELSE IF num < 7 THEN
        SELECT resultat = "Bé";
    ELSE IF num < 9 THEN
        SELECT resultat = "Notable";
    ELSE IF num <= 10 THEN
        SELECT resultat = "Excel·lent";
    ELSE
        SELECT resultat = "Nota no valida";
    END IF;
END //

/* ----------- PRUEBAS ----------- */

SET resultat