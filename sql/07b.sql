/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */
select distinct f.title 
from film f 
JOIN inventory i ON f.film_id = i.film_id
left join (
    select distinct i.film_id
    from inventory i
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN customer c ON r.customer_id = c.customer_id
    JOIN address a ON c.address_id = a.address_id
    JOIN city ci ON a.city_id = ci.city_id
    JOIN country co ON ci.country_id = co.country_id
    where co.country = 'United States'
) us on f.film_id = us.film_id
where us.film_id is null 
order by f.title asc;

