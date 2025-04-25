SELECT * FROM books;

SELECT * FROM books
WHERE available_copies > 0;

SELECT * FROM members;

//Show currently borrowed books (not yet returned)

SELECT b.title, m.first_name, m.last_name, bl.borrow_date
FROM borrow_logs bl
JOIN books b ON bl.book_id = b.book_id
JOIN members m ON bl.member_id = m.member_id
WHERE bl.return_date IS NULL;

//Count total borrowed books per member

SELECT m.first_name, m.last_name, COUNT(*) AS books_borrowed
FROM borrow_logs bl
JOIN members m ON bl.member_id = m.member_id
GROUP BY bl.member_id;

//Find overdue books (borrowed more than 14 days ago and not returned)

SELECT b.title, m.first_name, m.last_name, bl.borrow_date
FROM borrow_logs bl
JOIN books b ON bl.book_id = b.book_id
JOIN members m ON bl.member_id = m.member_id
WHERE bl.return_date IS NULL
  AND bl.borrow_date < CURDATE() - INTERVAL 14 DAY;
