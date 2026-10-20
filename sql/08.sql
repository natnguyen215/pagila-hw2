/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */
select title 
from film f 
where rating = 'G'
and 'Trailers' in (
    select unnest(f.special_features
    ))
order by title asc
