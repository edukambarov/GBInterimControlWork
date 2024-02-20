# Краткий отчёт о выполненной работе.


## Задания 1-5

1. Используя команду cat в терминале операционной системы Linux, создать
   
два файла Домашние животные (заполнив файл собаками, кошками, хомяками) 

и Вьючные животными заполнив файл Лошадьми, верблюдами и ослами),
 
а затем объединить их. Просмотреть содержимое созданного файла.

Переименовать файл, дав ему новое имя (Друзья человека).
  

2. Создать директорию, переместить файл туда.
   
   
3. Подключить дополнительный репозиторий MySQL.
   
Установить любой пакет из этого репозитория. 

  
4. Установить и удалить deb-пакет с помощью dpkg.
   

5. Выложить историю команд в терминале ubuntu.


## Решение:

На снимках экрана ниже продемонстрировано решение задач из пп.1-4.

![Это принскрин 2](https://github.com/edukambarov/GBInterimControlWork/blob/main/LinuxPart/p2.jpg).

![Это принскрин 1](https://github.com/edukambarov/GBInterimControlWork/blob/main/LinuxPart/p1.jpg).

Список команд в терминале ubuntu:

```
  1  cat > pets.txt

  2  cat > pack_animals.txt

  3  cat pets.txt pack_animals.txt > friends_of_human.txt

  4  cat friends_of_human.txt

  5  mkdir friends_of_human

  6  mv friend_of_human.txt friends_of_human

  7  cd friends_of_human/

  8  ll

  9  cat friends_of_human.txt 

  10  cd /home/kea78/

  11  sudo apt update

  12  sudo apt install mysql-server-8.0

  13  sudo mysql

  14  wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j_8.3.0-1ubuntu22.04_all.deb

  15  sudo dpkg -i mysql-connector-j_8.3.0-1ubuntu22.04_all.deb

  16  sudo dpkg -r mysql-connector-j_8.3.0-1ubuntu22.04_all.deb

  17  history

```


## Задание 6


6. Нарисовать диаграмму, в которой есть класс родительский класс,

домашние животные и вьючные животные, 

в составы которых в случае домашних  животных войдут классы: собаки, кошки, хомяки,

а в класс вьючные животные войдут: Лошади, верблюды и ослы.


## Решение:

Созданная диаграмма сделана под решение задач, поставленных в пп. 13-15.

![Это диаграмма](https://github.com/edukambarov/GBInterimControlWork/blob/main/diagramPetsAndPackAnimals.png).



## Задания 7 - 9

7. В подключенном MySQL репозитории создать базу данных “Друзья человека”
   
   
8. Создать таблицы с иерархией из диаграммы в БД
   

9.  Заполнить низкоуровневые таблицы именами(животных), командами,
 
которые они выполняют и датами рождения.


## Решение:


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


## Задания 10 - 12

10. Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку.

Объединить таблицы лошади, и ослы в одну таблицу.


11.Создать новую таблицу “молодые животные” в которую попадут все

животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью

до месяца подсчитать возраст животных в новой таблице


12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на
    
прошлую принадлежность к старым таблицам


## Решение:




## Задание 13

13.Создать класс с Инкапсуляцией методов и наследованием по диаграмме.


## Решение:

См. папку Classes, содержащую все указанные в диаграмме классы  и методы.

На уровне рольдительского класса Animals были созданы:

- конструкторы (с указанием умений/skills и без);
  
- переопределён toString для удобства пользователя;

- задан в дальнейшем переопределяемый для классов, соответствующих конкретным животным. метод learnCommand.


## Задание 14

14. Написать программу, имитирующую работу реестра домашних животных.

В программе должен быть реализован следующий функционал:

14.1 Завести новое животное

14.2 определять животное в правильный класс

14.3 увидеть список команд, которое выполняет животное

14.4 обучить животное новым командам

14.5 Реализовать навигацию по меню

    
## Решение:

см. файл Menu, где реализовано меню (14.5) с опциями, перечисленными в пп.14.1 - 14.4.


## Задание 15

15. Создайте класс Счетчик, у которого есть метод add(), увеличивающий̆ значение  внутренней̆ int переменной̆ на 1 

при нажатие “Завести новое животное”.

Сделайте так, чтобы с объектом такого типа можно было работать в блоке try-with-resources.

Нужно бросить исключение, если работа с объектом типа счетчик была не в ресурсном try и/или ресурс остался открыт.

Значение считать в ресурсе try, если при заведения животного заполнены все поля.


## Решение:

Класс Счётчик(Counter) добавлен внутрь класса Animal.

При вызове конструктора экземпляра класса Animal вызывается конструктор класса Counter.

Обработка ввода пользовательских данных проходит при помощи Scanner.next() для строк и scanner.nextInt() для числовых значений.

При вводе некорректных данных scanner.nextInt() выбрасывает исключение InputMismatchException, которое с помощтю конструкции

try-catch обрабатывается так: пользователь видит корректное сообщение об ошибке, программа с ним прощается и прекращает работу.

При этом Scanner не даёт оставить пустое поле ввода, поэтому минимально требуемые данные (Имя, год, месяц и дата рождения)

будут заполнены, без этого не запустится создание экземпляра класса выбранного животного.

При этом дата также проверяется на здравый смысл, т.е. нельзя указать, например, 13-й месяц, 30-е февраля или 2025 год.

Такого рода ошибки не приводят к исключению, просто прерывается ввод и пользователя возвращает на выбор создаваемого животного.



