CREATE EXTENSION IF NOT EXISTS pgcrypto;

DROP TABLE IF EXISTS post_tags;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS users;

-- USERS
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL
);

-- POSTS
CREATE TABLE posts(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL REFERENCES users(id),

    title TEXT NOT NULL,

    status TEXT NOT NULL DEFAULT 'draft'
    CHECK (status IN ('draft', 'published')),

    views INTEGER NOT NULL DEFAULT 0
    CHECK (views >= 0)
);

-- COMMENTS
CREATE TABLE comments(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    post_id UUID NOT NULL REFERENCES posts(id),

    body TEXT NOT NULL
);

-- TAGS
CREATE TABLE tags(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    name TEXT NOT NULL UNIQUE
);

-- MANY TO MANY RELATION
CREATE TABLE post_tags(
    post_id UUID NOT NULL REFERENCES posts(id),

    tag_id UUID NOT NULL REFERENCES tags(id),

    PRIMARY KEY (post_id, tag_id)
);

--------------------------------------------------
-- INSERT USERS
--------------------------------------------------

INSERT INTO users(name)
VALUES
('Skyy'),
('Bruce'),
('Tony');

--------------------------------------------------
-- INSERT POSTS
--------------------------------------------------

INSERT INTO posts(user_id, title, status, views)
VALUES
(
    (SELECT id FROM users WHERE name = 'Skyy'),
    'Learning PostgreSQL',
    'published',
    120
),
(
    (SELECT id FROM users WHERE name = 'Bruce'),
    'Batman Database Secrets',
    'draft',
    55
),
(
    (SELECT id FROM users WHERE name = 'Tony'),
    'Ironman Tech Stack',
    'published',
    450
);

--------------------------------------------------
-- INSERT COMMENTS
--------------------------------------------------

INSERT INTO comments(post_id, body)
VALUES
(
    (SELECT id FROM posts WHERE title = 'Learning PostgreSQL'),
    'Amazing tutorial!'
),
(
    (SELECT id FROM posts WHERE title = 'Learning PostgreSQL'),
    'Very helpful content.'
),
(
    (SELECT id FROM posts WHERE title = 'Ironman Tech Stack'),
    'Loved this article.'
);

--------------------------------------------------
-- INSERT TAGS
--------------------------------------------------

INSERT INTO tags(name)
VALUES
('postgresql'),
('backend'),
('tech'),
('database');

--------------------------------------------------
-- INSERT POST_TAGS
--------------------------------------------------

INSERT INTO post_tags(post_id, tag_id)
VALUES
(
    (SELECT id FROM posts WHERE title = 'Learning PostgreSQL'),
    (SELECT id FROM tags WHERE name = 'postgresql')
),
(
    (SELECT id FROM posts WHERE title = 'Learning PostgreSQL'),
    (SELECT id FROM tags WHERE name = 'database')
),
(
    (SELECT id FROM posts WHERE title = 'Ironman Tech Stack'),
    (SELECT id FROM tags WHERE name = 'tech')
),
(
    (SELECT id FROM posts WHERE title = 'Ironman Tech Stack'),
    (SELECT id FROM tags WHERE name = 'backend')
);

SELECT * FROM comments;