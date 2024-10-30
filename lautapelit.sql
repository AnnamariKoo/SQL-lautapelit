DROP TABLE IF EXISTS julkaisija CASCADE;
DROP TABLE IF EXISTS lautapeli CASCADE;
DROP TABLE IF EXISTS pelaaja CASCADE;
DROP TABLE IF EXISTS arvostelu CASCADE;

CREATE TABLE julkaisija (
    id BIGINT GENERATED ALWAYS AS IDENTITY,
    nimi VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE lautapeli (
    id BIGINT GENERATED ALWAYS AS IDENTITY,
    lautapeli_nimi VARCHAR(255) NOT NULL,
    min_pelaajamaara INTEGER NULL,
    max_pelaajamaara INTEGER NULL,
    hinta INTEGER NULL,
    julkaisija_id BIGINT NOT NULL REFERENCES julkaisija(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);

CREATE TABLE pelaaja(
    id BIGINT GENERATED ALWAYS AS IDENTITY,
    nimimerkki VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE arvostelu (
    lautapeli_id BIGINT NOT NULL REFERENCES lautapeli(id) ON DELETE CASCADE,
    pelaaja_id BIGINT NOT NULL REFERENCES pelaaja(id) ON DELETE CASCADE,
    pisteet INTEGER NOT NULL CHECK(pisteet BETWEEN 1 AND 10),
    PRIMARY KEY(lautapeli_id, pelaaja_id)
);

INSERT INTO julkaisija (nimi) VALUES ('Tactic');
INSERT INTO julkaisija (nimi) VALUES ('Lautapelit.fi');

INSERT INTO lautapeli (lautapeli_nimi, min_pelaajamaara, max_pelaajamaara, hinta, julkaisija_id) VALUES ('Dominion', 2, 4, 45, 2);
INSERT INTO lautapeli (lautapeli_nimi, min_pelaajamaara, max_pelaajamaara, hinta, julkaisija_id) VALUES ('Carcassonne', 2, 5, 32, 2);
INSERT INTO lautapeli (lautapeli_nimi, min_pelaajamaara, max_pelaajamaara, hinta, julkaisija_id) VALUES ('It s a wonderful world', 1, 5, 45, 2);
INSERT INTO lautapeli (lautapeli_nimi, min_pelaajamaara, max_pelaajamaara, hinta, julkaisija_id) VALUES ('Arnak - Kadonneet rauniot', 1, 4, 55, 2);
INSERT INTO lautapeli (lautapeli_nimi, min_pelaajamaara, hinta, julkaisija_id) VALUES ('Alias', 4, 28, 1);
INSERT INTO lautapeli (lautapeli_nimi, min_pelaajamaara, hinta, julkaisija_id) VALUES ('Yatzy', 2, 4.95, 1);


INSERT INTO pelaaja (nimimerkki) VALUES ('Pertsa');
INSERT INTO pelaaja (nimimerkki) VALUES ('Mirkku89');
INSERT INTO pelaaja (nimimerkki) VALUES ('Axuliina1234');
INSERT INTO pelaaja (nimimerkki) VALUES ('KCMK');

INSERT INTO arvostelu (lautapeli_id, pelaaja_id, pisteet) VALUES (2, 1, 7);
INSERT INTO arvostelu (lautapeli_id, pelaaja_id, pisteet) VALUES (3, 1, 8);
INSERT INTO arvostelu (lautapeli_id, pelaaja_id, pisteet) VALUES (1, 2, 9);
INSERT INTO arvostelu (lautapeli_id, pelaaja_id, pisteet) VALUES (3, 3, 9);
INSERT INTO arvostelu (lautapeli_id, pelaaja_id, pisteet) VALUES (4, 3, 10);
INSERT INTO arvostelu (lautapeli_id, pelaaja_id, pisteet) VALUES (5, 2, 8);
INSERT INTO arvostelu (lautapeli_id, pelaaja_id, pisteet) VALUES (6, 1, 10);

INSERT INTO arvostelu (lautapeli_id, pelaaja_id, pisteet) VALUES (1, 1, 9);
INSERT INTO arvostelu (lautapeli_id, pelaaja_id, pisteet) VALUES (2, 4, 9);


/*KYSELYJÄ*/

SELECT lautapeli_nimi 
FROM lautapeli 
WHERE min_pelaajamaara = 1 and hinta < 50;

SELECT lautapeli.lautapeli_nimi, pelaaja.nimimerkki
FROM arvostelu
JOIN lautapeli ON(arvostelu.lautapeli_id = lautapeli.id)
JOIN pelaaja ON(arvostelu.pelaaja_id = pelaaja.id)
WHERE arvostelu.pisteet = 9;





