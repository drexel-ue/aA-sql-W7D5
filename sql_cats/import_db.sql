-- PHASE 1 ---

DROP TABLE IF EXISTS cattoys;
DROP TABLE IF EXISTS cats;
DROP TABLE IF EXISTS toys;

CREATE TABLE cats
(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    breed VARCHAR(255) NOT NULL
);

CREATE TABLE toys
(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    price float NOT NULL,
    color VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE cattoys
(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    cat_id INTEGER,
    toy_id INTEGER,

    FOREIGN KEY (cat_id) REFERENCES cats(id) ON DELETE CASCADE,
    FOREIGN KEY (toy_id) REFERENCES toys(id) ON DELETE CASCADE

);

insert into cats
    (name, color, breed)
values
    ('Kudu, greater', 'Indigo', 'Tragelaphus strepsiceros');
insert into cats
    (name, color, breed)
values
    ('Native cat', 'Orange', 'Dasyurus viverrinus');
insert into cats
    (name, color, breed)
values
    ('Cattle egret', 'Khaki', 'Bubulcus ibis');
insert into cats
    (name, color, breed)
values
    ('Little heron', 'Khaki', 'Butorides striatus');
insert into cats
    (name, color, breed)
values
    ('Bent-toed gecko', 'Khaki', 'Cyrtodactylus louisiadensis');

insert into toys
    (price, color, name)
values
    ('643.07', 'Goldenrod', 'NeutrapHorus Rex');
insert into toys
    (price, color, name)
values
    ('884.01', 'Red', 'Verapamil Hydrochloride');
insert into toys
    (price, color, name)
values
    ('733.65', 'Mauv', 'CVS Moisturizing Lubricating Eye Twin Pack');
insert into toys
    (price, color, name)
values
    ('995.39', 'Violet', 'Cetirizine Hydrochloride');
insert into toys
    (price, color, name)
values
    ('311.46', 'Crimson', 'Risperidone');

INSERT INTO cattoys
    (cat_id, toy_id)
VALUES
    (1, 5);
INSERT INTO cattoys
    (cat_id, toy_id)
VALUES
    (2, 3);
INSERT INTO cattoys
    (cat_id, toy_id)
VALUES
    (3, 4);
INSERT INTO cattoys
    (cat_id, toy_id)
VALUES
    (4, 2);
INSERT INTO cattoys
    (cat_id, toy_id)
VALUES
    (5, 1);


--- PHASE 1a ---

-- update color of one cat
-- 3 4 5
UPDATE cats
SET color = 'Blurple'
WHERE id = 4;

UPDATE cats
SET name = 'Sigfried Tomilson'
WHERE id = 4;

UPDATE cattoys
SET cat_id = 4
WHERE toy_id = 3;

-- INSERT INTO cattoys
--     (cat_id, toy_id)
-- VALUES
--     (4, 3);

UPDATE toys
SET color = 'Sarcoline'
WHERE id = 1;

SELECT *
FROM cats
    FULL JOIN cattoys ON cats.id = cattoys.cat_id
    FULL JOIN toys ON toys.id = cattoys.toy_id;

DELETE FROM toys
WHERE id = 4;

SELECT *
FROM cats
    FULL JOIN cattoys ON cats.id = cattoys.cat_id
    FULL JOIN toys ON toys.id = cattoys.toy_id;


-- Phase 2: Measuring Performance ---

-- Find all the cats with a particular name

EXPLAIN
SELECT *
FROM cats
WHERE name = 'Sigfriend Tomilson';

-- Find all the toys that belong to a particular cat

EXPLAIN
SELECT toys.name
FROM cats
    FULL JOIN cattoys ON cats.id = cattoys.cat_id
    FULL JOIN toys ON toys.id = cattoys.toy_id
WHERE cats.name = 'Sigfriend Tomilson';


-- Find all the toys and cats the are a particular color

EXPLAIN
SELECT cats.name, toys.name
FROM cats
    FULL JOIN cattoys ON cats.id = cattoys.cat_id
    FULL JOIN toys ON toys.id = cattoys.toy_id
WHERE cats.color = 'Blue' AND toys.color = 'Blue';

-- Find all the toys that belong to a particular breed of cat

EXPLAIN
SELECT toys.name
FROM cats
    FULL JOIN cattoys ON cats.id = cattoys.cat_id
    FULL JOIN toys ON toys.id = cattoys.toy_id
WHERE cats.breed = 'Butorides striatus';

-- updating a cat

EXPLAIN
UPDATE cats
SET breed = 'APEX PREDATOR'
WHERE color = 'Orange';

-- deleting a toy
EXPLAIN
DELETE FROM toys
WHERE id = 4;
-- inserting into the cattoys table.

EXPLAIN
INSERT INTO cattoys
    (cat_id, toy_id)
VALUES
    (5, 1);


-- Building Bigger Tables ---



