-- DROP DATABASE friends_of_human;

CREATE DATABASE friends_of_human;

USE friends_of_human;

DROP TABLE IF EXISTS animals;
CREATE TABLE animals 
(
class_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
class_name VARCHAR(50) NOT NULL,
PRIMARY KEY (class_id)
);

INSERT INTO 
animals (class_name)
VALUES
("pack_animals"), ("pets");

DROP TABLE IF EXISTS pets;
CREATE TABLE pets 
(
    class_id INT UNSIGNED DEFAULT 1,
    subclass_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    subclass_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (subclass_id),
    FOREIGN KEY (class_id) REFERENCES animals(class_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO
pets (subclass_name)
VALUES 
("cats"),
("dogs"),
("hamsters");

DROP TABLE IF EXISTS pack_animals;
CREATE TABLE pack_animals 
(
    class_id INT UNSIGNED DEFAULT 2,
    subclass_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    subclass_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (subclass_id),
    FOREIGN KEY (class_id) REFERENCES animals(class_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO
pack_animals (subclass_name)
VALUES 
("horses"),
("donkeys"),
("camels");

DROP TABLE IF EXISTS cats;
CREATE TABLE cats
(
    id INT UNSIGNED NOT NULL DEFAULT 0,
    class_id INT UNSIGNED NOT NULL DEFAULT 1, 
    subclass_id INT UNSIGNED NOT NULL DEFAULT 1,
	name VARCHAR(50) NOT NULL,
	birthday DATE NOT NULL,
	skills VARCHAR(200) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (class_id) REFERENCES animals(class_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (subclass_id) REFERENCES pets(subclass_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS dogs;
CREATE TABLE dogs
(
    id INT UNSIGNED NOT NULL DEFAULT 0,
    class_id INT UNSIGNED NOT NULL DEFAULT 1, 
    subclass_id INT UNSIGNED NOT NULL DEFAULT 2,
	name VARCHAR(50) NOT NULL,
	birthday DATE NOT NULL,
	skills VARCHAR(200) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (class_id) REFERENCES animals(class_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (subclass_id) REFERENCES pets(subclass_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS hamsters;
CREATE TABLE hamsters
(
    id INT UNSIGNED NOT NULL DEFAULT 0,
    class_id INT UNSIGNED NOT NULL DEFAULT 1, 
    subclass_id INT UNSIGNED NOT NULL DEFAULT 3,
	name VARCHAR(50) NOT NULL,
	birthday DATE NOT NULL,
	skills VARCHAR(200) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (class_id) REFERENCES animals(class_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (subclass_id) REFERENCES pets(subclass_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS horses;
CREATE TABLE horses
(
    id INT UNSIGNED NOT NULL DEFAULT 0,
    class_id INT UNSIGNED NOT NULL DEFAULT 2, 
    subclass_id INT UNSIGNED NOT NULL DEFAULT 1, 
	name VARCHAR(50) NOT NULL,
	birthday DATE NOT NULL,
	skills VARCHAR(200) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (class_id) REFERENCES animals(class_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (subclass_id) REFERENCES pack_animals(subclass_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS donkeys;
CREATE TABLE donkeys
(
    id INT UNSIGNED NOT NULL DEFAULT 0,
    class_id INT UNSIGNED NOT NULL DEFAULT 2, 
    subclass_id INT UNSIGNED NOT NULL DEFAULT 2, 
	name VARCHAR(50) NOT NULL,
	birthday DATE NOT NULL,
	skills VARCHAR(200) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (class_id) REFERENCES animals(class_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (subclass_id) REFERENCES pack_animals(subclass_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS camels;
CREATE TABLE camels
(
    id INT UNSIGNED NOT NULL DEFAULT 0,
    class_id INT UNSIGNED NOT NULL DEFAULT 2, 
    subclass_id INT UNSIGNED NOT NULL DEFAULT 3, 
	name VARCHAR(50) NOT NULL,
	birthday DATE NOT NULL,
	skills VARCHAR(200) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (class_id) REFERENCES animals(class_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (subclass_id) REFERENCES pack_animals(subclass_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS sequence;
CREATE TABLE sequence (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

DELIMITER //
CREATE TRIGGER cats_BEFORE_INSERT
  BEFORE INSERT ON 
    cats
  FOR EACH ROW
BEGIN
  INSERT INTO sequence SET id= DEFAULT;
  SET NEW.id = LAST_INSERT_ID();
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER dogs_BEFORE_INSERT
  BEFORE INSERT ON 
    dogs
  FOR EACH ROW
BEGIN
  INSERT INTO sequence SET id= DEFAULT;
  SET NEW.id = LAST_INSERT_ID();
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER hamsters_BEFORE_INSERT
  BEFORE INSERT ON 
    hamsters
  FOR EACH ROW
BEGIN
  INSERT INTO sequence SET id= DEFAULT;
  SET NEW.id = LAST_INSERT_ID();
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER horses_BEFORE_INSERT
  BEFORE INSERT ON 
    horses
  FOR EACH ROW
BEGIN
  INSERT INTO sequence SET id= DEFAULT;
  SET NEW.id = LAST_INSERT_ID();
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER donkeys_BEFORE_INSERT
  BEFORE INSERT ON 
    donkeys
  FOR EACH ROW
BEGIN
  INSERT INTO sequence SET id= DEFAULT;
  SET NEW.id = LAST_INSERT_ID();
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER camels_BEFORE_INSERT
  BEFORE INSERT ON 
    camels
  FOR EACH ROW
BEGIN
  INSERT INTO sequence SET id= DEFAULT;
  SET NEW.id = LAST_INSERT_ID();
END//
DELIMITER ;

INSERT INTO
cats (name, birthday, skills)
VALUES
("Tom","2020-02-28","meow, jump"),
("Boris","2021-03-21","meow, scratch");

INSERT INTO
camels (name, birthday, skills)
VALUES
("Jafar","2018-01-25","carry load, run");

INSERT INTO
dogs (name, birthday, skills)
VALUES
("Rex","2020-02-28","bark"),
("Kashtanka","2021-03-21","bark, stay");

INSERT INTO
hamsters (name, birthday, skills)
VALUES
("Zhorik","2023-02-28","roll, spin"),
("Khoma","2023-03-21","roll, hide");

INSERT INTO
horses (name, birthday, skills)
VALUES
("Lukas","2018-02-28","gallop"),
("Matilda","2019-03-21","gallop");

INSERT INTO
donkeys (name, birthday, skills)
VALUES
("Dull","2018-02-28","carry load"),
("Clever","2019-03-21","carry load, bray");

INSERT INTO
camels (name, birthday, skills)
VALUES
("Abdul","2019-04-27","carry load, sit");

SELECT * FROM animals;
SELECT * FROM pets;
SELECT * FROM pack_animals;

SELECT * FROM cats UNION ALL
SELECT * FROM dogs UNION ALL
SELECT * FROM hamsters UNION ALL
SELECT * FROM horses UNION ALL
SELECT * FROM donkeys UNION ALL
SELECT * FROM camels;




