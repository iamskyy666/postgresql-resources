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

