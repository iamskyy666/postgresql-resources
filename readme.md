# SQL vs NoSQL Databases — In Depth

Databases are systems used to **store, organize, retrieve, and manage data**.

The two major categories are:

1. **SQL Databases (Relational Databases)**
2. **NoSQL Databases (Non-Relational Databases)**

---

# 1. SQL Databases (Relational Databases)

SQL databases store data in **tables** with:

* Rows
* Columns
* Relationships

Example:

## Users Table

| id | name | email                                   |
| -- | ---- | --------------------------------------- |
| 1  | Skyy | [skyy@gmail.com](mailto:skyy@gmail.com) |

## Orders Table

| id | user_id | product |
| -- | ------- | ------- |
| 1  | 1       | Laptop  |

Here:

* `user_id` links the `orders` table with the `users` table.
* This relationship is the core idea behind relational databases.

---

# SQL = Structured Query Language

SQL is the language used to interact with relational databases.

Example:

```sql
SELECT * FROM users;
```

---

# Popular SQL Databases

* PostgreSQL
* MySQL
* SQLite
* Microsoft SQL Server
* Oracle Database

---

# Core Features of SQL Databases

---

## A) Structured Schema

SQL databases require a **fixed schema**.

You define:

* table names
* column names
* data types
* constraints

Example:

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER
);
```

This means:

* `name` must exist
* `age` must be integer
* structure is predefined

---

## B) Relationships

SQL databases are designed for relationships.

Example:

* users
* orders
* payments
* products

can all be connected using:

* foreign keys
* joins

Example:

```sql
SELECT users.name, orders.product
FROM users
JOIN orders
ON users.id = orders.user_id;
```

---

## C) ACID Transactions

SQL databases strongly support:

# ACID

Meaning:

| Letter | Meaning     |
| ------ | ----------- |
| A      | Atomicity   |
| C      | Consistency |
| I      | Isolation   |
| D      | Durability  |

---

## Atomicity

Either everything succeeds or nothing succeeds.

Example:

Bank transfer:

```text
- Deduct ₹1000 from A
- Add ₹1000 to B
```

If one fails, both rollback.

---

## Consistency

Database rules remain valid.

---

## Isolation

Multiple transactions don't corrupt each other.

---

## Durability

Once committed, data survives crashes.

---

# SQL databases are excellent for:

* banking
* finance
* accounting
* ERP systems
* ecommerce orders
* inventory systems

where correctness matters more than flexibility.

---

# Advantages of SQL Databases

## 1. Strong consistency

Very reliable.

---

## 2. Powerful querying

Complex queries are easy.

Example:

```sql
GROUP BY
JOIN
HAVING
SUBQUERIES
WINDOW FUNCTIONS
CTEs
```

SQL is extremely powerful for analytics.

---

## 3. Relationships are natural

Perfect for interconnected data.

---

## 4. Mature ecosystem

SQL databases are decades old and battle-tested.

Especially:

* PostgreSQL
* MySQL

---

# Disadvantages of SQL Databases

---

## 1. Rigid schema

Changing structure later can be harder.

Example:

Adding/removing columns in massive production systems.

---

## 2. Horizontal scaling is harder

Scaling across many servers is more difficult.

Traditionally SQL prefers:

```text
Vertical Scaling
↑
More RAM
More CPU
Better machine
```

instead of:

```text
Horizontal Scaling
↑
More servers
```

Though modern SQL systems improved a lot here.

---

## 3. Less flexible for rapidly changing data

Not ideal when data structure changes frequently.

---

---

# 2. NoSQL Databases

NoSQL means:

# "Not Only SQL"

It does NOT mean:

```text
"No SQL"
```

Many NoSQL databases still support query languages.

---

# Main Idea

NoSQL databases prioritize:

* flexibility
* scalability
* speed
* distributed systems

over strict relational structure.

---

# Types of NoSQL Databases

There are 4 major categories.

---

# A) Document Databases

Store data as:

* JSON
* BSON
* documents

Example document:

```json
{
  "name": "Skyy",
  "age": 29,
  "skills": ["React", "Go", "Node.js"]
}
```

Popular examples:

* MongoDB
* CouchDB

---

# B) Key-Value Databases

Store:

```text
key → value
```

Example:

```text
"user:1" → "{name:'Skyy'}"
```

Very fast.

Popular examples:

* Redis
* DynamoDB

---

# C) Column-Family Databases

Optimized for huge distributed data.

Examples:

* Apache Cassandra
* HBase

Used in:

* big data
* analytics
* distributed systems

---

# D) Graph Databases

Designed for relationship-heavy graph data.

Examples:

* social networks
* recommendation engines
* fraud detection

Popular examples:

* Neo4j

---

# Core Features of NoSQL Databases

---

# A) Flexible Schema

Huge advantage.

Documents can differ.

Example:

Document 1:

```json
{
  "name": "Skyy"
}
```

Document 2:

```json
{
  "name": "Alex",
  "skills": ["Go", "Rust"]
}
```

No migration required.

---

# B) Horizontal Scaling

NoSQL databases are usually designed for:

# Distributed Systems

Easy to spread across many machines.

Example:

```text
Server 1
Server 2
Server 3
```

This is called:

# Sharding

---

# C) High Performance

Many NoSQL databases optimize for:

* fast writes
* massive scale
* caching
* real-time systems

---

# Advantages of NoSQL Databases

---

## 1. Flexible structure

Excellent for rapidly changing applications.

---

## 2. Easy scaling

Perfect for internet-scale systems.

---

## 3. Fast for certain workloads

Especially:

* caching
* logging
* realtime analytics
* event streams

---

## 4. Great for unstructured data

Like:

* JSON
* social media
* IoT
* sensor data

---

# Disadvantages of NoSQL Databases

---

## 1. Weaker consistency (sometimes)

Many NoSQL systems prefer:

# BASE

instead of ACID.

| Letter | Meaning              |
| ------ | -------------------- |
| B      | Basically Available  |
| A      | Soft State           |
| S      | Eventual Consistency |

Meaning:

data may become consistent later.

---

## 2. Complex relationships

Joins are often weak or absent.

You usually duplicate data instead.

---

## 3. Less standardized

Each NoSQL database behaves differently.

Unlike SQL:

```sql
SELECT * FROM users;
```

which works similarly everywhere.

---

# SQL vs NoSQL — Side by Side

| Feature        | SQL                        | NoSQL                          |
| -------------- | -------------------------- | ------------------------------ |
| Structure      | Tables                     | Documents/Key-Value/etc        |
| Schema         | Fixed                      | Flexible                       |
| Relationships  | Strong                     | Usually weaker                 |
| Scaling        | Vertical                   | Horizontal                     |
| Transactions   | Strong ACID                | Often eventual consistency     |
| Query Language | Standard SQL               | Database-specific              |
| Best For       | Structured relational data | Massive scalable flexible data |
| Examples       | PostgreSQL, MySQL          | MongoDB, Redis                 |

---

# Real World Examples

---

# When SQL is Better

## Banking App

Need:

* precise transactions
* consistency
* rollback
* integrity

SQL wins.

---

## Ecommerce Orders

Products, customers, payments, invoices all relate together.

SQL is usually best.

---

## Analytics Dashboards

Complex aggregations:

```sql
GROUP BY
SUM
AVG
WINDOW FUNCTIONS
```

SQL dominates here.

---

# When NoSQL is Better

---

## Social Media Feed

Huge scale.

Flexible content.

Millions of writes.

NoSQL often fits better.

---

## Realtime Chat App

Messages arrive extremely fast.

Distributed scaling matters.

---

## Caching Layer

Using:

* Redis

for ultra-fast reads.

---

# CAP Theorem (Very Important)

Distributed systems usually discuss:

# CAP Theorem

A distributed database can only strongly guarantee 2 of 3:

| Letter | Meaning             |
| ------ | ------------------- |
| C      | Consistency         |
| A      | Availability        |
| P      | Partition Tolerance |

Modern NoSQL systems often prioritize:

```text
Availability + Partition Tolerance
```

while many SQL systems prioritize:

```text
Consistency + Reliability
```

---

# Modern Reality: The Line is Blurring

Today:

## SQL databases added:

* JSON support
* horizontal scaling
* replication

Especially:

* PostgreSQL

---

## NoSQL databases added:

* transactions
* indexing
* query languages

Especially:

* MongoDB

So modern systems are becoming hybrids.

---

# Which One Should We Learn?

For backend engineering:

# Learn SQL FIRST.

Especially:

* PostgreSQL

Why?

Because SQL teaches:

* data modeling
* normalization
* joins
* indexing
* transactions
* query optimization

These concepts make us better backend engineers overall.

After that:

learn NoSQL systems like:

* MongoDB
* Redis

because real-world systems often use both.

Example architecture:

```text
PostgreSQL  → main database
Redis       → caching
MongoDB     → flexible document storage
```

---

# Practical Industry Truth

Most production systems today are NOT:

```text
SQL OR NoSQL
```

They are:

# SQL + NoSQL together

because each solves different problems.

---

# Simple Mental Model

## SQL

Think:

```text
Structure
Relationships
Consistency
Correctness
```

---

## NoSQL

Think:

```text
Flexibility
Scale
Speed
Distributed systems
```

# What is PostgreSQL?

PostgreSQL (often called **Postgres**) is an:

# Open-source Relational Database Management System (RDBMS)

It is one of the most respected and widely used databases in the world.

Big companies use it for:

* banking systems
* ecommerce platforms
* SaaS products
* fintech
* analytics
* government systems
* AI platforms
* enterprise applications

because it is:

```text
Reliable
Powerful
Extensible
Standards-compliant
Production-grade
```

---

# The Core Purpose of PostgreSQL

At its heart, PostgreSQL solves this problem:

# "How do we safely store, organize, retrieve, and protect massive amounts of important data?"

Example:

Imagine building:

* Amazon
* Instagram
* Uber
* Banking software
* Hospital systems

You need to store:

* users
* payments
* orders
* messages
* logs
* transactions
* analytics

and you need guarantees that:

* data won't corrupt
* crashes won't destroy data
* multiple users won't overwrite each other
* queries remain fast
* relationships remain valid

That is exactly what PostgreSQL is designed to solve.

---

# Why Not Just Use Files?

Without databases, we'd store data in:

```text
JSON files
TXT files
CSV files
Excel sheets
```

But that becomes a disaster at scale.

---

# Problems With File-Based Storage

## 1. No Concurrency

If 1000 users update the same file:

```text
Data corruption happens
```

---

## 2. Slow Searching

Finding data becomes extremely inefficient.

Example:

```text
Find all users from Kolkata
```

In files:

```text
Scan entire file manually
```

In PostgreSQL:

```sql id="m4u9xm"
SELECT * FROM users WHERE city='Kolkata';
```

Optimized using indexes.

---

## 3. No Relationships

Files don't naturally handle:

* users ↔ orders
* students ↔ courses
* doctors ↔ appointments

PostgreSQL does.

---

## 4. No Transactions

Critical systems need:

# "All-or-nothing operations"

Example:

Bank transfer:

```text
Deduct ₹5000 from A
Add ₹5000 to B
```

If power fails midway:

```text
Money disappears
```

PostgreSQL prevents this using ACID transactions.

---

# Why PostgreSQL Became So Popular

Many databases exist.

Examples:

* MySQL
* SQLite
* MongoDB
* Oracle Database

But PostgreSQL has a unique reputation.

---

# PostgreSQL's Philosophy

PostgreSQL prioritizes:

```text
Correctness
Standards
Reliability
Data integrity
Advanced features
```

over shortcuts.

That is why engineers trust it deeply.

---

# Why Companies Prefer PostgreSQL

---

# 1. Extremely Reliable

PostgreSQL is famous for:

# Data Integrity

Meaning:

```text
Your data stays correct.
```

This matters massively in:

* finance
* banking
* healthcare
* ecommerce
* government

Companies cannot afford silent corruption.

---

# 2. ACID Transactions

PostgreSQL has world-class transaction support.

# ACID

| Letter | Meaning     |
| ------ | ----------- |
| A      | Atomicity   |
| C      | Consistency |
| I      | Isolation   |
| D      | Durability  |

---

## Example

Suppose:

```text
User buys a product
```

Database operations:

```text
1. Deduct inventory
2. Charge payment
3. Create order
4. Generate invoice
```

If step 3 fails:

PostgreSQL can rollback everything safely.

Without transactions:

```text
Inventory may reduce
but order may not exist
```

Huge disaster.

---

# 3. Powerful Query Engine

PostgreSQL is incredibly powerful for querying data.

Example capabilities:

```sql id="b1e3qv"
JOIN
GROUP BY
WINDOW FUNCTIONS
CTEs
SUBQUERIES
PARTITIONING
JSON Queries
FULL TEXT SEARCH
```

This makes it useful for:

* analytics
* dashboards
* reporting
* business intelligence

---

# 4. Advanced SQL Compliance

PostgreSQL follows SQL standards more strictly than many competitors.

This matters because:

* cleaner architecture
* portability
* predictable behavior
* enterprise trust

---

# 5. Extensible Architecture

This is one of PostgreSQL's superpowers.

You can extend it heavily.

Example:

* custom data types
* custom operators
* extensions
* procedural languages

Popular extensions:

| Extension   | Purpose         |
| ----------- | --------------- |
| PostGIS     | GIS/geolocation |
| pgvector    | AI embeddings   |
| TimescaleDB | Time-series     |
| uuid-ossp   | UUID generation |

---

# PostgreSQL + AI Boom

Recently PostgreSQL became extremely popular in AI systems because of:

# pgvector

This extension allows PostgreSQL to store:

* vector embeddings
* semantic search
* AI similarity search

Meaning PostgreSQL can now behave partially like a vector database.

Huge reason companies love it now.

---

# 6. JSON Support (Hybrid SQL + NoSQL)

Modern apps often use JSON heavily.

PostgreSQL supports:

# JSON and JSONB

Example:

```json id="lhm2hp"
{
  "skills": ["Go", "React"],
  "socials": {
    "github": "skyy"
  }
}
```

Stored directly inside PostgreSQL.

This gives:

```text
SQL + NoSQL hybrid power
```

This is massive.

---

# 7. Open Source

PostgreSQL is:

# Completely free

No expensive licensing like:

* Oracle Database

Companies save enormous money.

Yet PostgreSQL still delivers enterprise-grade quality.

---

# 8. Strong Community

PostgreSQL has one of the best engineering communities in databases.

Benefits:

* stability
* documentation
* ecosystem
* tooling
* security updates

---

# 9. Great Scalability

PostgreSQL scales surprisingly well.

Supports:

* replication
* partitioning
* indexing
* read replicas
* connection pooling

Large companies run massive workloads on it.

---

# What Problems PostgreSQL Solves

---

# Problem 1 — Data Organization

Instead of messy files:

```text
users.json
orders.json
payments.json
```

PostgreSQL organizes data relationally.

---

# Problem 2 — Data Relationships

Example:

```text
User → Orders
Order → Products
Product → Reviews
```

Handled elegantly using relational modeling.

---

# Problem 3 — Safe Concurrent Access

Thousands of users can access the database simultaneously.

PostgreSQL handles:

* locks
* MVCC
* transactions
* isolation

safely.

---

# Problem 4 — Data Integrity

Constraints enforce correctness.

Example:

```sql id="7wz6dq"
email TEXT UNIQUE NOT NULL
```

Prevents duplicate emails.

---

# Problem 5 — Query Performance

Indexes make queries fast.

Without indexes:

```text
O(n) full scans
```

With indexes:

```text
Near O(log n)
```

Huge performance gains.

---

# Problem 6 — Crash Recovery

If the server crashes:

PostgreSQL uses:

# WAL (Write Ahead Logging)

to recover safely.

This is a massive engineering feature.

---

# MVCC — One of PostgreSQL's Biggest Strengths

# Multi-Version Concurrency Control

This is one reason PostgreSQL feels so smooth under concurrency.

Instead of locking entire tables aggressively:

PostgreSQL creates multiple versions of rows.

Benefits:

* readers don't block writers
* writers don't block readers much
* high concurrency
* better scalability

This is extremely important in real-world systems.

---

# PostgreSQL vs MySQL

This is a famous comparison.

---

# MySQL

Traditionally known for:

```text
Simplicity
Speed
Ease of use
```

---

# PostgreSQL

Known for:

```text
Correctness
Advanced features
Complex queries
Standards compliance
```

---

# Many engineers say:

## MySQL is easier initially.

## PostgreSQL grows with complexity better.

---

# Why Modern Startups Love PostgreSQL

Because it can do MANY things at once:

---

## Relational Database

Traditional SQL.

---

## JSON Store

Acts partially like NoSQL.

---

## Full Text Search

Search engine features.

---

## Vector Database

AI embeddings.

---

## GIS Database

Using PostGIS.

---

## Time-Series Database

Using TimescaleDB.

---

# So PostgreSQL became:

# "The Swiss Army Knife of Databases"

---

# Important PostgreSQL Concepts

---

# 1. Tables

Store structured data.

---

# 2. Rows

Single records.

---

# 3. Columns

Fields/data attributes.

---

# 4. Primary Keys

Unique row identifiers.

Example:

```sql id="v0qq8k"
id SERIAL PRIMARY KEY
```

---

# 5. Foreign Keys

Relationships between tables.

---

# 6. Indexes

Speed up searching.

---

# 7. Transactions

Safe grouped operations.

---

# 8. WAL

Crash recovery system.

---

# 9. MVCC

Concurrency model.

---

# 10. Schemas

Logical organization inside databases.

---

# 11. Views

Virtual tables based on queries.

---

# 12. Materialized Views

Cached query results.

---

# 13. Replication

Copy database data across servers.

---

# 14. Partitioning

Split huge tables into smaller chunks.

---

# 15. Extensions

Add extra functionality.

---

# Real-World Example

Imagine building your MERN ecommerce app.

You need:

* users
* carts
* orders
* inventory
* payments
* reviews

This data is highly relational.

PostgreSQL handles this beautifully.

Example:

```text
users
  ↓
