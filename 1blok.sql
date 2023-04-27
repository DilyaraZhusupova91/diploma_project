# 1a. Выбрать все столбцы из таблицы actor (ограничить по 100 строкам).

USE sakila;
SELECT * FROM  actor;

# 1b. Выбрать только last_name из таблицы actor.

SELECT last_name 
FROM  actor;

# 1c. Выбрать только следующие столбцы из таблицы film:
#
# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# rental_duration       Exists in film table.
# rental_rate           Exists in film table.
# total_rental_cost     rental_duration * rental_rate (нужно перемножить два столбца, чтобы получить необходимый)

SELECT title 
FROM film;
SELECT description  
FROM film;
SELECT rental_duration  
FROM film;
SELECT rental_rate 
FROM film;
SELECT rental_duration * rental_rate AS total_rental_cost
FROM film;

# ---------------------------------------------------------#

# 2a. Выбрать различные/уникальные фамилии из таблицы actor.

SELECT DISTINCT last_name 
FROM actor;

# 2b. Выбрать различные/уникальные почтовые коды из таблицы address.

SELECT DISTINCT postal_code 
FROM address;

# 2c. Выбрать различные/уникальные рейтинги из таблицы film.

SELECT DISTINCT rating 
FROM film;
# ---------------------------------------------------------#

# 3a. Выбрать столбцы title, description, rating, length из таблицы film, которые длятся более 3 часа или более.

SELECT title, description, rating 
FROM film 
WHERE length >=180;

# 3b. Выбрать столбцы payment_id, amount, payment_date из таблицы payment, где платежи были сделаны 05/27/2005 или позднее.
#SELECT payment_date FROM payment;

SELECT payment_id, amount, payment_date 
FROM payment
WHERE payment_date >= '2005-05-27'
ORDER BY payment_date;

# 3c. Выбрать все столбцы из таблицы customer, где фамилии начинаются на S и имена заканчиваются на N.

SELECT * FROM customer 
WHERE last_name LIKE 'S%' AND  first_name LIKE '%N'; 

# 3d. Выбрать все столбцы из таблицы customer, где клиент является неактивным или его фамилия начинается на M.

SELECT * FROM customer
WHERE active = 0 OR last_name LIKE 'M%';

# 3e. Выбрать все столбцы из таблицы category, где первичный ключ больше 4 и столбец name начинается на C, S или T.

SELECT * FROM category
WHERE category_id > 4 AND 
name LIKE 'C%' OR name LIKE 'S%' OR name LIKE 'T%';

# 3f. Выбрать все столбцы за исключением столбца password из таблицы staff, где имеется значение password.

# ---------------------------------------------------------#
SELECT staff_id, first_name, last_name, 
address_id, picture, email, store_id,
active, username, last_update 
FROM staff;

# 4a. Выбрать столбцы phone, district из таблицы address, которые находятся в California, England, Taipei, или West Java.

SELECT phone, district 
FROM address
WHERE district = 'California' OR district = 'England' 
OR district = 'Taipei' OR district = 'West Java';
 
# 4b. Выбрать столбцы payment_id, amount, и payment_date из таблицы payment, где платежи были выполнены 05/25/2005, 05/27/2005, 05/29/2005.

SELECT payment_id, amount, payment_date 
FROM payment
WHERE DATE(payment_date) = '2005-05-25' AND  '2005-05-27'AND '2005-05-29';

# 4c. Выбрать все столбцы из таблицы film, где рейтинг фильма является G, PG-13 или NC-17.

SELECT * FROM film
WHERE rating = 'G' OR rating= 'PG-13' OR rating = 'NC-17';

# ---------------------------------------------------------#

# 5a. Выбрать все столбцы из таблицы payment, где платежи были выполнены между 05/25/2005 и 05/26/2005.

SELECT * FROM payment
WHERE payment_date BETWEEN '2005-05-25' AND '2005-05-26';

# 5b. Выбрать только следующие столбцы из таблицы film, для фильмов у которых длина description между 100 и 120:
#
# COLUMN NAME           Note
# title                 Exists in film table.
# description           Exists in film table.
# release_year          Exists in film table.
# total_rental_cost     rental_duration * rental_rate (нужно перемножить два столбца, чтобы получить необходимый)

