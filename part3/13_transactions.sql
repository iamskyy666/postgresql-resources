-- run multiple sql-statements as one safe unit.


-- EX:
-- placing an order
-- reduce stock of that product
-- creatimg payment records
-- transferring money
-- creating user-records with related profile-data

BEGIN;

UPDATE posts
SET status = 'published'
WHERE title = 'Idxs for Beginners'
AND status = 'draft';

UPDATE posts
SET views = views + 50
WHERE title = 'Idxs for Beginners';

SELECT 
title,
status,
views
FROM posts
WHERE title = 'Idxs for Beginners';

COMMIT; -- permanently save