orders
  ↓
order_items
  ↓
products
```

This is where relational databases dominate.

---

# Why Backend Engineers Should Learn PostgreSQL

Because PostgreSQL teaches:

* real database design
* normalization
* indexing
* query optimization
* transactions
* concurrency
* scalability
* data modeling

These are core backend engineering skills.

---

# Industry Reality

Many modern companies use:

```text
PostgreSQL as the primary database
Redis for caching
Kafka for events
Elasticsearch for search
```

PostgreSQL often becomes the system of record.

Meaning:

# "The source of truth"

---

# Final Mental Model

Think of PostgreSQL as:

# A highly reliable engine for structured data systems

optimized for:

```text
Correctness
Relationships
Safety
Complex querying
Concurrency
Scalability
Extensibility
```

That combination is why PostgreSQL is respected so heavily across the software industry.

# CRUD in PostgreSQL

CRUD is the foundation of almost all backend/database applications.

| Letter | Meaning | SQL Command |
| ------ | ------- | ----------- |
| C      | Create  | `INSERT`    |
| R      | Read    | `SELECT`    |
| U      | Update  | `UPDATE`    |
| D      | Delete  | `DELETE`    |

Every major application does these constantly:

* ecommerce
* banking
* social media
* hospital systems
* chat apps
* inventory systems

---

# First Create a Table

We’ll use this throughout.

```sql id="zwwg7m"
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    age INTEGER,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

# Understanding This Table

| Column       | Purpose              |
| ------------ | -------------------- |
| `id`         | unique user ID       |
| `name`       | user name            |
| `email`      | unique email         |
| `age`        | user age             |
| `is_active`  | active/inactive user |
| `created_at` | creation timestamp   |

---

# CREATE → `INSERT`

Used to add data into a table.

---

# Insert One Row

```sql id="4n8k2v"
INSERT INTO users(name, email, age)
VALUES(
    'Skyy',
    'skyy@gmail.com',
    29
);
```

---

# Breakdown

## `INSERT INTO`

Means:

> add data into table

---

## `users`

Target table.

---

## `(name, email, age)`

Columns receiving data.

---

## `VALUES`

Actual row data.

---

# Result

A new row gets created:

| id | name | email                                   | age |
| -- | ---- | --------------------------------------- | --- |
| 1  | Skyy | [skyy@gmail.com](mailto:skyy@gmail.com) | 29  |

---

# Insert Multiple Rows

```sql id="k1gnlm"
INSERT INTO users(name, email, age)
VALUES
('John', 'john@gmail.com', 25),
('Alice', 'alice@gmail.com', 31),
('Bob', 'bob@gmail.com', 22);
```

Very common for:

* seed data
* testing
* bulk inserts

---

# RETURNING

PostgreSQL-specific powerful feature.

```sql id="wzjlwm"
INSERT INTO users(name, email, age)
VALUES(
    'Mike',
    'mike@gmail.com',
    40
)
RETURNING *;
```

Returns inserted row immediately.

Extremely useful in backend APIs.

---

# READ → `SELECT`

Used to retrieve data.

Most used SQL command by far.

---

# Select Everything

```sql id="fjlwm4"
SELECT * FROM users;
```

---

# `*`

Means:

```txt id="eqqjlwm"
all columns
```

---

# Result

| id | name | email | age |
| -- | ---- | ----- | --- |

---

# Select Specific Columns

```sql id="jlwm1z"
SELECT name, email
FROM users;
```

Returns only requested columns.

---

# WHERE Clause

Filters rows.

---

# Example

```sql id="jlwm2z"
SELECT *
FROM users
WHERE age > 25;
```

---

# Comparison Operators

| Operator | Meaning       |
| -------- | ------------- |
| `=`      | equal         |
| `!=`     | not equal     |
| `>`      | greater than  |
| `<`      | less than     |
| `>=`     | greater/equal |
| `<=`     | less/equal    |

---

# Boolean Filtering

```sql id="jlwm3z"
SELECT *
FROM users
WHERE is_active = true;
```

Shortcut:

```sql id="jlwm4z"
WHERE is_active;
```

Because boolean already evaluates true/false.

---

# AND / OR

```sql id="jlwm5z"
SELECT *
FROM users
WHERE age > 20
AND is_active = true;
```

---

# ORDER BY

Sorting results.

```sql id="jlwm6z"
SELECT *
FROM users
ORDER BY age DESC;
```

---

# ASC vs DESC

| Keyword | Meaning    |
| ------- | ---------- |
| `ASC`   | ascending  |
| `DESC`  | descending |

---

# LIMIT

Restrict number of rows.

```sql id="jlwm7z"
SELECT *
FROM users
LIMIT 5;
```

Very common in:

* pagination
* APIs
* dashboards

---

# UPDATE → `UPDATE`

Modify existing rows.

---

# Update Single User

```sql id="jlwm8z"
UPDATE users
SET age = 30
WHERE id = 1;
```

---

# Breakdown

