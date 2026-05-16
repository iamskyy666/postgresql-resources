-- 1 post can have multiple tags
-- 1 tag can belong to multiple posts

-- posts.id = post_tags.post_id
-- tags.id = post_tags.tag_id

-- FIND EVERY POST WITH IT'S TAG --

SELECT * FROM posts;
SELECT * FROM tags;

SELECT 
    posts.id AS post_title,
    tags.name AS tag_name
FROM posts
INNER JOIN post_tags
ON posts.id=post_tags.post_id
INNER JOIN tags
ON post_tags.tag_id = tags.id
ORDER BY posts.title, tags.name;