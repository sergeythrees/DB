--INSERT--
INSERT INTO dish
VALUES (2, 'Соус Напалм', 'Соус', 'Горячее', 'Густое');

INSERT INTO product_in_dish 
( id_product_in_dish, id_dish, id_product, weight )
VALUES (1, 2, 14, 2);

INSERT INTO product_in_receipe ( id_product, id_receipe )
SELECT id_product, id_receipe
FROM product, receipe
WHERE caloricity < 100 AND id_receipe = 7;

--DELETE--
DELETE *
FROM dish_copy;

DELETE *
FROM product_copy
WHERE caloricity > 200;

TRUNCATE TABLE product;

--UPDATE--
UPDATE product_copy 
SET cost = cost -10;

UPDATE product_copy 
SET cost = cost /2 
WHERE expiration_date < 200;

UPDATE product_in_dish 
SET weight = weight * 2
WHERE id_dish = 5;

--SELECT--
SELECT dish.name, dish.Категория
FROM dish;

SELECT *
FROM dish;

SELECT name, caloricity, cost
FROM product
WHERE caloricity > 100;