| Part           | Meaning              |
| -------------- | -------------------- |
| `UPDATE users` | target table         |
| `SET`          | new values           |
| `WHERE`        | which rows to update |

---

# CRITICAL WARNING

Without `WHERE`:

```sql id="jlwm9z"
UPDATE users
SET age = 30;
```

EVERY row gets updated.

Classic beginner mistake.

---

# Update Multiple Columns

```sql id="jlwmaz"
UPDATE users
SET
    age = 35,
    is_active = false
WHERE id = 2;
```

---

# RETURNING with UPDATE

```sql id="j0ht8x"
UPDATE users
SET age = 50
WHERE id = 1
RETURNING *;
```

Very useful.

---

# DELETE → `DELETE`

Removes rows.

---

# Delete One Row

```sql id="jlwmbz"
DELETE FROM users
WHERE id = 1;
```

---

# CRITICAL WARNING

Without WHERE:

```sql id="jlwmcz"
DELETE FROM users;
```

ALL rows deleted.

---

# Difference Between DELETE & DROP

Huge distinction.

---

# DELETE

```sql id="jlwmdz"
DELETE FROM users;
```

Removes:

* rows only

Table still exists.

---

# DROP

```sql id="jlwmez"
DROP TABLE users;
```

Removes:

* table itself
* structure
* data
* constraints
* indexes

Completely gone.

---

# TRUNCATE

Fast delete-all operation.

```sql id="jlwmfz"
TRUNCATE TABLE users;
```

Removes all rows quickly.

Often faster than DELETE.

---

# CRUD Flow Example

---

# Create User

```sql id="jlwmgz"
INSERT INTO users(name, email, age)
VALUES('Skyy', 'skyy@gmail.com', 29);
```

---

# Read User

```sql id="ժմlwq1"
SELECT *
FROM users
WHERE email = 'skyy@gmail.com';
```

---

# Update User

```sql id="jlwmhz"
UPDATE users
SET age = 30
WHERE email = 'skyy@gmail.com';
```

---

# Delete User

```sql id="jlwmiz"
DELETE FROM users
WHERE email = 'skyy@gmail.com';
```

---

# Real Backend Mapping

| API               | SQL    |
| ----------------- | ------ |
| POST `/users`     | INSERT |
| GET `/users`      | SELECT |
| PATCH `/users/1`  | UPDATE |
| DELETE `/users/1` | DELETE |

This is why CRUD is fundamental backend knowledge.

---

# Most Important Beginner Mistakes

---

# 1. Forgetting WHERE

Dangerous in:

* UPDATE
* DELETE

---

# 2. Wrong Data Types

Example:

```sql id="jlwmjz"
age = 'hello'
```

invalid for INTEGER.

---

# 3. Inserting NULL into NOT NULL

Example:

```sql id="jlwmkz"
name VARCHAR(100) NOT NULL
```

Cannot insert NULL.

---

# 4. Duplicate UNIQUE Values

Example:

```sql id="jlwmlz"
email VARCHAR(255) UNIQUE
```

Cannot reuse same email.

---

# PostgreSQL-Specific Powerful Features

PostgreSQL CRUD becomes extremely powerful because of:

* `RETURNING`
* JSON support
* CTEs
* UPSERTS
* Transactions
* Window functions

You’ll eventually use those heavily in production apps.

---

# Most Important Commands Cheat Sheet

---

# CREATE

```sql id="wletd3"
INSERT INTO table(columns)
VALUES(values);
```

---

# READ

```sql id="jlwmmz"
SELECT * FROM table;
```

---

# FILTER

```sql id="jlwmnz"
WHERE condition
```

---

# UPDATE

```sql id="jwjlwm0"
UPDATE table
SET column = value
WHERE condition;
```

---

# DELETE

```sql id="jlwmoz"
DELETE FROM table
WHERE condition;
```

---

# SAFETY RULE

Always mentally check:

```txt id="jlwmpz"
Do I REALLY want this affecting ALL rows?
```

before running:

* UPDATE
* DELETE

That habit saves developers from catastrophic production mistakes.

This is actually a very good introduction to some of PostgreSQL’s strongest features:

* UUIDs
* JSONB
* JSON operators
* dynamic event storage
* semi-structured data

These are things companies heavily use in real systems.

---

# Full Query

```sql id="mjlwm1"
DROP TABLE IF EXISTS basics.app_events;

CREATE TABLE basics.app_events(
    -- UUID --
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    event_name TEXT NOT NULL,

    -- JSONB --
    metadata JSONB DEFAULT '{}'::jsonb,

    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO basics.app_events(event_name,metadata)
VALUES
('sign-up','{"browser":"chrome"}'),
('sign-in','{"user":"skyy"}');

SELECT * FROM basics.app_events;

SELECT
    event_name,
    metadata ->> 'browser' AS browser
FROM basics.app_events
WHERE metadata ? 'browser';
```

---

# High-Level Goal of This Table

This table stores application events/logs.

Examples:

* user signups
* user logins
* payments
* clicks
* analytics
* API events

This is VERY common in:

* SaaS apps
* monitoring systems
* analytics pipelines
* audit logs

---

# 1. `DROP TABLE IF EXISTS`

```sql id="8jlwm2"
DROP TABLE IF EXISTS basics.app_events;
```

---

# Meaning

Delete table if it already exists.

---

# Why use this?

During development:

* rerun scripts safely
* avoid “table already exists” errors

---

# Without `IF EXISTS`

This:

```sql id="8jlwm3"
DROP TABLE basics.app_events;
```

would fail if table doesn’t exist.

---

# 2. `CREATE TABLE`

```sql id="8jlwm4"
CREATE TABLE basics.app_events(
```

Creates table:

* inside schema `basics`
* named `app_events`

---

# PostgreSQL Hierarchy Reminder

```txt id="8jlwm5"
database
   └── schema
           └── table
```

So:

```sql id="8jlwm6"
basics.app_events
```

means:

| Part         | Meaning |
| ------------ | ------- |
| `basics`     | schema  |
| `app_events` | table   |

---

# 3. UUID Column

```sql id="8jlwm7"
id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
```

This is extremely important.

---

# What is UUID?

UUID =
Universal Unique Identifier

Example:

```txt id="8jlwm8"
550e8400-e29b-41d4-a716-446655440000
```

---

# Why UUID exists

Instead of numeric IDs:

```txt id="8jlwm9"
1
2
3
4
```

UUIDs generate globally unique identifiers.

---

# Why companies use UUIDs

---

# Problem with Sequential IDs

Suppose API returns:

```txt id="8jlwm10"
/users/1
/users/2
/users/3
```

Attackers can guess IDs easily.

---

# UUID Solves This

```txt id="8jlwm11"
/users/a12f8d91-4d...
```

Hard to guess.

Better for:

* security
* distributed systems
* microservices
* merging databases

---

# `PRIMARY KEY`

```sql id="8jlwm12"
PRIMARY KEY
```

Means:

* unique
* indexed
* identifies each row

No duplicates allowed.

---

# `DEFAULT gen_random_uuid()`

```sql id="8jlwm13"
DEFAULT gen_random_uuid()
```

Automatically generates UUID when inserting rows.

So we don't manually provide IDs.

---

# Example Generated UUID

```txt id="8jlwm14"
3c7f5d78-8d0c-44b5-b7a9-4c5a12c7f908
```

---

# Important

`gen_random_uuid()` comes from PostgreSQL extension:

```sql id="8jlwm15"
CREATE EXTENSION IF NOT EXISTS pgcrypto;
```

You may need this first.

---

# 4. `TEXT`

```sql id="8jlwm16"
event_name TEXT NOT NULL,
```

Stores variable-length text.

Examples:

* sign-up
* sign-in
* payment-success

---

# `NOT NULL`

Means:

* value required
* cannot be empty NULL

---

# 5. JSONB

This is the BIG PostgreSQL feature.

```sql id="8jlwm17"
metadata JSONB DEFAULT '{}'::jsonb,
```

---

# What is JSONB?

Binary JSON storage format.

Allows PostgreSQL to store JSON efficiently.

---

# Example JSON

```json id="8jlwm18"
{
  "browser": "chrome",
  "country": "India"
}
```

---

# Why JSONB is powerful

Traditional SQL databases are rigid.

Normally every field needs a column:

| id | browser | country | ip |

But event systems are dynamic.

Different events contain different data.

---

# Example

Signup event:

```json id="8jlwm19"
{
  "browser":"chrome"
}
```

Payment event:

```json id="8jlwm20"
{
  "amount":500,
  "currency":"USD"
}
```

Login event:

```json id="8jlwm21"
{
  "ip":"1.2.3.4"
}
```

JSONB lets us store flexible structures.

---

# Why PostgreSQL is loved

Because it combines:

| SQL Structure | NoSQL Flexibility |
| ------------- | ----------------- |
| tables        | JSONB             |
| constraints   | nested JSON       |
| joins         | document storage  |

It’s like:

* relational DB
* partial document DB

at the same time.

---

# `DEFAULT '{}'::jsonb`

```sql id="8jlwm22"
DEFAULT '{}'::jsonb
```

---

# `{}`

Empty JSON object.

Equivalent to:

```json id="8jlwm23"
{}
```

---

# `::jsonb`

Type casting.

Means:

> convert this into JSONB type

---

# PostgreSQL Type Casting

```sql id="8jlwm24"
'value'::datatype
```

Examples:

```sql id="8jlwm25"
'123'::integer
'true'::boolean
'{}'::jsonb
```

---

# 6. Timestamp

```sql id="8jlwm26"
created_at TIMESTAMP DEFAULT NOW()
```

---

# TIMESTAMP

Stores:

* date
* time

Example:

```txt id="8jlwm27"
2026-05-15 18:22:01
```

---

# `NOW()`

PostgreSQL function returning current timestamp.

Automatically fills creation time.

---

# 7. INSERT

```sql id="8jlwm28"
INSERT INTO basics.app_events(event_name,metadata)
VALUES
('sign-up','{"browser":"chrome"}'),
('sign-in','{"user":"skyy"}');
```

---

# What gets inserted

---

# Row 1

```json id="8jlwm29"
{
  "event_name":"sign-up",
  "metadata":{
    "browser":"chrome"
  }
}
```

---

# Row 2

```json id="8jlwm30"
{
  "event_name":"sign-in",
  "metadata":{
    "user":"skyy"
  }
}
```

---

# Notice

Different rows have different JSON structure.

Very powerful.

---

# 8. `SELECT *`

```sql id="8jlwm31"
SELECT * FROM basics.app_events;
```

Returns all rows and columns.

---

# 9. JSON Operators

This is the advanced PostgreSQL magic.

---

# `->>`

```sql id="8jlwm32"
metadata ->> 'browser'
```

Means:

> extract JSON value as TEXT

---

# Example

From:

```json id="8jlwm33"
{
  "browser":"chrome"
}
```

it extracts:

```txt id="8jlwm34"
chrome
```

---

# Difference Between `->` and `->>`

---

# `->`

Returns JSON.

```sql id="8jlwm35"
metadata -> 'browser'
```

returns:

```json id="8jlwm36"
"chrome"
```

(still JSON)

---

# `->>`

Returns plain text.

```sql id="8jlwm37"
metadata ->> 'browser'
```

returns:

```txt id="8jlwm38"
chrome
```

(text value)

---

# 10. `AS`

```sql id="8jlwm39"
AS browser
```

Creates alias/temporary column name.

---

# Without AS

Column name becomes ugly:

```txt id="8jlwm40"
?column?
```

---

# With AS

Cleaner result:

| browser |
| ------- |

