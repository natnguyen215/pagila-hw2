/*
 * Compute the total revenue for each film.
 * The output should include another new column "revenue percent" that shows the percent of total revenue that comes from the current film and all previous films.
 * That is, the "revenue percent" column is 100*"total revenue"/sum(revenue)
 *
 * HINT:
 * The `to_char` function can be used to achieve the correct formatting of your percentage.
 * See: <https://www.postgresql.org/docs/current/functions-formatting.html#FUNCTIONS-FORMATTING-EXAMPLES-TABLE>
 */
select rank, title, revenue, SUM(revenue) over
(    order by revenue desc
) as "total revenue",
to_char(
100.0 * sum(revenue) over (order BY revenue desc) / sum(revenue) over (), 'FM900.00') as "percent revenue"
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
order by revenue desc, title asc;
