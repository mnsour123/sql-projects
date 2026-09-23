# Library Management System — SQL Project

A small, self-contained SQL project simulating a library: authors, books,
members, and loan (borrowing) records. It's designed as a compact example
of relational schema design, foreign keys, and common query patterns
(joins, aggregates, subqueries).

## Structure

```
library-sql-project/
├── 01_schema.sql       -- table definitions, keys, indexes
├── 02_seed_data.sql    -- sample rows to populate the database
├── 03_queries.sql      -- 10 example queries demonstrating common patterns
└── README.md
```

## Schema overview

| Table     | Description                                      |
|-----------|---------------------------------------------------|
| `authors` | One row per author                                 |
| `books`   | One row per title; references `authors`            |
| `members` | Library patrons                                    |
| `loans`   | Borrow records; references `books` and `members`, `return_date` is NULL while a book is still checked out |

**Relationships:**
- `authors (1) → (many) books`
- `books (1) → (many) loans`
- `members (1) → (many) loans`

## Getting started

This project uses plain SQL and works with SQLite out of the box (minor
tweaks needed for PostgreSQL/MySQL — see notes in `01_schema.sql`).

**Using the SQLite CLI:**
```bash
sqlite3 library.db < 01_schema.sql
sqlite3 library.db < 02_seed_data.sql
sqlite3 -header -column library.db < 03_queries.sql
```

**Using Python:**
```python
import sqlite3
conn = sqlite3.connect("library.db")
conn.executescript(open("01_schema.sql").read())
conn.executescript(open("02_seed_data.sql").read())
conn.commit()
```

## Example queries included

1. List every book with its author
2. Books currently checked out
3. Overdue books
4. Loan count per member
5. Most popular genres by loan count
6. Authors with zero available copies
7. Average days a book stays checked out
8. Members currently holding an overdue book (subquery)
9. Loan history for a specific book
10. Example `UPDATE` statements for returning a book

## Ideas to extend this project

- Add a `fines` table that calculates late fees based on overdue days
- Add a `reservations` table so members can queue for a checked-out book
- Add a view (`CREATE VIEW`) for "currently overdue" instead of repeating the WHERE clause
- Add `CHECK` constraints (e.g. `copies_available <= copies_total`)
- Write a trigger that decrements `copies_available` automatically on loan insert
