DROP DATABASE IF EXISTS friends_of_human;
-- 7. В подключенном MySQL репозитории создать базу данных “Друзья человека”
-- START
CREATE DATABASE friends_of_human;

USE friends_of_human;
-- 7. В подключенном MySQL репозитории создать базу данных “Друзья человека”
-- DONE

-- 8. Создать таблицы с иерархией из диаграммы в БД
-- START
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
-- 8. Создать таблицы с иерархией из диаграммы в БД
-- DONE

/*
ДОПОЛНИТЕЛЬНО:
ввёл секвенцию и создал триггеры, 
чтобы получить единый счётчик животных (по аналогии с п.15 контрольной)
START
*/
DROP TABLE IF EXISTS sequence;
CREATE TABLE sequence (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL
);

DELIMITER //
CREATE TRIGGER cats_use_id_sequence_BEFORE_INSERT
  BEFORE INSERT ON 
    cats 
  FOR EACH ROW
BEGIN
  INSERT INTO sequence SET id= DEFAULT;
  SET NEW.id = LAST_INSERT_ID();
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER dogs_use_id_sequence_BEFORE_INSERT
  BEFORE INSERT ON 
    dogs
  FOR EACH ROW
BEGIN
  INSERT INTO sequence SET id= DEFAULT;
  SET NEW.id = LAST_INSERT_ID();
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER hamsters_use_id_sequence_BEFORE_INSERT
  BEFORE INSERT ON 
    hamsters
  FOR EACH ROW
BEGIN
  INSERT INTO sequence SET id= DEFAULT;
  SET NEW.id = LAST_INSERT_ID();
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER horses_use_id_sequence_BEFORE_INSERT
  BEFORE INSERT ON 
    horses
  FOR EACH ROW
BEGIN
  INSERT INTO sequence SET id= DEFAULT;
  SET NEW.id = LAST_INSERT_ID();
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER donkeys_use_id_sequence_BEFORE_INSERT
  BEFORE INSERT ON 
    donkeys
  FOR EACH ROW
BEGIN
  INSERT INTO sequence SET id= DEFAULT;
  SET NEW.id = LAST_INSERT_ID();
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER camels_use_id_sequence_BEFORE_INSERT
  BEFORE INSERT ON 
    camels
  FOR EACH ROW
BEGIN
  INSERT INTO sequence SET id= DEFAULT;
  SET NEW.id = LAST_INSERT_ID();
END//
DELIMITER ;
/*
ДОПОЛНИТЕЛЬНО:
ввёл секвенцию и создал триггеры, 
чтобы получить единый счётчик животных (по аналогии с п.15 контрольной)
-- DONE
*/

/*
9. Заполнить низкоуровневые таблицы именами(животных), командами,
которые они выполняют и датами рождения.
-- START
*/
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
/*
9. Заполнить низкоуровневые таблицы именами(животных), командами,
которые они выполняют и датами рождения.
-- DONE
*/

/*
10. Удалив из таблицы верблюдов,
 т.к. верблюдов решили перевезти в другой питомник на зимовку.
Объединить таблицы лошади, и ослы в одну таблицу.
--START
*/
DELETE 
FROM pack_animals pa
WHERE pa.subclass_id = 3;

CREATE TABLE horses_and_donkeys AS (
SELECT * FROM horses UNION ALL
SELECT * FROM donkeys
);
/*
10. Удалив из таблицы верблюдов,
 т.к. верблюдов решили перевезти в другой питомник на зимовку.
Объединить таблицы лошади, и ослы в одну таблицу.
-- DONE
*/

/*
12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на
прошлую принадлежность к старым таблицам
-- START
*/
CREATE TABLE all_the_animals AS (
SELECT * FROM cats UNION ALL
SELECT * FROM dogs UNION ALL
SELECT * FROM hamsters UNION ALL
SELECT * FROM horses_and_donkeys
);
/*
12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на
прошлую принадлежность к старым таблицам
-- DONE (Комментарий: class_id и subclass_id и есть те самые поля, указывающие на
прошлую принадлежность к старым таблицам) 
*/

SELECT * FROM all_the_animals;

/*
11. Создать новую таблицу “молодые животные” в которую попадут все
животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
до месяца подсчитать возраст животных в новой таблице
--START
*/
CREATE TABLE young_animals AS (
SELECT 
*, 
TIMESTAMPDIFF(MONTH,birthday,NOW()) AS age_in_months
FROM
all_the_animals
WHERE 
TIMESTAMPDIFF(MONTH,birthday,NOW()) >= 12 
AND 
TIMESTAMPDIFF(MONTH,birthday,NOW()) <= 36);
/*
11. Создать новую таблицу “молодые животные” в которую попадут все
животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
до месяца подсчитать возраст животных в новой таблице
-- DONE
*/

