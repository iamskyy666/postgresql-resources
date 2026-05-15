-- null - unknown/missing val.
-- empty str - known string val but it contains no chars.
-- zero - actual numeric val of 0

DROP TABLE IF EXISTS basics.value_examples;
CREATE TABLE basics.value_examples(
    id SERIAL PRIMARY KEY,
    nickname TEXT,
    bio TEXT,
    score INTEGER
);

INSERT INTO basics.value_examples(nickname, bio, score)
VALUES
(null,'learning posgreSQL',10),
('','empty nickname',20),
('soumadip','',0),
('john',null,null);

SELECT * FROM basics.value_examples;

-- null nickname
SELECT * FROM basics.value_examples
WHERE nickname IS NULL;

-- empty nickname
SELECT * FROM basics.value_examples
WHERE nickname = '';

-- score zero
SELECT * FROM basics.value_examples WHERE score = 0;

-- nickname != null
SELECT * FROM basics.value_examples
WHERE nickname IS NOT NULL;

-- 01:08:30