---

# 11. `WHERE metadata ? 'browser'`

This is another PostgreSQL JSONB operator.

---

# `?`

Means:

> does this JSON key exist?

---

# Example

This row:

```json id="8jlwm41"
{
  "browser":"chrome"
}
```

contains key:

```txt id="8jlwm42"
browser
```

So condition becomes TRUE.

---

# This row

```json id="8jlwm43"
{
  "user":"skyy"
}
```

does NOT contain:

* browser

So it gets filtered out.

---

# Final Query Meaning

```sql id="8jlwm44"
SELECT
    event_name,
    metadata ->> 'browser' AS browser
FROM basics.app_events
WHERE metadata ? 'browser';
```

means:

> Find all events whose metadata contains `browser`, then extract browser value as text.

---

# Result

| event_name | browser |
| ---------- | ------- |
| sign-up    | chrome  |

---

# Why JSONB Is Huge in Industry

Used heavily for:

* event tracking
* analytics
* audit logs
* flexible settings
* API payloads
* metadata systems
* feature flags

Companies love PostgreSQL because JSONB gives:

* relational DB power
* NoSQL flexibility

without switching databases.

---

# Important PostgreSQL JSONB Operators

| Operator | Meaning          |
| -------- | ---------------- |
| `->`     | get JSON object  |
| `->>`    | get text value   |
| `?`      | key exists       |
| `@>`     | contains JSON    |
| `#>`     | nested JSON path |

---

# Real Backend Example

Suppose Node.js app tracks events:

```json id="8jlwm45"
{
  "event":"purchase",
  "metadata":{
    "amount":500,
    "currency":"USD",
    "device":"mobile"
  }
}
```

Instead of constantly changing schema, JSONB stores flexible event metadata cleanly.

That’s one reason PostgreSQL dominates modern backend systems.

# LIMIT, OFFSET, and Pagination in PostgreSQL

These concepts are used to:

# Control how much data we fetch from the database

This becomes extremely important in real-world applications because tables can contain:

```text id="b8ng5f"
Thousands
Millions
Billions
```

of rows.

We almost NEVER want:

```sql id="w0w1di"
SELECT * FROM products;
```

on huge production tables.

Why?

Because:

* slow queries
* huge memory usage
* network overhead
* bad user experience

Instead, we fetch data in chunks.

That is where:

* `LIMIT`
* `OFFSET`
* pagination

come in.

---

# 1. LIMIT

# What LIMIT Does

`LIMIT` restricts:

# "How many rows PostgreSQL should return"

---

# Basic Syntax

```sql id="i86v4r"
SELECT *
FROM products
LIMIT 5;
```

Meaning:

```text id="dy5eqs"
Return only 5 rows
```

even if the table has 10 million rows.

---

# Example

Suppose table:

| id | name     |
| -- | -------- |
| 1  | iPhone   |
| 2  | Mouse    |
| 3  | Keyboard |
| 4  | Monitor  |
| 5  | Chair    |
| 6  | Camera   |

Query:

```sql id="csmg9q"
SELECT *
FROM products
LIMIT 3;
```

Result:

| id | name     |
| -- | -------- |
| 1  | iPhone   |
| 2  | Mouse    |
| 3  | Keyboard |

Only first 3 rows returned.

---

# Why LIMIT is Important

---

## A) Performance

Huge tables become manageable.

---

## B) APIs

Most APIs never return entire datasets.

Example:

```text id="3drw85"
GET /products
```

Usually returns maybe:

```text id="69v5u5"
10
20
50
```

items.

---

## C) Infinite Scrolling

Social media feeds use limited chunks.

---

# LIMIT Without ORDER BY is Dangerous

This is VERY important.

---

# Bad Practice

```sql id="c8e7nv"
SELECT *
FROM products
LIMIT 5;
```

Problem:

# PostgreSQL does NOT guarantee row order

Meaning results may differ.

---

# Correct Practice

```sql id="t4d0pj"
SELECT *
FROM products
ORDER BY created_at DESC
LIMIT 5;
```

Now results are deterministic.

---

# Mental Model

`LIMIT` means:

# "Stop after N rows"

---

# 2. OFFSET

# What OFFSET Does

`OFFSET` skips rows.

---

# Syntax

```sql id="ob44w2"
SELECT *
FROM products
OFFSET 5;
```

Meaning:

```text id="cw3kri"
Skip first 5 rows
```

and return the rest.

---

# Example

Table:

| id | name |
| -- | ---- |
| 1  | A    |
| 2  | B    |
| 3  | C    |
| 4  | D    |
| 5  | E    |
| 6  | F    |
| 7  | G    |

Query:

```sql id="vmptpn"
SELECT *
FROM products
OFFSET 3;
```

Result:

| id | name |
| -- | ---- |
| 4  | D    |
| 5  | E    |
| 6  | F    |
| 7  | G    |

First 3 skipped.

---

# OFFSET is Usually Used WITH LIMIT

Because OFFSET alone is uncommon.

---

# Example

```sql id="4m6z7z"
SELECT *
FROM products
LIMIT 5
OFFSET 10;
```

Meaning:

```text id="66whjz"
Skip first 10 rows
Then return next 5 rows
```

---

# Visual Understanding

Suppose rows:

```text id="a85yzv"
1 2 3 4 5 6 7 8 9 10 11 12
```

Query:

```sql id="thq29u"
LIMIT 3 OFFSET 4
```

Steps:

---

## Step 1

Skip:

```text id="wt9bf0"
1 2 3 4
```

---

## Step 2

Take next 3:

```text id="mgbn6m"
5 6 7
```

Result:

```text id="m0i6md"
5 6 7
```

---

# ORDER MATTERS

Always combine with `ORDER BY`.

Correct:

```sql id="r3o1uo"
SELECT *
FROM products
ORDER BY created_at DESC
LIMIT 10
OFFSET 20;
```

---

# 3. Pagination

Pagination means:

# Splitting large datasets into pages

Example:

```text id="m8sdmz"
Page 1
Page 2
Page 3
```

Common in:

* ecommerce
* blogs
* admin dashboards
* APIs

---

# Real Example

Suppose:

```text id="3mth3j"
10 products per page
```

---

# Page 1

```sql id="up9z6r"
SELECT *
FROM products
ORDER BY id
LIMIT 10
OFFSET 0;
```

---

# Page 2

```sql id="98gcsi"
SELECT *
FROM products
ORDER BY id
LIMIT 10
OFFSET 10;
```

---

# Page 3

```sql id="2g3ty4"
SELECT *
FROM products
ORDER BY id
LIMIT 10
OFFSET 20;
```

---

# Pagination Formula

This is VERY important.

# Formula

\text{OFFSET}=(\text{page}-1)\times\text{limit}

---

# Example

Suppose:

```text id="r1k0x4"
page = 4
limit = 10
```

Then:

(4-1)\times10=30

Query:

```sql id="jk4x0q"
SELECT *
FROM products
ORDER BY id
LIMIT 10
OFFSET 30;
```

---

# Backend Example

Suppose frontend sends:

```text id="ay7jlwm"
?page=3&limit=10
```

Backend calculates:

```javascript id="1cshaj"
const offset = (page - 1) * limit;
```

SQL:

```sql id="wn7qv7"
SELECT *
FROM products
ORDER BY id
LIMIT 10
OFFSET 20;
```

---

# Why Pagination Matters

Without pagination:

```text id="5mv2m8"
Frontend freezes
Huge API responses
Memory waste
Slow loading
Bad UX
```

Imagine returning:

```text id="4odn1w"
2 million products
```

to browser.

Disaster.

---

# Real-World API Usage

Example response:

```json id="4c3ayh"
{
  "page": 2,
  "limit": 10,
  "total": 100,
  "data": [...]
}
```

Very common REST API design.

---

# LIMIT/OFFSET Execution Internally

This is important theoretically.

---

# PostgreSQL Still Reads Rows

Many beginners think:

```text id="d1n1r7"
OFFSET 1000000
```

means PostgreSQL jumps magically.

Not exactly.

PostgreSQL often still scans/skips rows internally.

Meaning:

```text id="bjlwmc"
Large OFFSET becomes slow
```

---

# Problem with Large OFFSET

Example:

```sql id="e99pza"
SELECT *
FROM products
ORDER BY id
LIMIT 10
OFFSET 1000000;
```

PostgreSQL may still process 1 million rows first.

Very expensive.

---

# Why OFFSET Pagination Becomes Slow

Because database must:

```text id="s88a6r"
Read
Sort
Skip
Then return
```

large amounts of rows.

---

# Better Alternative: Cursor Pagination (Keyset Pagination)

Advanced systems often avoid OFFSET for huge datasets.

Instead use:

# WHERE-based pagination

Example:

```sql id="i4b9mr"
SELECT *
FROM products
WHERE id > 100
ORDER BY id
LIMIT 10;
```

This is MUCH faster for massive datasets.

Used heavily in:

* Twitter/X
* Instagram
* Facebook feeds
* large APIs

---

# OFFSET Pagination vs Cursor Pagination

| Feature                   | OFFSET | Cursor    |
| ------------------------- | ------ | --------- |
| Simple                    | Yes    | Moderate  |
| Good for small apps       | Yes    | Yes       |
| Large dataset performance | Poor   | Excellent |
| Random page access        | Easy   | Hard      |
| Infinite scrolling        | Okay   | Excellent |

---

# COUNT(*) With Pagination

Often APIs need total rows.

Example:

```sql id="8v7f2k"
SELECT COUNT(*)
FROM products;
```

Combined with pagination metadata.

---

# Common Pagination API Structure

Example:

```json id="aj0fsr"
{
  "totalItems": 500,
  "currentPage": 2,
  "pageSize": 10,
  "totalPages": 50,
  "data": [...]
}
```

---

# Important Best Practices

---

# 1. ALWAYS Use ORDER BY

Bad:

```sql id="8rqmhh"
SELECT * FROM products LIMIT 10;
```

Good:

```sql id="zjlwm9"
SELECT *
FROM products
ORDER BY id
LIMIT 10;
```

---

# 2. Index Your ORDER BY Column

Example:

```sql id="3wg5nz"
CREATE INDEX idx_products_created_at
ON products(created_at);
```

Improves pagination performance.

---

# 3. Avoid Huge OFFSET

Bad:

```sql id="0ew1he"
OFFSET 5000000
```

---

# 4. Use Cursor Pagination for Massive Apps

Especially:

* social media
* real-time feeds
* infinite scrolling

---

# Real-World Mental Model

---

# LIMIT

Think:

# "How many rows do we want?"

---

# OFFSET

Think:

# "How many rows should we skip first?"

---

# Pagination

Think:

# "How do we split massive data into manageable pages?"

# Joins in PostgreSQL — In Depth

Joins are the heart of relational databases.

Without joins:

* our tables become isolated
* our database loses most of its relational power

Joins allow us to combine related data from multiple tables.

This is how real applications work:

* users + posts
* customers + orders
* products + categories
* payments + invoices
* comments + authors

Almost every serious backend application relies heavily on joins.

---

# Why Joins Exist

Relational databases follow a concept called:

# Normalization

This means we split data into related tables to:

* reduce duplication
* improve consistency
* organize data properly

---

# Example Without Normalization (Bad Design)

```txt id="x1c8z7"
posts
------------------------------------------------------
post_id | title       | author_name | author_email
------------------------------------------------------
1       | SQL Tips    | Skyy        | skyy@gmail.com
2       | GoLang      | Skyy        | skyy@gmail.com
```

Problems:

