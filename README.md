# Lab-BD1
## Описание
Спроектированная база данных с помощью программы pgAdmin4 Предприятий Омска, в которых содержится информация о руководителях предприятий, о поставке и заказе товаров, какие и с кем были заключены контракты.
---
## 1. Определение сущностей и атрибутов
### Сущность: Предприятие (Company)

  *	ID_предприятия (уникальный идентификатор)
  *	ID_руководителя (уникальный идентификатор)
  *	Дата основания
  *	Описание товара
  *	Количество участников
  *	Название
  *	
<img width="1019" height="164" alt="image" src="https://github.com/user-attachments/assets/41670734-2a8e-4d6d-93c2-2df81a79901e" />
Рис. 1 Company

### Сущность: Руководитель (Director)

  *	ID_руководителя (уникальный идентификатор)
  *	ФИО (Фамилия Имя Отчество)
  *	Дата рождения

 <img width="727" height="316" alt="image" src="https://github.com/user-attachments/assets/9706406c-15b9-454e-8b6e-86699a574da5" />
 
 Рис. 2. Directors

### Сущность: Товар (released product)

  *	ID_товара (уникальный идентификатор)
  *	Название
  *	Цена
  *	Производящее предприятие

<img width="708" height="289" alt="image" src="https://github.com/user-attachments/assets/660ca373-ec92-4a02-b2b8-de437e86f6c1" />
 
Рис. 3 Released product

### Сущность: Контракт (Contacts)
  *	ID_контракта (уникальный идентификатор)
  *	ID_предприятия-клиента (внешний ключ)
  *	ID_товара (уникальный идентификатор)
  *	Количество товара
  *	Дата заключения
    
 <img width="858" height="486" alt="image" src="https://github.com/user-attachments/assets/07e1e3ed-1f36-4362-b990-99ad8131baaa" />

Рис. 4 Contacts

### Сущность: Кредит (Credits)
  *	ID_руководителя (уникальный идентификатор)
  *	Сумма займа

<img width="425" height="306" alt="image" src="https://github.com/user-attachments/assets/7862273f-a8cc-4fa8-95ab-b1b80efd05da" />
 
Рис. 5 Credits
---
## 2. Связи между сущностями
  *	Предприятие ↔ Руководитель: Один к одному (один руководитель управляет одним предприятием).
  *	Предприятие ↔ Поставка: Один ко многим (одно предприятие может получать множество поставок).
  *	Предприятие ↔ Контракт: Один ко многим (одно предприятие может заключать множество контрактов). 
---
## 3. Структура базы данных (ER-диаграмма)

<img width="566" height="544" alt="image" src="https://github.com/user-attachments/assets/6e94a257-8f57-4dee-aa1d-3f56c1b79e09" />

