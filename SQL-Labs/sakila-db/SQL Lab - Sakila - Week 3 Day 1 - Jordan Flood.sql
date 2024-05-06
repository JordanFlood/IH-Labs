USE sakila;

---------------------------------------------------------------------------------------------------------------------------

# 1. Number of copies of the film "Hunchback Impossible"


SELECT COUNT(*) AS number_of_copies
FROM inventory i
JOIN film f ON i.film_id = f.film_id
WHERE f.title = 'Hunchback Impossible';

---------------------------------------------------------------------------------------------------------------------------

# 2. Films longer than the average length of all films

SELECT title, length
FROM film
WHERE length > (SELECT AVG(length) FROM film);

---------------------------------------------------------------------------------------------------------------------------

# 3. Actors in the film "Alone Trip"

SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Alone Trip';

---------------------------------------------------------------------------------------------------------------------------

# 4. Movies categorized as family films

SELECT f.title
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Family';

---------------------------------------------------------------------------------------------------------------------------

# 5. Customers from Canada (using subqueries and joins)

SELECT cu.first_name, cu.last_name, cu.email
FROM customer cu
JOIN address a ON cu.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN country co ON c.country_id = co.country_id
WHERE co.country = 'Canada';

---------------------------------------------------------------------------------------------------------------------------

#6. Films starred by the most prolific actor

SELECT f.title
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
WHERE fa.actor_id = (
    SELECT actor_id
    FROM (
        SELECT actor_id, COUNT(*) AS film_count
        FROM film_actor
        GROUP BY actor_id
        ORDER BY film_count DESC
        LIMIT 1
    ) AS subquery
);

---------------------------------------------------------------------------------------------------------------------------

# 7. Films rented by the most profitable customer

SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
JOIN customer cu ON p.customer_id = cu.customer_id
WHERE cu.customer_id = (
    SELECT customer_id
    FROM (
        SELECT customer_id, SUM(amount) AS total_payment
        FROM payment
        GROUP BY customer_id
        ORDER BY total_payment DESC
        LIMIT 1
    ) AS subquery
);

---------------------------------------------------------------------------------------------------------------------------

# 8. Clients who spent more than the average total amount

SELECT cu.customer_id, SUM(p.amount) AS total_amount_spent
FROM customer cu
JOIN payment p ON cu.customer_id = p.customer_id
GROUP BY cu.customer_id
HAVING SUM(p.amount) > (
    SELECT AVG(total_amount)
    FROM (
        SELECT customer_id, SUM(amount) AS total_amount
        FROM payment
        GROUP BY customer_id
    ) AS subquery
);

# End of Lab

---------------------------------------------------------------------------------------------------------------------------



