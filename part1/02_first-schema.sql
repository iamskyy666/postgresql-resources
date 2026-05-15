-- db -> schema -> table -> rows

CREATE schema IF NOT EXISTS basics;

CREATE EXTENSION IF NOT EXISTS pgcrypto;

--- query (can also be run on psql)
SELECT schema_name
FROM information_schema.schemata
ORDER BY schema_name;