* repeated user data
* difficult updates
* wasted storage
* inconsistent records possible

---

# Normalized Structure (Good Design)

## users

| id | name | email                                   |
| -- | ---- | --------------------------------------- |
| 1  | Skyy | [skyy@gmail.com](mailto:skyy@gmail.com) |

---

## posts

| id | title    | user_id |
| -- | -------- | ------- |
| 1  | SQL Tips | 1       |
| 2  | GoLang   | 1       |

Now:

* user information exists once
* relationships are maintained through foreign keys

Then joins help us reconstruct related data whenever we need it.

---

# Relationship Types

Before learning joins deeply, we should understand relationships.

---

# 1. One-to-One

```txt id="e9wq4p"
users ↔ profiles
```

One user:

* has one profile

---

# 2. One-to-Many

```txt id="4g1zuv"
users → posts
```

One user:

* can write many posts

One post:

* belongs to one user

This is the most common relationship type.

---

# 3. Many-to-Many

```txt id="j9yb1q"
posts ↔ tags
```

One post:

* can have many tags

One tag:

* can belong to many posts

This requires a junction table.

---

# Core Idea of a Join

A join matches related rows between tables.

Usually through:

```sql id="n8c7vl"
ON parent.id = child.foreign_key
```

---

# Example Tables

---

# users

| id | name  |
| -- | ----- |
| 1  | Skyy  |
| 2  | Bruce |
| 3  | Tony  |

---

# posts

| id  | title      | user_id |
| --- | ---------- | ------- |
| 101 | SQL Tips   | 1       |
| 102 | Batman DB  | 2       |
| 103 | Ironman AI | 3       |
| 104 | Unknown    | NULL    |

---

# INNER JOIN

This is the most important join.

---

# Query

```sql id="1yk2sr"
SELECT
    users.name,
    posts.title
FROM users
INNER JOIN posts
ON users.id = posts.user_id;
```

---

# Meaning

We only return rows where:

* a matching relationship exists

---

# Matching Logic

PostgreSQL checks:

```txt id="4dnq7x"
users.id == posts.user_id
```

---

# Matches

| users.id | posts.user_id |
| -------- | ------------- |
| 1        | 1             |
| 2        | 2             |
| 3        | 3             |

---

# Result

| name  | title      |
| ----- | ---------- |
| Skyy  | SQL Tips   |
| Bruce | Batman DB  |
| Tony  | Ironman AI |

---

# Important

The post:

```txt id="v2j7na"
Unknown
```

gets excluded because:

* it has no matching user

---

# INNER JOIN = Intersection

We can think of INNER JOIN as:

```txt id="0mn4ze"
only matching rows survive
```

---

# LEFT JOIN

Extremely common in real applications.

---

# Query

```sql id="v2y4w1"
SELECT
    users.name,
    posts.title
FROM users
LEFT JOIN posts
ON users.id = posts.user_id;
```

---

# Meaning

We return:

* ALL rows from the LEFT table
* matching rows from the RIGHT table

If no match exists:

* PostgreSQL fills RIGHT-side columns with NULL

---

# Example

Suppose:

## users

| id | name  |
| -- | ----- |
| 1  | Skyy  |
| 2  | Bruce |
| 3  | Tony  |
| 4  | Peter |

---

## posts

| title    | user_id |
| -------- | ------- |
| SQL Tips | 1       |
| Batman   | 2       |

---

# Result

| name  | title    |
| ----- | -------- |
| Skyy  | SQL Tips |
| Bruce | Batman   |
| Tony  | NULL     |
| Peter | NULL     |

---

# Why LEFT JOIN Matters

We use it constantly for:

* dashboards
* analytics
* reports
* optional relationships
* finding missing data

---

# RIGHT JOIN

RIGHT JOIN is the opposite of LEFT JOIN.

---

# Query

```sql id="7n4m3v"
SELECT
    users.name,
    posts.title
FROM users
RIGHT JOIN posts
ON users.id = posts.user_id;
```

---

# Meaning

We return:

* ALL rows from the RIGHT table
* matching rows from the LEFT table

---

# FULL OUTER JOIN

Returns everything.

---

# Query

```sql id="z7x1m2"
SELECT
    users.name,
    posts.title
FROM users
FULL OUTER JOIN posts
ON users.id = posts.user_id;
```

---

# Meaning

We get:

* matched rows
* unmatched LEFT rows
* unmatched RIGHT rows

---

# CROSS JOIN

Potentially dangerous if misunderstood.

---

# Query

```sql id="0c2v1b"
SELECT *
FROM users
CROSS JOIN posts;
```

---

# Meaning

Every user combines with every post.

---

# Example

If we have:

* 3 users
* 4 posts

then PostgreSQL generates:

```txt id="0pk9sj"
3 × 4 = 12 rows
```

---

# Cartesian Product

Formula:

```txt id="a1mf8x"
rowsA × rowsB
```

This can explode into millions of rows accidentally.

---

# SELF JOIN

A table joining itself.

---

# Example Table

| id | name  | manager_id |
| -- | ----- | ---------- |
| 1  | Bruce | NULL       |
| 2  | Clark | 1          |

---

# Query

```sql id="m8z0rk"
SELECT
    e.name AS employee,
    m.name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.id;
```

---

# Why Aliases Matter

Aliases make queries:

* shorter
* cleaner
* easier to read

Especially in joins.

---

# Example

```sql id="4v1wqe"
FROM users u
INNER JOIN posts p
ON u.id = p.user_id
```

---

# Multi-Table Joins

Real applications usually join many tables together.

---

# Example

```sql id="2c9y1l"
SELECT
    users.name,
    posts.title,
    comments.body
FROM users
INNER JOIN posts
ON users.id = posts.user_id
INNER JOIN comments
ON posts.id = comments.post_id;
```

---

# Relationship Flow

```txt id="4q2vzo"
users
   ↓
posts
   ↓
comments
```

---

# Many-to-Many Joins

---

# Tables

```txt id="6xt7wp"
posts
tags
post_tags
```

---

# Query

```sql id="1mz9cp"
SELECT
    posts.title,
    tags.name
FROM posts
INNER JOIN post_tags
ON posts.id = post_tags.post_id
INNER JOIN tags
ON tags.id = post_tags.tag_id;
```

---

# Why Junction Tables Exist

Relational databases cannot directly store:

* many-to-many relationships

So we create a bridge table.

---

# NULL Behavior in Joins

Very important.

---

# INNER JOIN

Rows without matches usually disappear.

---

# LEFT JOIN

Unmatched RIGHT-side rows become:

```txt id="2w8m4v"
NULL
```

---

# Example Query

```sql id="7j2m8p"
SELECT
    users.name,
    posts.title
FROM users
LEFT JOIN posts
ON users.id = posts.user_id
WHERE posts.id IS NULL;
```

---

# Meaning

Find users who have:

* no posts

This is a very common real-world query.

---

# How PostgreSQL Executes Joins Internally

PostgreSQL may choose different strategies:

| Strategy         | Typical Usage              |
| ---------------- | -------------------------- |
| Nested Loop Join | small datasets             |
| Hash Join        | very common efficient join |
| Merge Join       | sorted joins               |

The query planner chooses the best one automatically.

---

# Indexes Matter a Lot

Join performance heavily depends on indexes.

---

# Common Indexed Columns

```sql id="1c8v5m"
users.id
posts.user_id
```

Foreign keys are often indexed because joins rely on them constantly.

Without indexes:

* joins become slow on large datasets

---

# Real Backend Examples

---

# Blog Application

```txt id="7p9x2l"
users ↔ posts ↔ comments
```

---

# Ecommerce

```txt id="8k0w1n"
customers ↔ orders ↔ order_items ↔ products
```

---

# Social Media

```txt id="4t6n8q"
users ↔ posts ↔ likes ↔ comments
```

---

# SaaS Billing

```txt id="3z1m8r"
users ↔ subscriptions ↔ invoices ↔ payments
```

---

# Most Important Mental Model

A join is simply:

```txt id="9f3c1x"
matching related rows across tables
```

using:

* primary keys
* foreign keys

---

# Most Common Beginner Mistakes

---

# 1. Missing ON Condition

```sql id="6r2w8v"
SELECT *
FROM users
JOIN posts;
```

Can accidentally create a huge cartesian product.

---

# 2. Wrong Join Condition

Incorrect:

```sql id="8n4c1m"
ON users.id = posts.id
```

Correct:

```sql id="7v1m9x"
ON users.id = posts.user_id
```

---

# 3. Ambiguous Columns

This is unclear:

```sql id="0w3x8m"
SELECT id
```

Which table’s `id`?

Better:

```sql id="9m2c7p"
users.id
```

---

# 4. Using INNER JOIN When LEFT JOIN Is Needed

This can accidentally hide rows.

Very common bug in:

* reports
* dashboards
* analytics systems

---

# Most Common Joins Used in Industry

| Join       | Usage Frequency  |
| ---------- | ---------------- |
| INNER JOIN | extremely common |
| LEFT JOIN  | extremely common |
| RIGHT JOIN | rare             |
| FULL JOIN  | rare             |
| CROSS JOIN | niche/dangerous  |

In real backend development, we mostly master:

* INNER JOIN
* LEFT JOIN

because those solve the majority of production problems.

# Aggregate Functions in PostgreSQL — In Depth

Aggregate functions allow us to calculate values from multiple rows.

Instead of returning:

* individual rows

they return:

* summarized/computed results

These are heavily used in:

* analytics
* dashboards
* reports
* business metrics
* backend APIs
* admin panels

Without aggregates, SQL would be far less useful for real applications.

---

# What Aggregate Functions Do

Suppose we have:

| name  | salary |
| ----- | ------ |
| Skyy  | 50000  |
| Bruce | 70000  |
| Tony  | 90000  |

Normally:

```sql id="2v9q1x"
SELECT salary FROM employees;
```

returns:

```txt id="7m1x2w"
50000
70000
90000
```

But aggregate functions summarize rows.

Example:

```sql id="9w2m6q"
SELECT AVG(salary) FROM employees;
```

returns:

```txt id="1z0x7v"
70000
```

(single computed result)

---

# Most Important Aggregate Functions

| Function  | Purpose        |
| --------- | -------------- |
| `COUNT()` | count rows     |
| `SUM()`   | total values   |
| `AVG()`   | average        |
| `MIN()`   | smallest value |
| `MAX()`   | largest value  |

These are the core aggregates we constantly use.

---

# Example Table

We’ll use:

```sql id="0v4x9m"
CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    customer_name TEXT,
    amount NUMERIC(10,2),
    status TEXT
);
```

---

# Sample Data

| id | customer_name | amount | status  |
| -- | ------------- | ------ | ------- |
| 1  | Skyy          | 500    | paid    |
| 2  | Bruce         | 300    | pending |
| 3  | Tony          | 800    | paid    |
| 4  | Skyy          | 200    | paid    |

---

# 1. COUNT()

Counts rows.

---

# Count All Rows

```sql id="5m8x2q"
SELECT COUNT(*)
FROM orders;
```

---

# Result

```txt id="8x7m1v"
4
```

because table contains:

* 4 rows

---

# Why `*`?

```sql id="1m4x9q"
COUNT(*)
```

means:

> count every row

---

# Count Specific Column

```sql id="9q2m1x"
SELECT COUNT(status)
FROM orders;
```

Counts:

* non-NULL values only

Important distinction.

---

# COUNT(column) vs COUNT(*)

---

# `COUNT(*)`

Counts ALL rows.

---

# `COUNT(column)`

Counts only:

* non-NULL values

