-- Quote reference schema for tarifs, clients and sample data
-- Generated/imported from user-provided SQL

-- Clean-up (safe to re-run)
DROP TABLE IF EXISTS devis_calcul_auto;
DROP TABLE IF EXISTS devis_calcul_moto;
DROP TABLE IF EXISTS devis_calcul_habitation;
DROP TABLE IF EXISTS devis_auto;
DROP TABLE IF EXISTS devis_moto;
DROP TABLE IF EXISTS devis_habitation;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS tarif_puissance_auto;
DROP TABLE IF EXISTS tarif_age_conducteur;
DROP TABLE IF EXISTS tarif_kilometrage;
DROP TABLE IF EXISTS tarif_cylindree_moto;
DROP TABLE IF EXISTS tarif_superficie_hab;
DROP TABLE IF EXISTS tarif_valeur_mobilier;

-- Tariff reference tables
CREATE TABLE tarif_puissance_auto (
    cv_fiscaux       INTEGER      NOT NULL PRIMARY KEY,
    coeff_puissance  DECIMAL(4,2) NOT NULL
);

INSERT INTO tarif_puissance_auto (cv_fiscaux, coeff_puissance) VALUES
    (3,  0.90),(4,1.00),(5,1.10),(6,1.20),(7,1.35),(8,1.50),(9,1.65),(10,1.80),(11,2.00),(12,2.20);

CREATE TABLE tarif_age_conducteur (
    age_min          INTEGER      NOT NULL,
    age_max          INTEGER,
    coeff_age        DECIMAL(4,2) NOT NULL,
    PRIMARY KEY (age_min)
);

INSERT INTO tarif_age_conducteur (age_min, age_max, coeff_age) VALUES
    (18, 21,   1.80),(21,25,1.50),(25,30,1.10),(30,40,1.00),(40,55,1.00),(55,65,1.05),(65,75,1.15),(75,NULL,1.35);

CREATE TABLE tarif_kilometrage (
    id               SERIAL PRIMARY KEY,
    libelle          VARCHAR(30)  NOT NULL,
    km_max           INTEGER      NOT NULL,
    coeff_km         DECIMAL(4,2) NOT NULL
);

INSERT INTO tarif_kilometrage (libelle, km_max, coeff_km) VALUES
    ('< 8 000',8000,0.85),('8 001–12 000',12000,0.95),('12 001–15 000',15000,1.00),('15 001–20 000',20000,1.10),('20 001–25 000',25000,1.20),('> 25 000',999999,1.35);

CREATE TABLE tarif_cylindree_moto (
    id               SERIAL PRIMARY KEY,
    libelle          VARCHAR(20)  NOT NULL,
    cc_max           INTEGER      NOT NULL,
    coeff_cylindree  DECIMAL(4,2) NOT NULL
);

INSERT INTO tarif_cylindree_moto (libelle, cc_max, coeff_cylindree) VALUES
    ('50',50,0.70),('125',125,0.85),('250',250,1.00),('500',500,1.25),('750',750,1.50),('1000',1000,1.75),('> 1000',9999,2.00);

CREATE TABLE tarif_superficie_hab (
    id               SERIAL PRIMARY KEY,
    libelle          VARCHAR(20)  NOT NULL,
    surface_max      INTEGER      NOT NULL,
    prime_base_eur   DECIMAL(8,2) NOT NULL
);

INSERT INTO tarif_superficie_hab (libelle, surface_max, prime_base_eur) VALUES
    ('≤ 30',30,80.00),('31–50',50,110.00),('51–70',70,140.00),('71–90',90,170.00),('91–110',110,200.00),('111–130',130,235.00),('131–150',150,270.00),('> 150',9999,320.00);

CREATE TABLE tarif_valeur_mobilier (
    id               SERIAL PRIMARY KEY,
    libelle          VARCHAR(20)  NOT NULL,
    valeur_max       INTEGER      NOT NULL,
    coeff_mobilier   DECIMAL(4,2) NOT NULL
);

INSERT INTO tarif_valeur_mobilier (libelle, valeur_max, coeff_mobilier) VALUES
    ('< 20 000',20000,0.90),('20–30 000',30000,1.00),('30–50 000',50000,1.15),('50–70 000',70000,1.30),('70–100 000',100000,1.50),('> 100 000',9999999,1.75);

-- Clients
CREATE TABLE clients (
    id               SERIAL PRIMARY KEY,
    nom_prenom       VARCHAR(120),
    date_creation    DATE         NOT NULL DEFAULT CURRENT_DATE,
    email            VARCHAR(120),
    telephone        VARCHAR(20)
);

INSERT INTO clients (nom_prenom, email) VALUES
    ('Jean Dupont','jean.dupont@email.com'),('Marie Martin','marie.martin@email.com');

-- Keep the other quote tables available but optional for later migration
