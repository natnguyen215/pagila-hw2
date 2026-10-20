/*
 * Compute the total revenue for each film.
 * The output should include another new column "total revenue" that shows the sum of all the revenue of all previous films.
 *
 * HINT:
 * My solution starts with the solution to problem 16 as a subquery.
 * Then I combine the SUM function with the OVER keyword to create a window function that computes the total.
 * You might find the following stackoverflow answer useful for figuring out the syntax:
 * <https://stackoverflow.com/a/5700744>.
 */
select rank, title, revenue, SUM(revenue) over 
(    order by revenue desc
) as "total revenue"
from (
    select
  rank() over (order BY coalesce(sum(p.amount), 0.00) DESC ) as rank,
 f.title, coalesce(sum(p.amount), 0.00) as revenue
  from film f
 LEFT JOIN inventory i ON f.film_id = i.film_id
 LEFT JOIN rental r ON i.inventory_id = r.inventory_id
  LEFT JOIN payment p ON r.rental_id = p.rental_id
  group by f.film_id
  order by rank asc, f.title asc
) as t 
order by revenue desc, title asc