---

# Example

| name  | age  |
| ----- | ---- |
| Skyy  | 29   |
| Bruce | NULL |

---

```sql id="6x2m8w"
SELECT COUNT(age)
FROM users;
```

returns:

```txt id="3m9x1v"
1
```

because NULL ignored.

---

# 2. SUM()

Adds numeric values.

---

# Query

```sql id="4w8m1x"
SELECT SUM(amount)
FROM orders;
```

---

# Result

```txt id="0v2m9x"
1800
```

because:

```txt id="6m1x8q"
500 + 300 + 800 + 200
```

---

# Used For

* total revenue
* total sales
* total views
* total expenses

Very common in business systems.

---

# 3. AVG()

Calculates average.

---

# Query

```sql id="8m2x0v"
SELECT AVG(amount)
FROM orders;
```

---

# Result

```txt id="5q1x9m"
450
```

---

# Formula

```txt id="1x9m2q"
SUM / COUNT
```

---

# Used For

* average salary
* average rating
* average order value
* average response time

---

# 4. MIN()

Smallest value.

---

# Query

```sql id="7m1q8x"
SELECT MIN(amount)
FROM orders;
```

---

# Result

```txt id="2x8m1v"
200
```

---

# 5. MAX()

Largest value.

---

# Query

```sql id="9m4x2q"
SELECT MAX(amount)
FROM orders;
```

---

# Result

```txt id="0x7m1v"
800
```

---

# Combining Multiple Aggregates

Very common.

---

# Query

```sql id="3x1m8q"
SELECT
    COUNT(*) AS total_orders,
    SUM(amount) AS total_revenue,
    AVG(amount) AS avg_order,
    MIN(amount) AS smallest_order,
    MAX(amount) AS biggest_order
FROM orders;
```

---

# Result

| total_orders | total_revenue | avg_order | smallest_order | biggest_order |
| ------------ | ------------- | --------- | -------------- | ------------- |
| 4            | 1800          | 450       | 200            | 800           |

---

# GROUP BY — Extremely Important

This is where aggregates become powerful.

---

# Problem

Without grouping:

```sql id="8x1m2q"
SELECT AVG(amount)
FROM orders;
```

gives one average for ALL rows.

But what if we want:

```txt id="9m2x1v"
average per customer
```

?

---

# GROUP BY Solves This

---

# Query

```sql id="5x8m1q"
SELECT
    customer_name,
    SUM(amount) AS total_spent
FROM orders
GROUP BY customer_name;
```

---

# Result

| customer_name | total_spent |
| ------------- | ----------- |
| Skyy          | 700         |
| Bruce         | 300         |
| Tony          | 800         |

---

# Mental Model

`GROUP BY` creates buckets/groups.

---

# Example

Before grouping:

```txt id="4m2x9q"
Skyy 500
Bruce 300
Tony 800
Skyy 200
```

---

# After grouping

```txt id="6x1m8v"
Skyy → [500, 200]
Bruce → [300]
Tony → [800]
```

Then aggregates apply inside each group.

---

# GROUP BY Rule

Very important SQL rule.

---

# Wrong Query

```sql id="8m1x4q"
SELECT customer_name, amount
FROM orders
GROUP BY customer_name;
```

Error occurs because:

* `amount` not aggregated
* not grouped

---

# Correct

```sql id="2x9m1q"
SELECT
    customer_name,
    SUM(amount)
FROM orders
GROUP BY customer_name;
```

---

# HAVING

Used to filter groups.

---

# Example

```sql id="7x2m1q"
SELECT
    customer_name,
    SUM(amount) AS total_spent
FROM orders
GROUP BY customer_name
HAVING SUM(amount) > 500;
```

---

# Result

| customer_name | total_spent |
| ------------- | ----------- |
| Skyy          | 700         |
| Tony          | 800         |

---

# Difference Between WHERE and HAVING

Huge concept.

---

# WHERE

Filters rows BEFORE grouping.

---

# HAVING

Filters groups AFTER grouping.

---

# Execution Order (Important)

SQL roughly processes:

```txt id="0m2x8v"
FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
LIMIT
```

Understanding this explains many SQL behaviors.

---

# DISTINCT with Aggregates

---

# Example

```sql id="3m8x1q"
SELECT COUNT(DISTINCT customer_name)
FROM orders;
```

---

# Result

```txt id="1x2m9v"
3
```

because:

* Skyy counted once

---

# NULL Behavior

Most aggregates ignore NULL.

---

# Example

| amount |
| ------ |
| 100    |
| NULL   |
| 200    |

---

# SUM()

returns:

```txt id="5x1m8v"
300
```

NULL ignored.

---

# AVG()

returns:

```txt id="2m9x1q"
150
```

NULL ignored.

---

# Real Backend Examples

---

# Ecommerce Dashboard

```sql id="8x2m1q"
SELECT SUM(amount)
FROM orders;
```

Total revenue.

---

# Social Media

```sql id="7m1x2q"
SELECT COUNT(*)
FROM posts;
```

Total posts.

---

# Analytics

```sql id="4x9m1q"
SELECT AVG(session_duration)
FROM analytics;
```

Average session time.

---

# Blog Platform

```sql id="9x1m2q"
SELECT
    user_id,
    COUNT(*) AS total_posts
FROM posts
GROUP BY user_id;
```

Posts per author.

---

# Aggregate + JOIN

Very common.

---

# Example

```sql id="1m8x2q"
SELECT
    users.name,
    COUNT(posts.id) AS total_posts
FROM users
LEFT JOIN posts
ON users.id = posts.user_id
GROUP BY users.name;
```

---

# Meaning

Count posts written by each user.

---

# Result

| name  | total_posts |
| ----- | ----------- |
| Skyy  | 5           |
| Bruce | 2           |

---

# Most Common Beginner Mistakes

---

# 1. Forgetting GROUP BY

Very common error.

---

# 2. Mixing Aggregated + Non-Aggregated Columns

Incorrect:

```sql id="6m2x1q"
SELECT name, COUNT(*)
FROM users;
```

Need:

```sql id="3x1m9q"
GROUP BY name
```

---

# 3. Using WHERE Instead of HAVING

Incorrect:

```sql id="0x8m1q"
WHERE COUNT(*) > 5
```

Correct:

```sql id="2x1m8q"
HAVING COUNT(*) > 5
```

---

# 4. Forgetting NULL Behavior

Aggregates usually ignore NULL values.

---

# Most Important Mental Model

Aggregate functions:

```txt id="5m2x1v"
convert many rows into summarized information
```

while:

```txt id="7x1m2v"
GROUP BY
```

lets us summarize:

* per category
* per user
* per product
* per status
* per day

This is the foundation of SQL analytics and reporting systems.

# `GROUP BY` in PostgreSQL — In Depth

`GROUP BY` is one of the most important SQL concepts.

It allows us to:

* organize rows into groups
* calculate summaries per group
* build reports
* generate analytics
* power dashboards

Without `GROUP BY`, aggregate functions only give us:

* one result for the entire table

With `GROUP BY`, we can calculate results:

* per user
* per category
* per product
* per day
* per status

This is fundamental in real backend systems.

---

# Core Idea

`GROUP BY` groups rows that share the same value.

Then aggregate functions operate:

* inside each group

---

# Example Table

Suppose we have:

| id | customer | amount | status  |
| -- | -------- | ------ | ------- |
| 1  | Skyy     | 500    | paid    |
| 2  | Bruce    | 300    | pending |
| 3  | Skyy     | 200    | paid    |
| 4  | Tony     | 800    | paid    |
| 5  | Bruce    | 150    | paid    |

---

# Without GROUP BY

If we run:

```sql id="3m1x8q"
SELECT SUM(amount)
FROM orders;
```

Result:

```txt id="7x2m1v"
1950
```

This summarizes:

* entire table

---

# Problem

What if we want:

```txt id="8m1x2v"
total amount per customer
```

?

That’s where `GROUP BY` comes in.

---

# Basic GROUP BY

```sql id="5x1m9q"
SELECT
    customer,
    SUM(amount) AS total_spent
FROM orders
GROUP BY customer;
```

---

# Result

| customer | total_spent |
| -------- | ----------- |
| Skyy     | 700         |
| Bruce    | 450         |
| Tony     | 800         |

---

# What Happened Internally?

---

# Original Rows

```txt id="1x2m8v"
Skyy  500
Bruce 300
Skyy  200
Tony  800
Bruce 150
```

---

# GROUP BY Creates Buckets

```txt id="2m1x9v"
Skyy  → [500, 200]
Bruce → [300, 150]
Tony  → [800]
```

Then:

```sql id="8x1m4q"
SUM(amount)
```

runs separately inside each group.

---

# Important Mental Model

`GROUP BY` does NOT summarize entire table anymore.

It summarizes:

* each group independently

---

# Syntax Structure

```sql id="4m1x8q"
SELECT
    grouped_column,
    aggregate_function()
FROM table
GROUP BY grouped_column;
```

---

# Another Example

---

# Count Orders Per Customer

```sql id="7x1m3q"
SELECT
    customer,
    COUNT(*) AS total_orders
FROM orders
GROUP BY customer;
```

---

# Result

| customer | total_orders |
| -------- | ------------ |
| Skyy     | 2            |
| Bruce    | 2            |
| Tony     | 1            |

---

# GROUP BY with Multiple Columns

Very common.

---

# Example

```sql id="6x2m1q"
SELECT
    customer,
    status,
    COUNT(*) AS total
FROM orders
GROUP BY customer, status;
```

---

# Result

| customer | status  | total |
| -------- | ------- | ----- |
| Skyy     | paid    | 2     |
| Bruce    | pending | 1     |
| Bruce    | paid    | 1     |
| Tony     | paid    | 1     |

---

# What Happened?

Now grouping uses BOTH columns.

So groups become:

```txt id="9x1m2v"
(Skyy, paid)
(Bruce, pending)
(Bruce, paid)
(Tony, paid)
```

Each unique combination creates a group.

---

# Important SQL Rule

This is one of the biggest beginner issues.

---

# Wrong Query

```sql id="1m8x4q"
SELECT customer, amount
FROM orders
GROUP BY customer;
```

---

# Why Error Happens

Because:

* `customer` grouped
* `amount` neither:

  * grouped
  * aggregated

PostgreSQL does not know:

* WHICH amount to show

---

# Correct Query

```sql id="5x2m8q"
SELECT
    customer,
    SUM(amount)
FROM orders
GROUP BY customer;
```

Now:

* `customer` grouped
* `amount` aggregated

Valid.

---

# Important GROUP BY Rule

Every selected column must be either:

| Allowed?   | Example       |
| ---------- | ------------- |
| grouped    | `customer`    |
| aggregated | `SUM(amount)` |

Otherwise SQL errors.

---

# Aggregate Functions Commonly Used with GROUP BY

| Function  | Purpose    |
| --------- | ---------- |
| `COUNT()` | count rows |
| `SUM()`   | total      |
| `AVG()`   | average    |
| `MIN()`   | smallest   |
| `MAX()`   | largest    |

---

# Example

```sql id="2x1m9q"
SELECT
    customer,
    COUNT(*) AS orders,
    SUM(amount) AS total,
    AVG(amount) AS average_order,
    MAX(amount) AS biggest_order
FROM orders
GROUP BY customer;
```

---

# HAVING — Filtering Groups

Very important concept.

---

# Problem

Suppose we only want customers whose spending exceeds 500.

We cannot use:

```sql id="8x2m1q"
WHERE SUM(amount) > 500
```

because:

* WHERE runs BEFORE grouping

---

# Correct Solution

```sql id="6m1x2q"
SELECT
    customer,
    SUM(amount) AS total_spent
FROM orders
GROUP BY customer
HAVING SUM(amount) > 500;
```

---

# Result

| customer | total_spent |
| -------- | ----------- |
| Skyy     | 700         |
| Tony     | 800         |

---

# Difference Between WHERE and HAVING

Huge interview/backend concept.

---

# WHERE

Filters:

* rows BEFORE grouping

---

# HAVING

Filters:

* groups AFTER grouping

---

# Visual Flow

```txt id="0x1m8v"
Rows
  ↓
WHERE
  ↓
GROUP BY
  ↓
HAVING
  ↓
Final Result
```

---

# Example Combining WHERE + GROUP BY + HAVING

```sql id="3m1x9q"
SELECT
    customer,
    SUM(amount) AS total_paid
FROM orders
WHERE status = 'paid'
GROUP BY customer
HAVING SUM(amount) > 300;
```

---

# Step-by-Step

---

# 1. WHERE

Keeps only:

```txt id="5x1m2v"
paid rows
```

---

# 2. GROUP BY

Groups remaining rows by customer.

---

# 3. SUM()

Calculates totals per customer.

---

# 4. HAVING

Filters grouped totals.

---

# GROUP BY + ORDER BY

Very common.

---

# Example

```sql id="7m1x8q"
SELECT
    customer,
    SUM(amount) AS total_spent
FROM orders
GROUP BY customer
ORDER BY total_spent DESC;
```

---

# Result

Highest spending customers first.

---

# GROUP BY + JOIN

Extremely common in backend systems.

---

# Example Tables

## users

| id | name  |
| -- | ----- |
| 1  | Skyy  |
| 2  | Bruce |

---

## posts

| id  | title  | user_id |
| --- | ------ | ------- |
| 101 | SQL    | 1       |
| 102 | Go     | 1       |
| 103 | Batman | 2       |

---

# Query

```sql id="2m8x1q"
SELECT
    users.name,
    COUNT(posts.id) AS total_posts
FROM users
LEFT JOIN posts
ON users.id = posts.user_id
GROUP BY users.name;
```

---

# Result

| name  | total_posts |
| ----- | ----------- |
| Skyy  | 2           |
| Bruce | 1           |

---

# Why LEFT JOIN Here?

Because we may want:

* users with zero posts too

INNER JOIN could hide them.

---

# NULL Behavior

Important.

---

# Example

| customer | amount |
| -------- | ------ |
| Skyy     | NULL   |
| Skyy     | 500    |

---

# Query

```sql id="8m2x1q"
SELECT
    customer,
    AVG(amount)
FROM orders
GROUP BY customer;
```

---

# Result

```txt id="1x9m4v"
500
```

NULL ignored by aggregates.

---

# GROUP BY Execution Order

SQL roughly processes:

```txt id="0m2x7v"
FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
LIMIT
```

Understanding this explains:

* why HAVING exists
* why aggregates fail in WHERE
* many SQL errors

---

# Real Backend Examples

---

# Ecommerce Dashboard

```sql id="4x1m8q"
SELECT
    product_id,
    SUM(quantity)
FROM order_items
GROUP BY product_id;
```

Total sales per product.

---

# Social Media

```sql id="6x1m2q"
SELECT
    user_id,
    COUNT(*)
FROM posts
GROUP BY user_id;
```

Posts per user.

---

# SaaS Analytics

```sql id="9m1x2q"
SELECT
    DATE(created_at),
    COUNT(*)
FROM signups
GROUP BY DATE(created_at);
```

Daily signups.

---

# Banking

```sql id="2x1m7q"
SELECT
    account_id,
    SUM(amount)
FROM transactions
GROUP BY account_id;
```

Account balances.

---

# Most Common Beginner Mistakes

---

# 1. Forgetting GROUP BY

Very common.

---

# 2. Selecting Non-Aggregated Columns

Incorrect:

```sql id="5x1m8v"
SELECT customer, amount
FROM orders
GROUP BY customer;
```

---

# 3. Using WHERE Instead of HAVING

Incorrect:

```sql id="8m1x2q"
WHERE COUNT(*) > 5
```

Correct:

```sql id="6x2m1v"
HAVING COUNT(*) > 5
```

---

# 4. Confusing GROUP BY with ORDER BY

Huge distinction.

---

# GROUP BY

Creates groups.

---

# ORDER BY

Sorts results.

Entirely different operations.

---

# Most Important Mental Model

`GROUP BY`:

```txt id="7m2x1v"
splits rows into groups
```

Then aggregate functions:

* summarize each group independently

This is the foundation of:

* SQL analytics
* reporting systems
* admin dashboards
* business intelligence
* backend metrics systems

# `HAVING` in PostgreSQL — In Depth

`HAVING` is used to filter groups AFTER `GROUP BY`.

This is one of the most important SQL concepts because beginners often confuse:

* `WHERE`
* `HAVING`

The difference is fundamental.

---

# Core Idea

---

# `WHERE`

Filters:

* individual rows

BEFORE grouping happens.

---

# `HAVING`

Filters:

* grouped results

AFTER grouping happens.

---

# Mental Model

Think of SQL execution like this:

```txt id="4m8x1v"
Rows
  ↓
WHERE
  ↓
GROUP BY
  ↓
HAVING
  ↓
SELECT
  ↓
ORDER BY
```

This order explains:

* why `HAVING` exists
* why aggregate functions fail inside `WHERE`

---

# Example Table

Suppose we have:

| id | customer | amount | status  |
| -- | -------- | ------ | ------- |
| 1  | Skyy     | 500    | paid    |
| 2  | Bruce    | 300    | pending |
| 3  | Skyy     | 200    | paid    |
| 4  | Tony     | 800    | paid    |
| 5  | Bruce    | 150    | paid    |

---

# Step 1 — GROUP BY Without HAVING

```sql id="2x1m9v"
SELECT
    customer,
    SUM(amount) AS total_spent
FROM orders
GROUP BY customer;
```

---

# Result

| customer | total_spent |
| -------- | ----------- |
| Skyy     | 700         |
| Bruce    | 450         |
| Tony     | 800         |

---

# Problem

Suppose we only want customers who spent more than:

```txt id="6m1x2v"
500
```

We need to filter GROUPS.

That’s what `HAVING` does.

---

# Basic HAVING Example

```sql id="8x1m4q"
SELECT
    customer,
    SUM(amount) AS total_spent
FROM orders
GROUP BY customer
HAVING SUM(amount) > 500;
```

---

# Result

| customer | total_spent |
| -------- | ----------- |
| Skyy     | 700         |
| Tony     | 800         |

Bruce excluded because:

```txt id="7x2m1v"
450 <= 500
```

---

# What Happened Internally?

---

# Original Rows

```txt id="0m1x8v"
Skyy  500
Bruce 300
Skyy  200
Tony  800
Bruce 150
```

---

# GROUP BY Creates Groups

```txt id="1x2m9v"
Skyy  → [500, 200]
Bruce → [300, 150]
Tony  → [800]
```

---

# Aggregates Run

```txt id="5m1x2v"
Skyy  → 700
Bruce → 450
Tony  → 800
```

---

# HAVING Filters Groups

```txt id="3x1m8v"
700 > 500 ✅
450 > 500 ❌
800 > 500 ✅
```

Final result:

* Skyy
* Tony

---

# Biggest Beginner Mistake

Trying to use aggregates in `WHERE`.

---

# WRONG

```sql id="9x1m2v"
SELECT
    customer,
    SUM(amount)
FROM orders
WHERE SUM(amount) > 500
GROUP BY customer;
```

---

# Why Wrong?

Because:

* `WHERE` runs BEFORE grouping
* `SUM(amount)` does not exist yet

At WHERE stage:

* PostgreSQL still sees raw rows

not grouped totals.

---

# Correct

```sql id="7m1x8q"
SELECT
    customer,
    SUM(amount)
FROM orders
GROUP BY customer
HAVING SUM(amount) > 500;
```

---

# Key Difference

| Clause   | Filters |
| -------- | ------- |
| `WHERE`  | rows    |
| `HAVING` | groups  |

---

# WHERE vs HAVING Visually

---

# WHERE Example

```sql id="2m1x9q"
SELECT *
FROM orders
WHERE amount > 300;
```

Filters INDIVIDUAL rows.

---

# Result

| customer | amount |
| -------- | ------ |
| Skyy     | 500    |
| Tony     | 800    |

---

# HAVING Example

```sql id="4x1m8q"
SELECT
    customer,
    SUM(amount)
FROM orders
GROUP BY customer
HAVING SUM(amount) > 300;
```

Filters GROUPS.

---

# Result

| customer | total |
| -------- | ----- |
| Skyy     | 700   |
| Bruce    | 450   |
| Tony     | 800   |

Huge conceptual difference.

---

# HAVING Without GROUP BY

Possible, though less common.

---

# Example

```sql id="8m2x1q"
SELECT COUNT(*)
FROM orders
HAVING COUNT(*) > 3;
```

---

# Meaning

Return result only if:

* total row count exceeds 3

---

# HAVING with Multiple Conditions

```sql id="1x9m2q"
SELECT
    customer,
    COUNT(*) AS total_orders,
    SUM(amount) AS total_spent
FROM orders
GROUP BY customer
HAVING
    COUNT(*) >= 2
    AND SUM(amount) > 400;
```

---

# Result

| customer | total_orders | total_spent |
| -------- | ------------ | ----------- |
| Skyy     | 2            | 700         |
| Bruce    | 2            | 450         |

---

# HAVING + AVG()

Very common.

---

# Example

```sql id="5x2m1q"
SELECT
    customer,
    AVG(amount) AS avg_order
FROM orders
GROUP BY customer
HAVING AVG(amount) > 300;
```

---

# Result

| customer | avg_order |
| -------- | --------- |
| Skyy     | 350       |
| Tony     | 800       |

---

# HAVING + JOIN

Extremely common in backend systems.

---

# Example Tables

## users

| id | name  |
| -- | ----- |
| 1  | Skyy  |
| 2  | Bruce |
| 3  | Tony  |

---

## posts

| id  | title  | user_id |
| --- | ------ | ------- |
| 101 | SQL    | 1       |
| 102 | Go     | 1       |
| 103 | Batman | 2       |

---

# Query

```sql id="3m8x1q"
SELECT
    users.name,
    COUNT(posts.id) AS total_posts
FROM users
LEFT JOIN posts
ON users.id = posts.user_id
GROUP BY users.name
HAVING COUNT(posts.id) >= 2;
```

---

# Result

| name | total_posts |
| ---- | ----------- |
| Skyy | 2           |

---

# Meaning

Find users with:

* at least 2 posts

This is a very real production query.

---

# HAVING + ORDER BY

Very common.

---

# Example

```sql id="6x1m9q"
SELECT
    customer,
    SUM(amount) AS total_spent
FROM orders
GROUP BY customer
HAVING SUM(amount) > 300
ORDER BY total_spent DESC;
```

---

# Execution Flow

```txt id="8x1m2v"
1. FROM
2. GROUP BY
3. SUM()
4. HAVING
5. ORDER BY
```

---

# HAVING + DISTINCT

Example:

```sql id="4m1x8v"
SELECT
    customer,
    COUNT(DISTINCT status)
FROM orders
GROUP BY customer
HAVING COUNT(DISTINCT status) > 1;
```

---

# Meaning

Find customers having:

* multiple different statuses

---

# Real Backend Examples

---

