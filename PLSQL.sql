USE test;

DROP PROCEDURE IF EXISTR sign;

DELIMENTER / / CREATE PROCEDURE sign(IN numero INT, OUT respuesa varchar(14)) BEGIN CASE
    WHEN numero > 0 Then
    SET
        respuesa = "Es positivo";

WHEN numero < 0 Then
SET
    respuesa = "Es negativo";

ELSE
SET
    respuesa = "Es cero";

END CASE
;

END / / DELIMETER;

CALL sign(7, @respuesa);
SELECT @respuesa;