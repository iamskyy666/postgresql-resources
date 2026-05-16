-- ALIASES - makes queries shorter and easier to read

-- posts.title = p.title
-- users.name = u.name

-- SELECT * FROM posts;
 
 -- ALIASES - makes queries shorter and easier to read

SELECT 
    p.title AS post_title,
    p.status AS post_status,
    p.views AS post_views,

    u.name AS author_name,

    c.body AS comment_body

FROM posts AS p

INNER JOIN users AS u
ON p.user_id = u.id

LEFT JOIN comments AS c
ON p.id = c.post_id

ORDER BY p.views DESC;