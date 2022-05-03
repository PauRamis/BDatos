DROP DATABASE IF EXISTS limbo;
CREATE DATABASE limbo;
USE limbo;

DROP TABLE IF EXISTS Ciutat;
CREATE TABLE Ciutat (
   codiCiutat INT NOT NULL,
   nom CHAR(40),
   provincia CHAR(40),
   PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Adreça;    
CREATE TABLE Adreça (
   codiAdreça INT NOT NULL,
   numClient INT NOT NULL,
   carrer CHAR(40),
   num INT,
   codiPostal INT,
   pis INT,
   porta CHAR(10),
   codiCiutat INT,
   FOREIGN KEY (numClient)
      REFERENCES Client(numClient),
   FOREIGN KEY (codiCiutat)
      REFERENCES Ciutat(codiCiutat),
   PRIMARY KEY (codiAdreça),
   PRIMARY KEY (numClient)
);

DROP TABLE IF EXISTS Client;
CREATE TABLE Client (
   numClient INT NOT NULL,
   nomClient CHAR(20),
   nomUsuari CHAR(20),
   contrasenya CHAR(20),
   correu CHAR (70),
   PRIMARY KEY (numClient)
);

DROP TABLE IF EXISTS Particulars;
CREATE TABLE bb (
   Nif INT NOT NULL,
   numClient INT NOT NULL,
   dataNaix DATE,
   FOREIGN KEY (numClient)
      REFERENCES Client(numClient),
   PRIMARY KEY (Nif),
   PRIMARY KEY (numClient)
);

DROP TABLE IF EXISTS Empreses;
CREATE TABLE Empreses (
   Cif INT NOT NULL,
   numClient CHAR(40),
   activitat CHAR(40),
   FOREIGN KEY (numClient)
      REFERENCES Client(numClient),
   PRIMARY KEY (Cif),
   PRIMARY KEY (numClient)
);

DROP TABLE IF EXISTS Historial_Descomptes;
CREATE TABLE Historial_Descomptes (
   numClient INT NOT NULL,
   codiProducte CHAR(40),
   data CHAR(40),
   percentatge INT,
   FOREIGN KEY (numClient)
      REFERENCES Client(numClient),
   FOREIGN KEY (codiProducte)
      REFERENCES Producte(codiProducte),
   PRIMARY KEY (numClient),
   PRIMARY KEY (codiProducte),
   PRIMARY KEY (data)
);

DROP TABLE IF EXISTS Targeta;
CREATE TABLE Targeta (
   número INT NOT NULL,
   tipus CHAR(40),
   caducitat CHAR(40),
   codiSeguretat INT,
   numClient INT,
   FOREIGN KEY (numClient)
      REFERENCES Client(numClient),
   PRIMARY KEY (número)
);

DROP TABLE IF EXISTS Compra;
CREATE TABLE Compra (
   codi INT NOT NULL,
   data DATE,
   import INT,
   PRIMARY KEY (codi)
);

DROP TABLE IF EXISTS Producte_Compra;
CREATE TABLE Producte_Compra (
   codiCompra INT NOT NULL,
   codiProducte INT NOT NULL,
   nombreUnitats INT,
   FOREIGN KEY (codiCompra)
      REFERENCES Compra(codi),
   FOREIGN KEY (codiProducte)
      REFERENCES Producte(codiProducte),
   PRIMARY KEY (codiCompra),
   PRIMARY KEY (codiProducte)
);

DROP TABLE IF EXISTS Producte;
CREATE TABLE Producte (
   codiProducte CHAR(20) NOT NULL,
   descripció CHAR(40),
   unitatMesura CHAR(40),
   pes INT,
   marca CHAR(40),
   PVP INT,
   IVA INT,
   PRIMARY KEY (codiProducte)
);
/*codi productes alfanumeric*/