Рис. 6. ER-диаграмма
---
## 4. Создание структуры базы данных (SQL)
```sql
CREATE TABLE public."Company" (
    id_company bigint NOT NULL,
    "id_Directors" bigint NOT NULL,
    "date of foundation" date,
    "type of activity" character varying,
    "count employees" bigint,
    "company name" character varying
);

CREATE TABLE public."Contracts" (
    id bigint NOT NULL,
    id_client bigint,
    id_product bigint,
    "purchased products" bigint,
    date date
);

CREATE TABLE public."Credits" (
    "id_Directors" bigint NOT NULL,
    "credit amount" bigint
);


CREATE TABLE public."Directors" (
    id bigint NOT NULL,
    "Full name" character varying,
    "date of birth" date
);

CREATE TABLE public."released product" (
    id bigint NOT NULL,
    name character varying,
    cost bigint,
    id_company bigint
);


COPY public."Company" (id_company, "id_Directors", "date of foundation", "type of activity", "count employees", "company name") FROM stdin;
1	1	2006-06-14	Производство красок, эмалей и чернил для промышленного и полиграфического использования	130	Омский Красочный Завод
2	2	2002-05-30	Производство строительных материалов и керамической продукции	220	Завод Керамических Блоков
3	3	2003-09-12	Производство и продажа мебели	200	Комфорт
4	4	1999-08-14	Cтроительство, поставка строительных материалов	500	Стройинвест
5	5	1998-03-20	Производство бумажной продукции	300	СибБумага
6	6	1965-05-18	Типографское производство, полиграфия	300	ДомПечати
\.


COPY public."Contracts" (id, id_client, id_product, "purchased products", date) FROM stdin;
2	1	201	2400	2004-04-22
3	1	301	100	2000-02-23
4	2	101	350	2004-04-05
6	2	501	10000	2006-02-12
7	2	601	2000	2007-12-12
8	3	401	5000	2005-05-25
9	4	201	10000	2004-04-05
5	2	401	1000	2004-04-05
1	1	601	3500	2004-04-15
10	4	501	2000	2004-04-05
\.


COPY public."Credits" ("id_Directors", "credit amount") FROM stdin;
1	1450000
2	900000
3	1430000
4	859000
5	1123000
6	1900000
\.


COPY public."Directors" (id, "Full name", "date of birth") FROM stdin;
1	Дмитрий Викторович Селезнев	1981-03-29
2	Павел Андреевич Сидоров	1978-08-21
3	Сергей Александрович Климов	1980-04-25
4	Николай Васильевич Соколов	1971-02-10
5	Андрей Петрович Власов	1974-07-15
6	Виктор Иванович Михайлов	1969-11-02
\.

COPY public."released product" (id, name, cost, id_company) FROM stdin;
101	Краски	150	1
201	Кирпич	10	2
301	Шкаф	8000	3
401	Металлочерепица	3000	4
501	Бумага	100	5
601	Книги	300	6
\.


ALTER TABLE ONLY public."Company"
    ADD CONSTRAINT company_pkey PRIMARY KEY (id_company);


ALTER TABLE ONLY public."released product"
    ADD CONSTRAINT "released product_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."Directors"
    ADD CONSTRAINT "Директора_pkey" PRIMARY KEY (id);



ALTER TABLE ONLY public."Credits"
    ADD CONSTRAINT "Кредиты_pkey" PRIMARY KEY ("id_Directors");



ALTER TABLE ONLY public."Contracts"
    ADD CONSTRAINT "контракты_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY public."Company"
    ADD CONSTRAINT "id_Directors" FOREIGN KEY ("id_Directors") REFERENCES public."Directors"(id) NOT VALID;


ALTER TABLE ONLY public."released product"
    ADD CONSTRAINT id_company FOREIGN KEY (id_company) REFERENCES public."Company"(id_company);

ALTER TABLE ONLY public."Credits"
    ADD CONSTRAINT "id_директора" FOREIGN KEY ("id_Directors") REFERENCES public."Directors"(id) NOT VALID;

ALTER TABLE ONLY public."Contracts"
    ADD CONSTRAINT "id_заказчика_предприятия" FOREIGN KEY (id_client) REFERENCES public."Company"(id_company) NOT VALID;


ALTER TABLE ONLY public."Contracts"
    ADD CONSTRAINT "id_товара" FOREIGN KEY (id_product) REFERENCES public."released product"(id) NOT VALID;

ALTER TABLE ONLY public."Contracts"
    ADD CONSTRAINT "id_товара_выпущенныйтовар" FOREIGN KEY (id_product) REFERENCES public."released product"(id) NOT VALID;

REVOKE ALL ON TABLE public."Credits" FROM postgres;
GRANT ALL ON TABLE public."Credits" TO PUBLIC;
```
---
## 5. Вывод
  *	Спроектированная база данных удовлетворяет требованиям задачи.
  *	Она обеспечивает хранение и обработку данных о руководителях, поставках, заказах, товарах, контрактах и их участниках.
  *	Реализованные связи обеспечивают целостность и логическую связанность данных.
---
## Доп. Задания
## Создайте SQL-операторы, выполняющие указанные ниже действия к базам данных
•	Найти директора предприятия по фамилии Иванов и увеличить его кредит на 100000 руб.

•	Определить разнообразие товара, выпускаемого омскими предприятиями.

•	Для предприятия "Стройинвест" определить количество
купленного товара.

•	Определить предприятия Омска, покупающие товар с
кодом 9874...778.

•	Получить сведения о товарах купленных предприятиями
в апреле 2004 года.

•	Удалить данные о предприятии  "Комфорт" и товарах,
которые оно выпускало.
---
### Выполненная работа
<img width="974" height="275" alt="image" src="https://github.com/user-attachments/assets/5f0fb87e-b521-4d49-b3ae-524bd14af725" />
Рис. 7 Найти директора предприятия по фамилии Иванов и увеличить его кредит на 100000 руб.

