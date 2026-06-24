CREATE TABLE категория_материала (
    id_категории SERIAL PRIMARY KEY,
    наименование VARCHAR(100) NOT NULL,
    единица_измерения VARCHAR(20) NOT NULL
);

CREATE TABLE материал (
    id_материала SERIAL PRIMARY KEY,
    id_категории INT NOT NULL REFERENCES категория_материала(id_категории),
    наименование VARCHAR(200) NOT NULL
);

CREATE TABLE поставщик (
    id_поставщика SERIAL PRIMARY KEY,
    наименование VARCHAR(200) NOT NULL,
    контактное_лицо VARCHAR(100),
    email VARCHAR(100),
    инн VARCHAR(12)
);

CREATE TABLE загрузка (
    id_загрузки SERIAL PRIMARY KEY,
    id_поставщика INT NOT NULL REFERENCES поставщик(id_поставщика),
    id_материала INT NOT NULL REFERENCES материал(id_материала),
    дата_загрузки DATE NOT NULL
);

CREATE TABLE цена (
    id_цены SERIAL PRIMARY KEY,
    id_материала INT NOT NULL REFERENCES материал(id_материала),
    цена NUMERIC(12,2) NOT NULL,
    валюта VARCHAR(10) NOT NULL,
    дата DATE NOT NULL
);

INSERT INTO категория_материала (наименование, единица_измерения) VALUES
    ('Кабели и провода', 'м'),
    ('Трубы', 'м'),
    ('Крепёж', 'шт'),
    ('Изоляционные материалы', 'м²'),
    ('Электрооборудование', 'шт');

INSERT INTO материал (id_категории, наименование) VALUES
    (1, 'Кабель ВВГ 2х1.5'),
    (1, 'Кабель ВВГ 3х2.5'),
    (1, 'Провод ПВС 2х0.75'),
    (2, 'Труба ПВХ d20'),
    (2, 'Труба гофрированная d25'),
    (3, 'Дюбель-гвоздь 6х40'),
    (3, 'Саморез 3.5х25'),
    (4, 'Лента изоляционная ПВХ'),
    (5, 'Автомат 1P 16А'),
    (5, 'Розетка двойная');

INSERT INTO поставщик (наименование, контактное_лицо, email, инн) VALUES
    ('ООО Электроснаб', 'Иванов Иван Иванович', 'ivanov@electrosnab.ru', '7701234567'),
    ('АО СтройМатериалы', 'Петрова Анна Сергеевна', 'petrova@stroymat.ru', '7709876543'),
    ('ИП Сидоров', 'Сидоров Пётр Алексеевич', 'sidorov@mail.ru', '771234567890');