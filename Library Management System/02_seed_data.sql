-- =========================================================
-- Library Management System — Sample Data
-- =========================================================

INSERT INTO authors (first_name, last_name, birth_year, country) VALUES
('George', 'Orwell', 1903, 'UK'),
('Jane', 'Austen', 1775, 'UK'),
('Haruki', 'Murakami', 1949, 'Japan'),
('Chimamanda', 'Ngozi Adichie', 1977, 'Nigeria'),
('Gabriel', 'García Márquez', 1927, 'Colombia');

INSERT INTO members (full_name, email, joined_date) VALUES
('Alice Johnson', 'alice@example.com', '2023-01-15'),
('Bob Smith', 'bob@example.com', '2023-03-22'),
('Carla Diaz', 'carla@example.com', '2023-06-10'),
('David Chen', 'david@example.com', '2024-01-05'),
('Emma Wilson', 'emma@example.com', '2024-02-18');

INSERT INTO books (title, author_id, genre, published_year, copies_total, copies_available) VALUES
('1984', 1, 'Dystopian', 1949, 3, 1),
('Animal Farm', 1, 'Satire', 1945, 2, 2),
('Pride and Prejudice', 2, 'Romance', 1813, 2, 0),
('Norwegian Wood', 3, 'Literary Fiction', 1987, 2, 1),
('Kafka on the Shore', 3, 'Literary Fiction', 2002, 2, 2),
('Half of a Yellow Sun', 4, 'Historical Fiction', 2006, 1, 0),
('One Hundred Years of Solitude', 5, 'Magical Realism', 1967, 2, 1);

-- Loans: mix of returned, overdue, and currently-out records
INSERT INTO loans (book_id, member_id, loan_date, due_date, return_date) VALUES
(1, 1, '2024-05-01', '2024-05-15', '2024-05-14'),
(1, 2, '2024-06-01', '2024-06-15', NULL),          -- currently out
(3, 3, '2024-04-10', '2024-04-24', NULL),          -- overdue, not returned
(3, 4, '2024-01-05', '2024-01-19', '2024-01-25'),  -- returned late
(4, 5, '2024-07-01', '2024-07-15', NULL),          -- currently out
(6, 1, '2024-03-01', '2024-03-15', NULL),          -- overdue, not returned
(7, 2, '2024-02-01', '2024-02-15', '2024-02-10'),
(5, 3, '2024-05-20', '2024-06-03', '2024-06-01'),
(2, 4, '2024-06-10', '2024-06-24', '2024-06-20');
