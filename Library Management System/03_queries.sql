-- =========================================================
-- Library Management System — Example Queries
-- =========================================================

-- 1. List every book with its author's full name
SELECT b.title, a.first_name || ' ' || a.last_name AS author, b.genre
FROM books b
JOIN authors a ON b.author_id = a.author_id
ORDER BY b.title;

-- 2. Books currently checked out (no return date yet)
SELECT b.title, m.full_name AS borrower, l.loan_date, l.due_date
FROM loans l
JOIN books b ON l.book_id = b.book_id
JOIN members m ON l.member_id = m.member_id
WHERE l.return_date IS NULL;

-- 3. Overdue books (still out, past due date)
SELECT b.title, m.full_name AS borrower, l.due_date,
       DATE('now') AS today
FROM loans l
JOIN books b ON l.book_id = b.book_id
JOIN members m ON l.member_id = m.member_id
WHERE l.return_date IS NULL
  AND l.due_date < DATE('now');

-- 4. Number of books borrowed per member (most active readers first)
SELECT m.full_name, COUNT(l.loan_id) AS total_loans
FROM members m
LEFT JOIN loans l ON m.member_id = l.member_id
GROUP BY m.member_id, m.full_name
ORDER BY total_loans DESC;

-- 5. Most popular genres by number of loans
SELECT b.genre, COUNT(l.loan_id) AS times_borrowed
FROM loans l
JOIN books b ON l.book_id = b.book_id
GROUP BY b.genre
ORDER BY times_borrowed DESC;

-- 6. Authors who have no books currently available (all copies checked out)
SELECT a.first_name || ' ' || a.last_name AS author, b.title, b.copies_available
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE b.copies_available = 0;

-- 7. Average days a book stays checked out (for returned loans only)
SELECT ROUND(AVG(JULIANDAY(return_date) - JULIANDAY(loan_date)), 1) AS avg_days_checked_out
FROM loans
WHERE return_date IS NOT NULL;

-- 8. Members who currently have an overdue book (using a subquery)
SELECT full_name, email
FROM members
WHERE member_id IN (
    SELECT member_id
    FROM loans
    WHERE return_date IS NULL
      AND due_date < DATE('now')
);

-- 9. Loan history for a specific book, most recent first
SELECT m.full_name AS borrower, l.loan_date, l.due_date, l.return_date
FROM loans l
JOIN members m ON l.member_id = m.member_id
JOIN books b ON l.book_id = b.book_id
WHERE b.title = '1984'
ORDER BY l.loan_date DESC;

-- 10. Simple "return a book" update — frees up a copy
-- UPDATE loans SET return_date = DATE('now') WHERE loan_id = 2;
-- UPDATE books SET copies_available = copies_available + 1 WHERE book_id = 1;
