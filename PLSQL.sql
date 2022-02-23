USE test;

DROP PROCEDURE IF EXIST sign;

DELIMITER / / 
CREATE PROCEDURE sign(IN numero INT, OUT respuesta varchar(14))
BEGIN CASE
WHEN numero > 0 Then
SET
    respuesta = "Es positivo";

ELSE
WHEN numero < 0 Then
SET
    respuesta = "Es negativo";

ELSE
SET
    respuesta = "Es cero";

END CASE;

END / / DELIMETER;

CALL sign(7, @respuesta);

SELECT
    @respuesta;