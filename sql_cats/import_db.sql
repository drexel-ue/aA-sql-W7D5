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
    cat_id INTEGER NOT NULL,
    toy_id INTEGER NOT NULL,

    FOREIGN KEY (cat_id) REFERENCES cats(id),
    FOREIGN KEY (toy_id) REFERENCES toys(id)

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