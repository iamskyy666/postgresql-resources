This is our first real relational database query.

We are now using:

* foreign keys
* table relationships
* joins

These are core SQL concepts.

---

# First Understand the Relationship

We already created:

```txt id="ap9k6x"
users
posts
```

with:

```sql id="72m17y"
posts.user_id REFERENCES users(id)
```

Meaning:

| Table   | Role         |
| ------- | ------------ |
| `users` | parent table |
| `posts` | child table  |

---

# Why Parent / Child?

Because:

## One User

can create:

```txt id="zpcxvu"
many posts
```

But:

## One Post

belongs to:

```txt id="u6a3rq"
only one user
```

This is called:

# One-to-Many Relationship

---

# Visual Representation

```txt id="aq5cl0"
users
--------------------------------
id          | name
--------------------------------
1           | Skyy
2           | Bruce


posts
-----------------------------------------------
id     | title            | user_id
-----------------------------------------------
101    | Learning SQL     | 1
102    | PostgreSQL Tips  | 1
103    | Batman Secrets   | 2
```

Notice:

```txt id="jlwm52"
posts.user_id
```

points to:

```txt id="jlwm53"
users.id
```

That link is the relationship.

---

# Your Query

```sql id="jlwm54"
SELECT 
    users.name AS author_name,
    posts.title AS post_title,
    posts.status
FROM users
INNER JOIN posts
ON users.id = posts.user_id
ORDER BY users.name, posts.title;
```

Now let’s break EVERYTHING down.

---

# 1. `SELECT`

```sql id="jlwm55"
SELECT
```

Means:

> retrieve data

---

# 2. Selected Columns

```sql id="jlwm56"
users.name AS author_name,
posts.title AS post_title,
posts.status
```

You are choosing:

* author's name
* post title
* post status

---

# `users.name`

Means:

```txt id="jlwm57"
column name
from table users
```

---

# Why Prefix With Table Name?

Because joins often create ambiguity.

Example:

Both tables might contain:

```txt id="jlwm58"
id
created_at
name
```

So SQL needs clarification.

---

# This:

```sql id="jlwm59"
users.name
```

means:

> use `name` column from `users`

---

# 3. `AS`

```sql id="jlwm60"
AS author_name
```

Creates alias.

---

# Why Use Alias?

Without alias:

| name |
| ---- |

Not descriptive enough.

With alias:

| author_name |
| ----------- |

Much cleaner.

---

# Same Here

```sql id="jlwm61"
posts.title AS post_title
```

Result column becomes:

| post_title |
| ---------- |

instead of generic:

| title |
| ----- |

---

# 4. `FROM users`

```sql id="jlwm62"
FROM users
```

Starting table.

Think of it as:

> Begin with `users`

---

# 5. `INNER JOIN`

This is the BIG concept.

```sql id="jlwm63"
INNER JOIN posts
```

Means:

> combine rows from `users` and `posts`

based on matching condition.

---

# What is a JOIN?

A JOIN merges related data from multiple tables.

Without joins:

* relational databases become useless

Joins are one of the most important SQL concepts.

---

# Why We Need JOIN

Because data is normalized.

Instead of:

```txt id="jlwm64"
posts
-----------------------------------------
title | author_name
```

we store:

```txt id="jlwm65"
user_id
```

This:

* reduces duplication
* maintains consistency
* improves structure

Then JOIN reconstructs related data.

---

# 6. `ON`

```sql id="’wini66"
ON users.id = posts.user_id
```

This is the matching condition.

---

# Meaning

```txt id="jlwm67"
Find rows where:

users.id == posts.user_id
```

---

# Example

Suppose:

---

# users

| id | name  |
| -- | ----- |
| 1  | Skyy  |
| 2  | Bruce |

---

# posts

| title    | user_id |
| -------- | ------- |
| SQL Tips | 1       |
| Batman   | 2       |

---

# Matching Process

SQL checks:

```txt id="jlwm68"
users.id == posts.user_id
```

---

# Match 1

```txt id="’wini69"
1 == 1
```

TRUE

Result:

| name | title    |
| ---- | -------- |
| Skyy | SQL Tips |

---

# Match 2

```txt id="’wini70"
2 == 2
```

TRUE

Result:

| Bruce | Batman |

---

# Final Joined Result

| author_name | post_title |
| ----------- | ---------- |
| Skyy        | SQL Tips   |
| Bruce       | Batman     |

---

# What INNER JOIN Means

Only return rows with successful matches.

---

# If User Has No Posts?

That user gets excluded.

---

# If Post Has Invalid user_id?

That row gets excluded.

---

# INNER JOIN = Intersection

Think:

```txt id="’wini71"
ONLY matching records
```

---

# 7. `ORDER BY`

```sql id="’wini72"
ORDER BY users.name, posts.title;
```

Sorts results.

---

# Sort Priority

SQL sorts:

1. by user name
2. then by post title

---

# Example

Before sorting:

| author | title  |
| ------ | ------ |
| Skyy   | Z Post |
| Bruce  | Batman |
| Skyy   | A Post |

---

# After sorting

| author | title  |
| ------ | ------ |
| Bruce  | Batman |
| Skyy   | A Post |
| Skyy   | Z Post |

---

# Ascending Is Default

Equivalent to:

```sql id="’wini73"
ORDER BY users.name ASC, posts.title ASC
```

---

# High-Level Meaning of Entire Query

```sql id="’wini74"
SELECT 
    users.name AS author_name,
    posts.title AS post_title,
    posts.status
FROM users
INNER JOIN posts
ON users.id = posts.user_id
ORDER BY users.name, posts.title;
```

means:

> Show all posts together with their authors by matching users.id with posts.user_id, then sort results alphabetically.

---

# Real Backend Equivalent

This kind of query powers:

* blog feeds
* ecommerce orders
* comments with users
* social media posts
* dashboards

Example API response:

```json id="’wini75"
[
  {
    "author_name":"Skyy",
    "post_title":"Learning PostgreSQL",
    "status":"published"
  }
]
```

---

# Important Concept You Just Learned

This is called:

# Relational Querying

Because:

* tables are related
* foreign keys connect data
* joins reconstruct relationships

This is the heart of SQL databases.

---

# Most Common SQL Joins

| Join         | Meaning                  |
| ------------ | ------------------------ |
| `INNER JOIN` | only matches             |
| `LEFT JOIN`  | all left rows + matches  |
| `RIGHT JOIN` | all right rows + matches |
| `FULL JOIN`  | everything               |

`INNER JOIN` is the most commonly used join in backend development.