# Ecommerce

```sql id="7x1m2q"
SELECT
    customer_id,
    SUM(amount)
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 10000;
```

VIP customers.

---

# Social Media

```sql id="2x1m8q"
SELECT
    user_id,
    COUNT(*)
FROM posts
GROUP BY user_id
HAVING COUNT(*) > 100;
```

Highly active users.

---

# Analytics

```sql id="9m1x2q"
SELECT
    DATE(created_at),
    COUNT(*)
FROM signups
GROUP BY DATE(created_at)
HAVING COUNT(*) > 500;
```

High signup days.

---

# SaaS Billing

```sql id="5m2x1q"
SELECT
    company_id,
    SUM(invoice_total)
FROM invoices
GROUP BY company_id
HAVING SUM(invoice_total) > 50000;
```

Large customers.

---

# Common Beginner Mistakes

---

# 1. Using WHERE Instead of HAVING

Most common mistake.

---

# WRONG

```sql id="1x8m2q"
WHERE COUNT(*) > 5
```

---

# Correct

```sql id="8m1x2q"
HAVING COUNT(*) > 5
```

---

# 2. Forgetting GROUP BY

Incorrect:

```sql id="4x1m9q"
SELECT customer, SUM(amount)
FROM orders
HAVING SUM(amount) > 500;
```

Need:

```sql id="7m2x1q"
GROUP BY customer
```

---

# 3. Confusing Row Filtering vs Group Filtering

Huge conceptual distinction.

---

# WHERE

Filters:

* rows

---

# HAVING

Filters:

* grouped summaries

---

# Most Important Mental Model

`HAVING` is basically:

```txt id="0x2m1v"
WHERE for grouped data
```

But specifically:

* AFTER aggregation
* AFTER grouping

That’s why aggregate functions work inside:

* `HAVING`

but not inside:

* `WHERE`

# Indexes in PostgreSQL — In Depth

Indexes are one of the most important performance concepts in PostgreSQL.

Without indexes:

* queries become slow
* searches scan entire tables
* joins become expensive
* sorting becomes slower

Indexes help PostgreSQL:

* find data faster

They work similarly to:

* an index in a book

---

# Real-World Analogy

Suppose we have a 1000-page book.

Without an index:

* we scan page-by-page

With an index:

* we jump directly to the correct page

Database indexes work similarly.

---

# Core Problem

Suppose we have:

```sql id="7x1m2q"
SELECT *
FROM users
WHERE email = 'skyy@gmail.com';
```

Without an index:

* PostgreSQL scans EVERY row

This is called:

# Sequential Scan

---

# Sequential Scan

PostgreSQL checks:

```txt id="1x9m2v"
row 1
row 2
row 3
...
row 1,000,000
```

until it finds a match.

Very slow on large tables.

---

# Index Solves This

An index creates a special optimized data structure.

Then PostgreSQL can:

* jump directly to matching rows

instead of scanning entire table.

---

# What an Index Actually Is

An index is a separate data structure stored by PostgreSQL.

Usually based on:

# B-Tree

(default index type)

---

# Simplified Mental Model

Suppose table:

| id | email                             |
| -- | --------------------------------- |
| 1  | [a@gmail.com](mailto:a@gmail.com) |
| 2  | [b@gmail.com](mailto:b@gmail.com) |
| 3  | [c@gmail.com](mailto:c@gmail.com) |

An index on `email` might internally organize:

```txt id="4m1x8v"
a@gmail.com → row pointer
b@gmail.com → row pointer
c@gmail.com → row pointer
```

sorted efficiently.

PostgreSQL can search this structure very quickly.

---

# Creating an Index

---

# Basic Syntax

```sql id="2x1m9q"
CREATE INDEX index_name
ON table_name(column_name);
```

---

# Example

```sql id="5m2x1q"
CREATE INDEX idx_users_email
ON users(email);
```

---

# Meaning

Create index:

* named `idx_users_email`
* on `users.email`

Now queries filtering by email become much faster.

---

# Why Naming Matters

Convention:

```txt id="7m1x2v"
idx_<table>_<column>
```

Example:

```txt id="1x8m2v"
idx_posts_user_id
idx_orders_created_at
```

Keeps schema readable.

---

# Most Commonly Indexed Columns

| Column Type      | Why               |
| ---------------- | ----------------- |
| Primary keys     | heavily searched  |
| Foreign keys     | joins             |
| Emails/usernames | lookups           |
| created_at       | sorting/filtering |
| status           | filtering         |
| category_id      | relationships     |

---

# Primary Keys Automatically Create Indexes

Example:

```sql id="8x1m2q"
id SERIAL PRIMARY KEY
```

automatically creates:

* unique index

No need to manually create one.

---

# UNIQUE Also Creates Index

Example:

```sql id="4x1m9q"
email TEXT UNIQUE
```

automatically creates:

* unique index

because uniqueness must be enforced efficiently.

---

# How Indexes Improve WHERE

---

# Without Index

```sql id="6m1x2q"
SELECT *
FROM users
WHERE email='skyy@gmail.com';
```

PostgreSQL:

* scans entire table

---

# With Index

PostgreSQL:

* jumps directly to matching row

Massive speed difference.

---

# Indexes and JOINs

Extremely important.

---

# Example

```sql id="9m1x2q"
SELECT *
FROM posts
INNER JOIN users
ON posts.user_id = users.id;
```

---

# Important Indexed Columns

```txt id="2x1m8v"
users.id
posts.user_id
```

Why?

Because joins constantly compare them.

Without indexes:

* joins become expensive on large datasets

---

# Indexes and ORDER BY

Indexes can help sorting too.

---

# Example

```sql id="3m8x1q"
SELECT *
FROM posts
ORDER BY created_at DESC;
```

If indexed:

```sql id="5x1m2q"
CREATE INDEX idx_posts_created_at
ON posts(created_at);
```

sorting becomes faster.

---

# Indexes and Range Queries

---

# Example

```sql id="7x2m1q"
SELECT *
FROM orders
WHERE amount > 500;
```

Indexes help:

* range filtering
* comparisons
* BETWEEN queries

---

# B-Tree Index

Default PostgreSQL index type.

---

# Syntax

```sql id="1x2m9q"
CREATE INDEX idx_name
ON table(column);
```

implicitly creates:

* B-tree index

---

# Best For

| Operation  | Supported |
| ---------- | --------- |
| `=`        | yes       |
| `<` `>`    | yes       |
| `BETWEEN`  | yes       |
| `ORDER BY` | yes       |

Most common/general-purpose index.

---

# Composite Indexes (Multi-Column)

Very important.

---

# Example

```sql id="8m1x2q"
CREATE INDEX idx_orders_customer_status
ON orders(customer_id, status);
```

---

# Meaning

Index stores BOTH columns together.

Useful for queries like:

```sql id="4m1x8q"
SELECT *
FROM orders
WHERE customer_id = 1
AND status = 'paid';
```

---

# Column Order Matters

Huge concept.

---

# Example Index

```sql id="6x1m2q"
(customer_id, status)
```

works well for:

```sql id="9x1m2v"
WHERE customer_id = ?
```

and:

```sql id="0x2m1v"
WHERE customer_id = ?
AND status = ?
```

BUT NOT great for:

```sql id="5m1x2v"
WHERE status = ?
```

because leftmost column matters.

---

# Unique Index

Enforces uniqueness.

---

# Example

```sql id="2m8x1q"
CREATE UNIQUE INDEX idx_users_email
ON users(email);
```

Now duplicate emails impossible.

---

# Partial Indexes

Very powerful PostgreSQL feature.

---

# Example

```sql id="1m9x2q"
CREATE INDEX idx_active_users
ON users(email)
WHERE is_active = true;
```

---

# Meaning

Index only stores:

* active users

Smaller + faster.

---

# Useful When

Most queries target:

* subset of rows

---

# Expression Indexes

Indexes based on expressions.

---

# Example

```sql id="3x1m8q"
CREATE INDEX idx_lower_email
ON users(LOWER(email));
```

Useful for:

```sql id="8x1m2q"
SELECT *
FROM users
WHERE LOWER(email)='skyy@gmail.com';
```

---

# Without expression index:

* PostgreSQL may ignore normal email index

---

# Hash Index

Optimized mainly for:

```txt id="1x2m8v"
=
```

comparisons.

Less common than B-tree.

---

# GIN Index

Very important PostgreSQL feature.

Used heavily for:

* JSONB
* arrays
* full-text search

---

# Example

```sql id="5x2m1q"
CREATE INDEX idx_metadata
ON app_events
USING GIN(metadata);
```

Useful for JSONB queries.

---

# Example Query

```sql id="7m1x2q"
SELECT *
FROM app_events
WHERE metadata ? 'browser';
```

GIN makes this much faster.

---

# BRIN Index

Used for:

* huge tables
* sequentially ordered data

Very storage-efficient.

Common for:

* logs
* analytics
* time-series data

---

# Viewing Indexes

---

# Query

```sql id="9m2x1q"
\d table_name
```

Shows:

* indexes
* constraints
* schema info

---

# Dropping Indexes

---

# Syntax

```sql id="4x1m8q"
DROP INDEX idx_users_email;
```

---

# EXPLAIN — Seeing Query Plans

Extremely important.

---

# Example

```sql id="2x1m9q"
EXPLAIN
SELECT *
FROM users
WHERE email='skyy@gmail.com';
```

---

# Without Index

We may see:

```txt id="6m1x2v"
Seq Scan
```

---

# With Index

We may see:

```txt id="1x9m2v"
Index Scan
```

Meaning PostgreSQL used index.

---

# Indexes Are NOT Free

Very important.

Indexes improve reads BUT hurt writes.

---

# Why?

Every:

* INSERT
* UPDATE
* DELETE

must also update indexes.

---

# Tradeoff

| Operation | Effect |
| --------- | ------ |
| SELECT    | faster |
| INSERT    | slower |
| UPDATE    | slower |
| DELETE    | slower |

Too many indexes hurt performance.

---

# Storage Cost

Indexes consume disk space.

Large tables:

* large indexes

---

# When NOT to Index

---

# Small Tables

Sequential scan may actually be faster.

---

# Low Selectivity Columns

Example:

```txt id="4m1x2v"
is_active = true/false
```

Only 2 values.

Index may not help much.

---

# Frequently Updated Columns

Can cause heavy maintenance cost.

---

# Real Backend Examples

---

# User Login

```sql id="8x1m2q"
WHERE email = ?
```

Index email.

---

# Social Media Feed

```sql id="5m2x1q"
ORDER BY created_at DESC
```

Index created_at.

---

# Ecommerce

```sql id="9x1m2q"
WHERE category_id = ?
```

Index foreign keys.

---

# Analytics

```sql id="3x1m8v"
WHERE created_at BETWEEN ...
```

Index timestamps.

---

# Most Common Beginner Mistakes

---

# 1. Indexing Everything

Bad idea.

Too many indexes:

* slow writes
* waste storage

---

# 2. Forgetting Foreign Key Indexes

Huge performance issue in joins.

---

# 3. Ignoring Composite Index Order

Order matters greatly.

---

# 4. Assuming Index Always Used

PostgreSQL query planner decides.

Sometimes sequential scan faster.

---

# 5. Not Using EXPLAIN

Essential performance tool.

---

# Most Important Mental Model

Indexes are basically:

```txt id="7m1x2v"
optimized lookup structures
```

that help PostgreSQL:

* avoid scanning entire tables

They are critical for:

* scalable applications
* fast queries
* efficient joins
* analytics systems
* production databases
