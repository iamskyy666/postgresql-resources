-- calculate 1 result from many rows
-- COUNT() - no. of rows.
-- SUM() - total val.
-- AVG() - average val.
-- MIN() - smallest/min val.
-- MAX() - largest/max val.

-- Ex. - admin dashboard, reports, analytics, admin panels.

SELECT 
COUNT(*) AS total_posts, -- count all the rows from the posts table.
COUNT(*) FILTER (WHERE status = 'published') AS published_posts, -- FILTER
COUNT(*) FILTER (WHERE status = 'draft') AS drafted_posts, -- FILTER
SUM(views) AS total_views,
AVG(views) AS avg_views,
MIN(views) AS lowest_views,
MAX(views) AS highest_views
FROM posts;

