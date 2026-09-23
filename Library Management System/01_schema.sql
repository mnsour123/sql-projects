-- =========================================================
-- Library Management System — Schema
-- Works with SQLite, PostgreSQL, and MySQL (minor tweaks
-- for AUTOINCREMENT/SERIAL are noted inline).
-- =========================================================

DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS members;

-- Authors ------------------------------------------------
CREATE TABLE authors (
    author_id     INTEGER PRIMARY KEY AUTOINCREMENT, -- Postgres: SERIAL / GENERATED ALWAYS AS IDENTITY
    first_name    TEXT NOT NULL,
    last_name     TEXT NOT NULL,
    birth_year    INTEGER,
    country       TEXT
);

-- Members (library patrons) -------------------------------
CREATE TABLE members (
    member_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name     TEXT NOT NULL,
    email         TEXT UNIQUE NOT NULL,
    joined_date   DATE NOT NULL
);

-- Books ----------------------------------------------------
CREATE TABLE books (
    book_id       INTEGER PRIMARY KEY AUTOINCREMENT,
    title         TEXT NOT NULL,
    author_id     INTEGER NOT NULL,
    genre         TEXT,
    published_year INTEGER,
    copies_total  INTEGER NOT NULL DEFAULT 1,
    copies_available INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Loans (borrow records) ------------------------------------
CREATE TABLE loans (
    loan_id       INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id       INTEGER NOT NULL,
    member_id     INTEGER NOT NULL,
    loan_date     DATE NOT NULL,
    due_date      DATE NOT NULL,
    return_date   DATE,                     -- NULL = still checked out
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Helpful indexes --------------------------------------------
CREATE INDEX idx_books_author ON books(author_id);
CREATE INDEX idx_loans_book ON loans(book_id);
CREATE INDEX idx_loans_member ON loans(member_id);
CREATE INDEX idx_loans_return_date ON loans(return_date);
