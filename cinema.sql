CREATE DATABASE IF NOT EXISTS cinema CHARACTER set utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE cinema.tarifs 
(
id_tarifs INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
prix FLOAT,
descr VARCHAR (45))
engine = INNODB;

CREATE TABLE cinema.cinema 
(
id_cinema INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
adresse VARCHAR(100),
ville VARCHAR(100),
id_tarifs INT,
FOREIGN KEY (id_tarifs) REFERENCES tarifs (id_tarifs))
engine = INNODB;

CREATE TABLE cinema.seances 
(
id_seances INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
horaire INT,
films VARCHAR(100),
id_cinema INT,
FOREIGN KEY (id_cinema) REFERENCES cinema (id_cinema))
engine = INNODB;

CREATE TABLE cinema.salles 
(
id_salles INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre_places INT,
id_cinema INT,
FOREIGN KEY (id_cinema) REFERENCES cinema (id_cinema))
engine = INNODB;

CREATE TABLE cinema.users 
(
id_users INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nom VARCHAR (45),
prenom VARCHAR(45),
mdp VARCHAR (45),
id_cinema INT,
id_seances INT,
FOREIGN KEY (id_seances) REFERENCES seances (id_seances),
FOREIGN KEY (id_cinemas) REFERENCES cinemas (id_cinemas))
engine = INNODB;

CREATE TABLE cinema.role
(
id_roles INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
type_role VARCAHR (45),
id_users INT,
FOREIGN KEY (id_users) REFERENCES users (id_users),
)

CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL ON `cinema`.* TO 'user'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'complexe1'@'localhost' IDENTIFIED BY 'password';
GRANT CREATE ON cinema.seances to 'complexe1';

CREATE USER 'complexe2'@'localhost' IDENTIFIED BY 'password';
GRANT CREATE ON cinema.seances to 'complexe2';

INSERT INTO seances (id_seances,horaires, films)
 VALUES
 (14.00, 'Harry Potter et la chambre des secrets'),
 (15.00 'Belfast'),
 (19.00 'Fresh'),

 INSERT INTO cinema (id_cinema, adresse, ville,)
 VALUES
 ('cours Emile Zola', 'Lyon'),
 ('cours de la liberté', 'Toulouse'),
 ('rue de la République', 'Bordeaux'),

 INSERT INTO tarifs (id_tarifs, prix, descr)
 VALUES
 ('Plein tarif', 9.20),
 ('Etudiant', 7.60),
 ('Moins de 14 ans', 5.90),

 INSERT INTO salles (id_salles, nombre_places)
 VALUES
 (24),
 (2),
 (12),

 INSERT INTO users (id_users, nom, prenom, type_user,mdp)
 VALUES
('Kew', 'Lu', 'lkew0@phoca.cz', '$2y$10$u9O85sxBB1/ardSzWsNuxOpaKVndwRpG4x8L0ULPaujL5molVvsri'),
('Hain', 'Felice', 'fhain1@studiopress.com', '$2y$10$U8rGkkdH/OKgoe0rKss0ju.r27x7KJ6daFGFIGy1XYYSttM2fGcqi'),
('Openshaw', 'Elden', 'eopenshaw2@mac.com', '$2y$10$rPteQCSXj5Vv0wBVup0J3.vFKzLphBZtCQ8kAfBA2n4S3QDX7EMwi'),

INSERT INTO role (id_role, type_role)
VALUES
('user'),
('complexe1'),
('complexe2'),