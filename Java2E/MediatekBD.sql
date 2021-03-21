-- file MediatekBD.sql
-- Mediatek | Base de données --
-- @author TAN Lucie SOUCCOUCHETTY Darlène --
-- Platforme : Oracle XE --

-- Initialisation de la base de données
ALTER SESSION SET NLS_DATE_FORMAT = 'dd/mm/yyyy';ALTER SESSION SET NLS_DATE_FORMAT = 'dd/mm/yyyy';
DROP TABLE Utilisateur CASCADE CONSTRAINT PURGE;
DROP TABLE Document CASCADE CONSTRAINT PURGE;
DROP TABLE Emprunt CASCADE CONSTRAINT PURGE;
DROP TABLE Livre CASCADE CONSTRAINT PURGE;
DROP TABLE Dvd CASCADE CONSTRAINT PURGE;
DROP TABLE Cd CASCADE CONSTRAINT PURGE;
DROP SEQUENCE DocSerie;
DROP SEQUENCE EmpruntSerie;

CREATE SEQUENCE DocSerie START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE EmpruntSerie START WITH 1 INCREMENT BY 1;

-- Création des tables
CREATE TABLE Utilisateur
(
    ID_Utilisateur INTEGER CONSTRAINT PK_Utilisateur PRIMARY KEY,
    Pseudo VARCHAR(30) NOT NULL,
    Login VARCHAR(30) NOT NULL,
    Mdp VARCHAR2(30) NOT NULL
)
/

CREATE TABLE Document
(
    ID_Doc INTEGER CONSTRAINT PK_Doc PRIMARY KEY,
    Auteur VARCHAR (50),
    Titre VARCHAR(30) NOT NULL UNIQUE,
    Etat_document NUMBER (1), -- Si document emprunté Etat_Document = 1, Si document libre Etat_Document = 0
    Type_Doc VARCHAR (10)
)
/
CREATE TABLE Emprunt 
(
	ID_Emprunt INTEGER CONSTRAINT PK_Emprunt PRIMARY KEY,
	ID_U INTEGER,
	ID_D INTEGER
)
/
CREATE TABLE Livre 
(
    ID_Livre INTEGER CONSTRAINT PK_Livre PRIMARY KEY,
    Titre VARCHAR (30) NOT NULL UNIQUE,
    Auteur VARCHAR (50),
    AnneePub VARCHAR (4)
)
/
CREATE TABLE Dvd
(
    ID_Dvd INTEGER CONSTRAINT PK_Dvd PRIMARY KEY,
    Titre VARCHAR(30) NOT NULL UNIQUE,
    Realisateur VARCHAR (50),
    AnneePub VARCHAR (4)
)
/
CREATE TABLE Cd
(
    ID_Cd INTEGER CONSTRAINT PK_Cd PRIMARY KEY,
    Titre VARCHAR(30) NOT NULL UNIQUE,
    Interprete VARCHAR (50),
    AnneePub VARCHAR (4)
)
/

-- Ajout des contraintes --


ALTER TABLE Emprunt
ADD CONSTRAINT FK_ID_Utilisateur FOREIGN KEY(ID_Utilisateur) REFERENCES Utilisateur(ID_Utilisateur) ON DELETE CASCADE
ADD CONSTRAINT FK_ID_Document FOREIGN KEY(ID_Doc) REFERENCES Document(ID_Doc) ON DELETE CASCADE

-- Insertion d'un jeu de données --
INSERT INTO Utilisateur(ID_Utilisateur, Pseudo, Login, Mdp) VALUES (1, 'Lucie14', 'Lucie', '14122001');
INSERT INTO Utilisateur(ID_Utilisateur, Pseudo, Login, Mdp) VALUES (2, 'Darlene15', 'Darlene', '15042002');
INSERT INTO Utilisateur(ID_Utilisateur, Pseudo, Login, Mdp) VALUES (3, 'JFBrette', 'Brettebrette', 'iutpro');

INSERT INTO Document (ID_Doc, Auteur,Titre,  Etat_Document, Type_Doc) VALUES (DocSerie.NEXTVAL,'St Exupery',  'Le petit prince',  1, 'Livre');
INSERT INTO Document (ID_Doc, Auteur,Titre,  Etat_Document, Type_Doc) VALUES (DocSerie.NEXTVAL,'Pixar', 'La-Haut',  1, 'DVD');
INSERT INTO Document (ID_Doc, Auteur,Titre,  Etat_Document, Type_Doc) VALUES (DocSerie.NEXTVAL, 'Wejdene', 'Coco',  1, 'CD');
INSERT INTO Document (ID_Doc, Auteur,Titre,  Etat_Document, Type_Doc) VALUES (DocSerie.NEXTVAL, 'Emeric le boss', 'Emeric',  0, 'Livre');
INSERT INTO Document (ID_Doc, Auteur,Titre,  Etat_Document, Type_Doc) VALUES (DocSerie.NEXTVAL, 'Christopher Nolan', 'Inception',  1, 'DVD');
INSERT INTO Document (ID_Doc, Auteur,Titre,  Etat_Document, Type_Doc) VALUES (DocSerie.NEXTVAL, 'Tim Burton', 'Charlie et la chocolaterie',  0, 'Livre');
INSERT INTO Document (ID_Doc, Auteur,Titre,  Etat_Document, Type_Doc) VALUES (DocSerie.NEXTVAL, 'CiscoToutou', 'TurkeyBurger',  0, 'CD');
INSERT INTO Document (ID_Doc, Auteur,Titre,  Etat_Document, Type_Doc) VALUES (DocSerie.NEXTVAL, 'CiscoToutou', 'BoulMarine',  0, 'CD');
INSERT INTO Document (ID_Doc, Auteur,Titre,  Etat_Document, Type_Doc) VALUES (DocSerie.NEXTVAL, 'Harley Bird', 'Peppa Pig',  0, 'Livre');

INSERT INTO Emprunt (ID_Emprunt, ID_U, ID_D) VALUES (EmpruntSerie.NEXTVAL, 1, 3);
INSERT INTO Emprunt (ID_Emprunt, ID_U, ID_D) VALUES (EmpruntSerie.NEXTVAL, 2, 2);
INSERT INTO Emprunt (ID_Emprunt, ID_U, ID_D) VALUES (EmpruntSerie.NEXTVAL, 3, 1);

-- Affichage des tables avec les jeux de données --
SELECT * FROM Utilisateur;
SELECT * FROM Document;
SELECT * FROM Emprunt;

COMMIT;

SET FEEDBACK ON
