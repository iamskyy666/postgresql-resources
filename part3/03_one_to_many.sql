-- one parent row can have multiple child-rows.
-- Ex. 1 user can have/write many posts, but every post belongs to only 1 user.

-- users - parent table
-- posts - child table

-- posts.user_id - user.id


---- 💡 SHOW ALL POSTS WITH THEIR AUTHORS ----
-- SELECT * FROM users;
-- SELECT * FROM posts;

SELECT 
    users.name AS author_name,
    posts.title AS post_title,
    posts.status
FROM users
INNER JOIN posts
ON users.id = posts.user_id
ORDER BY users.name, posts.title;
