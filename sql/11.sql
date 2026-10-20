/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
select  distinct a.first_name || ' ' || a.last_name as "Actor Name" 
from actor a 
join film_actor fa using (actor_id) 
join film f using (film_id)
where 'Behind the Scenes' = ANY(f.special_features)
order by "Actor Name" aSC;
