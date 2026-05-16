-- idx helps helps postgres find rows faster

-- SELECT -> speed up this particular process

SELECT 
id,
title,
status,
views,
user_id
FROM posts;

-- /posts?status=published

SELECT 
id,
title,
status
FROM posts
WHERE status = 'published';

-- CREATE AN IDX
-- idx = INDEX, posts = table_name, status = col. name
CREATE INDEX IF NOT EXISTS idx_posts_status
ON posts(status);

SELECT 
title,
status
FROM posts
WHERE status = 'published'
ORDER BY views DESC;

-- composite idx,
CREATE INDEX IF NOT EXISTS idx_posts_status_views
ON posts(status, views DESC);

-- /users/:id/posts
SELECT 
title,
status,
views
FROM posts
WHERE user_id = (
    SELECT id
    FROM users
    WHERE name = 'Skyy'
);

-- FOREIGN KEY 
CREATE INDEX IF NOT EXISTS idx_posts_user_id
ON posts(user_id);