# ---------------------------------------------------------#
SELECT title, description, release_year, 
rental_duration * rental_rate AS total_rental_cost
FROM film
WHERE length(description) BETWEEN 100 AND 120;

# 6a. Выбрать только следующие столбцы из таблицы film, где description начинается на "A Thoughtful":
# Title, Description, Release 

SELECT title, description, release_year
FROM film
WHERE description LIKE 'A Thoughtful%';

# 6b. Выбрать только следующие столбцы из таблицы film, где description заканчивается на слово "Boat".
# Title, Description, Rental Duration

SELECT title, description,rental_duration 
FROM film
WHERE description LIKE '%Boat';

# 6c. Выбрать только следующие столбцы из таблицы film, где description содержит слово "Database" и длина фильма больше 3-х часов.
# Title, Length, Description, Rental Rate

# ---------------------------------------------------------#
SELECT title, length, description, rental_rate 
FROM film
WHERE description LIKE '%Database%'
AND length > '180';

# 7a. Выбрать все столбцы из таблицы film и упорядочить строки относительно столбца length по возрастанию.

SELECT * FROM film
ORDER BY length ASC;

# 7b. Выбрать различные (уникальные) рейтинги из таблицы film, отсортированный по столбцу rating по убыванию.

SELECT DISTINCT rating 
FROM film
ORDER BY rating DESC;

# 7c. Выбрать столбцы payment_date, amount из таблицы payment (первые 20 строк) отсортированные по столбцу amount по убыванию.

# ---------------------------------------------------------#
SELECT payment_date, amount 
FROM payment
ORDER BY amount DESC
LIMIT 20;

# 8a. Выбрать столбцы customer first_name/last_name и actor first_name/last_name используя /left join/ 
# между таблицами customer и actor (ON имена и фамилии соответсвенных таблиц) 
# Переименуйте столбцы customer first_name/last_name как customer_first_name/customer_last_name
# Переименуйте столбцы actor first_name/last_name в том же стиле как сверху
# Должно быть 599 строк

SELECT DISTINCT c.first_name AS customer_first_name, 
	a.first_name AS actor_first_name,
    c.last_name AS customer_last_name,
    act.last_name AS actor_last_name
FROM customer c
LEFT JOIN actor a
ON c.first_name = a.first_name
LEFT JOIN actor act
ON c.last_name=act.last_name; 

# 8b. Выполните тоже самое что и в 8а, только используйте /right join/ и посмотрите на разницу
# Должно быть 200 строк

SELECT c.first_name AS customer_first_name, 
	a.first_name AS actor_first_name,
    c.last_name AS customer_last_name,
    act.last_name AS actor_last_name
FROM customer c
RIGHT JOIN actor a
ON c.first_name = a.first_name
RIGHT JOIN actor act
ON c.last_name=act.last_name;
 
# 8c. Выбрать те же столбцы что и в 8а, только используйте /inner join/ через фамилию (без имени)
# Должно быть 43 строки

SELECT c.last_name,a.last_name
FROM customer c
INNER JOIN actor a
ON c.last_name=a.last_name;

# 8d. Выбрать столбцы city, country из таблицы city, используя left join с таблицей country.
# Должно быть 600 строк

SELECT ci.city, ci.country_id
FROM city ci
LEFT JOIN country co
ON ci.country_id=co.country_id;

# 8e. Выбрать столбцы title, description, release_year, и language_name из таблицы film, используя left join с таблицей language.
# Должно быть 1000 строк

SELECT f.title, f.description, f.release_year, f.language_id
FROM film f
LEFT JOIN language l
ON f.language_id= l.language_id;

# 8f. Выбрать столбцы first_name, last_name, address, address2, city name, district, и postal code из таблицы staff, используя 2 left join с таблицей address, а потом также с таблицей city.
# Должно быть 2 строки

SELECT s.first_name, s.last_name, a.address, a.address2, c.city, district, postal_code 
FROM staff s
LEFT JOIN address a
ON s.address_id=a.address_id
LEFT JOIN city c	
ON a.city_id=c.city_id;

