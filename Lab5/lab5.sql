--1--
--выбрать двух клиентов
SELECT TOP 2 *
FROM client;

--2--
--выбрать всех реелторов имеющих отзывы
SELECT *
FROM realtor
WHERE references IS NOT NULL;

--выбрать все дома без недостатков
SELECT *
FROM houseroom
WHERE defects IS NULL;

--выбрать все дома стоимотью от 1600000 до 5000000
SELECT *
FROM houseroom
WHERE cost BETWEEN 1600000 AND 5000000;

--выбрать дома с ценой 3000000
SELECT *
FROM houseroom
WHERE cost IN(3000000);

--выбрать дома с 3 комнатами
SELECT *
FROM houseroom
WHERE rooms_amount = 3;

--выбрать не закрытые продажи
SELECT *
FROM houseroom_in_deal
WHERE closed != -1;

--3--
--отсортировать клиентов по ФИО
SELECT *
FROM client
ORDER BY fio ASC;
 
 --отсортировать реелторов по убыванию стоимости услуг
 SELECT *
FROM realtor
ORDER BY cost_of_appeal DESC;

--отсортировать дома по возрастанию цены, и убыванию площади
SELECT *
FROM houseroom
ORDER BY cost ASC, area DESC;

--выбрать поля даты обращения и номера клиента, отсортировав по первому полю
SELECT appeal_date, id_client
FROM appeal_to_realtor
ORDER BY 1 ASC;

--4--
--максимальный рейтинг у реелторов
SELECT Max(rating)
FROM realtor;

--наименьшая цена дома
SELECT Min(cost)
FROM houseroom;

--средняя цена дома с площадью от 100 до 120
SELECT AVG(cost)
FROM houseroom
WHERE area BETWEEN 100 AND 120;

--общая выручка по продаже домов где номер обращения 4  
SELECT SUM(deal_revenue)
FROM houseroom_in_deal
WHERE id_appeal_to_realtor = 4;

--5--
--выбрать все дома что есть в продаже
SELECT DISTINCT(id_houseroom)
FROM houseroom_in_deal;

--количество реелторов из списка обращений к реелтору
SELECT COUNT(DISTINCT (id_realtor))
FROM appeal_to_realtor;

--6--
--максимальная выручка по каждому реелтору
SELECT SUM(deal)
FROM appeal_to_realtor
GROUP BY id_realtor;

--максимальные цены домов, из не закрытых объявлений о продаже
SELECT MAX(deal_revenue)
FROM houseroom_in_deal
WHERE NOT closed = -1
GROUP BY id_houseroom;

--максимальные цены домов, из тех что не меньше 10000000
SELECT MAX(deal_revenue)
FROM houseroom_in_deal
GROUP BY id_houseroom
HAVING MAX(deal_revenue) > 10000000;