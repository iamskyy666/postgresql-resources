-- group by creates groups of rows
-- WHERE - filters normal-rows before grouping
-- HAVING filters groups after grouping

-- FIND AUTHORS WITH AT LEAST 2 POSTS

SELECT
u.name as author_name,
COUNT(p.id) AS total_posts,
SUM(p.views) AS total_views
FROM users AS u
LEFT JOIN posts as p
 ON u.id=p.user_id
 GROUP BY u.id,u.name
 HAVING COUNT(p.id) >= 2
 ORDER BY total_posts DESC;
 

