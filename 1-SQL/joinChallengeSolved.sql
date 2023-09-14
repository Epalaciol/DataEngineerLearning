-- Join Challenge 1 Question
SELECT email, district 
FROM customer 
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district ILIKE 'California'

-- Join Challenge 2 Question
SELECT title, first_name, last_name FROM film 
INNER JOIN film_actor 
ON film.film_id = film_actor.film_id
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
WHERE first_name = 'Nick' AND last_name ='Wahlberg'