-- nested queries.
-- 1 qry inside another qry.
-- runs the inner qry first, then, outer qry.

-- WHICH POSTS ARE PERFORMING BETTER THAN AVG. --

-- OUTER 🔵
SELECT
 title,
 status,
 views
 FROM posts
 WHERE views > (
    -- INNER 🟡
    SELECT AVG(views)
    FROM posts
 )
 ORDER BY views DESC;