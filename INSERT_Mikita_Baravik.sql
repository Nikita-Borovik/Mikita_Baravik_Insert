-- Step 1: Insert the new film into the film table
INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features)
VALUES ('Inception', 'A mind-bending thriller where dream invasion is possible.', 2010, 1, 14, 4.99, 148, 19.99, 'PG-13', 'Trailers,Commentaries');

-- Step 2: Insert leading actors into the actor table
INSERT INTO actor (first_name, last_name)
VALUES ('Leonardo', 'DiCaprio'),
       ('Joseph', 'Gordon-Levitt'),
       ('Ellen', 'Page');

-- Step 3: Associate the actors with the film in the film_actor table
-- Assuming film_id for "Inception" is 1001 and actor_ids are 201, 202, 203
INSERT INTO film_actor (actor_id, film_id)
VALUES ((SELECT actor_id FROM actor WHERE first_name = 'Leonardo' AND last_name = 'DiCaprio'), 
        (SELECT film_id FROM film WHERE title = 'Inception')),
       ((SELECT actor_id FROM actor WHERE first_name = 'Joseph' AND last_name = 'Gordon-Levitt'), 
        (SELECT film_id FROM film WHERE title = 'Inception')),
       ((SELECT actor_id FROM actor WHERE first_name = 'Ellen' AND last_name = 'Page'), 
        (SELECT film_id FROM film WHERE title = 'Inception'));

-- Step 4: Add the film to the store's inventory
-- Assuming store_id is 1 and film_id for "Inception" is 1001
INSERT INTO inventory (film_id, store_id)
VALUES ((SELECT film_id FROM film WHERE title = 'Inception'), 1);
