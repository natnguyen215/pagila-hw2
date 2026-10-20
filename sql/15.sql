/*
 * Compute the total revenue for each film.
 */
select f.title, coalesce(sum(p.amount), 0.00) as revenue
from film f 
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
LEFT JOIN payment p ON r.rental_id = p.rental_id
group by f.film_id
order by revenue desc, f.title ASC;
