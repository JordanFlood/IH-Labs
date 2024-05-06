USE sakila;


------------------------------------------------------------------------------------------------------------------------------------------

## 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT c.name AS Category, COUNT(fc.film_id) AS Film_Count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY Film_Count DESC;

------------------------------------------------------------------------------------------------------------------------------------------

## 2. Display the total amount rung up by each staff member in August of 2005.

SELECT * FROM staff; -- To see how many staff members there are. There's 2

SELECT s.staff_id, CONCAT(s.first_name, ' ', s.last_name) AS Staff_Name, SUM(p.amount) AS Total_Amount
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
WHERE MONTH(p.payment_date) = 8 AND YEAR(p.payment_date) = 2005
GROUP BY s.staff_id
ORDER BY Total_Amount DESC;

-- Jon Stephens = 12216.49
-- Mike Hillyer = 11853.65

------------------------------------------------------------------------------------------------------------------------------------------

## 3. Which actor has appeared in the most films?

SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS Actor_Name, COUNT(fa.film_id) AS Film_Count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY Film_Count DESC
LIMIT 1;

SELECT concat(a.first_name, ' ', a.last_name) AS actor_name , COUNT(*) AS appearance
FROM sakila.actor a
JOIN sakila.film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY actor_name
ORDER BY appearance DESC
LIMIT 1;

-- Gina Degeneres

------------------------------------------------------------------------------------------------------------------------------------------

## 4. Most active customer (the customer that has rented the most number of films)

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS Customer_Name, COUNT(r.rental_id) AS Rental_Count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY Rental_Count DESC
LIMIT 1;

-- Eleanor Hunt = 46 Rentals

------------------------------------------------------------------------------------------------------------------------------------------

## 5. Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, a.address
FROM staff s
JOIN address a ON s.address_id = a.address_id;

------------------------------------------------------------------------------------------------------------------------------------------

## 6. List each film and the number of actors who are listed for that film.

SELECT f.title, COUNT(fa.actor_id) AS Actor_Count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.title
ORDER BY Actor_Count DESC;

------------------------------------------------------------------------------------------------------------------------------------------

## 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS Customer_Name, SUM(p.amount) AS Total_Paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name, c.first_name;

------------------------------------------------------------------------------------------------------------------------------------------

## 8. List the titles of films per category.

SELECT cat.name AS Category, f.title AS Film
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
ORDER BY cat.name, f.title;

# End of Lab
------------------------------------------------------------------------------------------------------------------------------------------

