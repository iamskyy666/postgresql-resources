-- left join keeps all the rows from the LFET table
-- if the right table has matching data, pstgreSQL includes that
-- if not, NULL is returned

-- posts - left table
-- comments - right table

-- not every post is gonna have comments
-- some might have 100, some might not gave any
-- SELECT * FROM posts;
-- SELECT * FROM comments;

SELECT 
    posts.title AS post_title,
    comments.body AS comment_body
FROM posts
LEFT JOIN comments
ON posts.id = comments.post_id
ORDER BY posts.title;