<img width="878" height="256" alt="image" src="https://github.com/user-attachments/assets/c352335b-5048-4254-a0ab-0cec749549b6" />

Рис. 8 Разнообразие товара, выпускаемого омскими предприятиями.

 <img width="872" height="316" alt="image" src="https://github.com/user-attachments/assets/85b6d8ae-4be8-496f-97a0-19620efdbace" />

Рис. 9 Определение кол-ва купленного товара для предприятия "Стройинвест".

<img width="909" height="339" alt="image" src="https://github.com/user-attachments/assets/8139ab06-80a5-4e43-b62b-f691f85d3fea" />
 
Рис. 10 Поиск предприятий Омска, покупающих товар с кодом 9874...778

 <img width="809" height="374" alt="image" src="https://github.com/user-attachments/assets/ea13e8eb-226f-4a1f-aac5-cd2714f4953e" />

Рис. 11 Получение сведений о товарах, купленных предприятиями в апреле 2004 года

 <img width="974" height="209" alt="image" src="https://github.com/user-attachments/assets/d1bc5e18-87c5-43c6-a31b-32f7d7ecacc7" />

Рис. 12 Удаление данных о предприятии "Комфорт" и товарах,
которые оно выпускало.

 <img width="974" height="314" alt="image" src="https://github.com/user-attachments/assets/7b7734fb-a405-40ec-b190-4327f17f946f" />

Рис. 13 Удаляем запись о компании “Комфорт”
---
## Создание процедур, выполняющих указанные ниже действия к базе данных
1. Процедура автоматического формирования отчетов о поставках товаров за
определенный период времени.
2. Процедура автоматического расчета стоимости заказа на основе количества и
цены товаров, а также учета налогов и скидок.
```sql
CREATE OR REPLACE PROCEDURE generate_supply_report(
    IN start_date DATE,
    IN end_date DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Формирование отчета о поставках за определённый период
    RAISE NOTICE 'Отчет о поставках с % по %:', start_date, end_date;

    RETURN QUERY
    SELECT contracts.id AS contract_id, 
           company."company name" AS buyer, 
           "released product".name AS product, 
           contracts."purchased products" AS quantity,
           "released product".cost AS unit_price,
           contracts.date AS contract_date
    FROM public."Contracts" AS contracts
    JOIN public."Company" AS company ON contracts.id_client = company.id_company
    JOIN public."released product" ON contracts.id_product = "released product".id
    WHERE contracts.date BETWEEN start_date AND end_date
    ORDER BY contracts.date;
END;
$$;


CREATE OR REPLACE PROCEDURE calculate_order_cost(
    IN product_id BIGINT,
    IN quantity BIGINT,
    IN tax_rate DECIMAL,       -- Процент налога,
    IN discount_rate DECIMAL,  -- Процент скидки,
    OUT total_cost DECIMAL
)
LANGUAGE plpgsql
AS $$
DECLARE
    unit_price DECIMAL;
BEGIN
    -- Получаем цену за единицу товара
    SELECT cost INTO unit_price 
    FROM public."released product"
    WHERE id = product_id;

    -- Проверка, была ли найдена цена
    IF unit_price IS NULL THEN
        RAISE EXCEPTION 'Товар с id % не найден', product_id;
    END IF;

    -- Рассчитываем общую стоимость без учёта налогов и скидок
    total_cost := unit_price * quantity;

    -- Применяем скидку и налог
    total_cost := total_cost * (1 - discount_rate / 100) * (1 + tax_rate / 100);
END;
$$;
```
<img width="974" height="709" alt="image" src="https://github.com/user-attachments/assets/3cbf89d8-dc13-4393-81f2-74d94737e0fb" />
<img width="974" height="324" alt="image" src="https://github.com/user-attachments/assets/24a32485-1308-4b9a-b17b-6fd6ee132d5d" />

Рис. 14-15 Процедура автоматического создания отчетов о клиентах, основанных на их
истории покупок

<img width="974" height="902" alt="image" src="https://github.com/user-attachments/assets/0b662aa5-839c-449f-917d-c00bce4e6f9b" />

Рис. 16 Процедура автоматического расчета скидок на товары на основе объема
заказа или истории покупок клиента

