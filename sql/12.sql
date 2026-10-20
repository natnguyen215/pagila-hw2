/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

select x.title from (select distinct f.title, f.film_id from film f
    where 'Behind the Scenes' = ANY(f.special_features)) x 
join (select distinct f.title, f.film_id from film f
     where 'Trailers' = ANY(f.special_features)) y on x.film_id = y.film_id 
order by x.title ASC;
