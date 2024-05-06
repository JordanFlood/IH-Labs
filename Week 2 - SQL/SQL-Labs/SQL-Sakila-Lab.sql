USE sakila;

SHOW Tables;

SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

-- 3.1 Titles of all films
SELECT title FROM film;

-- 3.2 List of languages used in films, with the column aliased as language
SELECT name AS language FROM language;

-- 3.3 List of first names of all employees
SELECT first_name FROM staff;

SELECT DISTINCT release_year FROM film;

-- 5.1 Number of stores
SELECT COUNT(*) AS store_count FROM store;

-- 5.2 Number of employees
SELECT COUNT(*) AS employee_count FROM staff;

-- 5.3 Number of films available for rent and rented
SELECT 
    COUNT(*) AS total_films,
    SUM(IF(f.rental_duration > 0, 1, 0)) AS films_available_for_rent,
    SUM(IF(f.rental_duration = 0, 1, 0)) AS films_rented
FROM film f;

-- 5.4 Number of distinct last names of actors
SELECT COUNT(DISTINCT last_name) AS distinct_last_names FROM actor;

SELECT * FROM film ORDER BY length DESC LIMIT 10;

-- 7.1 Retrieve all actors with the first name "SCARLETT"
SELECT * FROM actor WHERE first_name = 'SCARLETT';

-- 7.2 Retrieve all movies that have "ARMAGEDDON" in their title and have a duration longer than 100 minutes
SELECT * FROM film WHERE title LIKE '%ARMAGEDDON%' AND length > 100;

-- 7.3 Determine the number of films that include Behind the Scenes content
SELECT COUNT(*) FROM film WHERE special_features LIKE '%Behind the Scenes%';