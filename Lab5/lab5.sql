--1--
SELECT TOP 2 *
FROM client;

--2--
SELECT *
FROM client
WHERE references IS NOT NULL;

SELECT *
FROM houseroom
WHERE defects IS NULL;

SELECT *
FROM houseroom
WHERE cost BETWEEN 1600000 AND 5000000;

SELECT *
FROM houseroom
WHERE cost IN(3000000);

SELECT *
FROM houseroom
WHERE rooms_amount = 3;

SELECT *
FROM houseroom_in_deal
WHERE closed != -1;

--3--
SELECT *
FROM client
ORDER BY fio ASC;
 
 SELECT *
FROM realtor
ORDER BY cost_of_appeal DESC;

SELECT *
FROM houseroom
ORDER BY cost ASC, area DESC;

SELECT appeal_date, id_client
FROM appeal_to_realtor
ORDER BY 1 ASC;

--4--
SELECT Max(rating)
FROM realtor;

SELECT Min(cost)
FROM houseroom;

SELECT AVG(cost)
FROM houseroom
WHERE area BETWEEN 100 AND 120;

SELECT SUM(deal_revenue)
FROM houseroom_in_deal
WHERE id_appeal_to_realtor = 4;

--5--
SELECT DISTINCT(id_houseroom)
FROM houseroom_in_deal;

SELECT COUNT(DISTINCT (id_realtor))
FROM appeal_to_realtor;

--6--
SELECT SUM(deal)
FROM appeal_to_realtor
GROUP BY id_realtor;

SELECT MAX(deal_revenue)
FROM houseroom_in_deal
WHERE NOT closed = -1
GROUP BY id_houseroom;

SELECT MAX(deal_revenue)
FROM houseroom_in_deal
GROUP BY id_houseroom
HAVING MAX(deal_revenue) > 10000000;