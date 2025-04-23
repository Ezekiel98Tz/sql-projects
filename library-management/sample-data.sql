-- Insert sample data into 'books' table
INSERT INTO books (title, author, published_year, genre, available_copies)
VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Fiction', 5),
('1984', 'George Orwell', 1949, 'Dystopian', 3),
('To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction', 4),
('Pride and Prejudice', 'Jane Austen', 1813, 'Romance', 2),
('Moby-Dick', 'Herman Melville', 1851, 'Adventure', 1);

-- Insert sample data into 'members' table
INSERT INTO members (first_name, last_name, email, phone)
VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210'),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-555-5555');

-- Insert sample data into 'borrow_logs' table
INSERT INTO borrow_logs (book_id, member_id, borrow_date, return_date)
VALUES
(1, 1, '2025-04-01', '2025-04-15'),
(2, 2, '2025-04-05', '2025-04-20'),
(3, 3, '2025-04-10', '2025-04-25');
