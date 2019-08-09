USE db_library
CREATE TABLE tbl_library_branch (
	BranchID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
)

CREATE TABLE tbl_publisher (
	PublisherName VARCHAR(50) NOT NULL PRIMARY KEY,
	Address VARCHAR(50),
	Phone VARCHAR(15)
)

CREATE TABLE tbl_books (
	BookID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES tbl_publisher(PublisherName)
)

CREATE TABLE tbl_book_copies (
	BookID INT FOREIGN KEY REFERENCES tbl_books(BookID),
	BranchID INT FOREIGN KEY REFERENCES tbl_library_branch(BranchID),
	Number_Of_Copies INT
)

CREATE TABLE tbl_borrower (
	CardNo INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50),
	Phone VARCHAR(50)
)

CREATE TABLE tbl_book_authors (
	BookID INT FOREIGN KEY REFERENCES tbl_books(BookID),
	AuthorName VARCHAR(50)
)

CREATE TABLE tbl_book_loans (
	BookID INT FOREIGN KEY REFERENCES tbl_books(BookID),
	BranchID INT FOREIGN KEY REFERENCES tbl_library_branch(BranchID),
	CardNo INT FOREIGN KEY REFERENCES tbl_borrower(CardNo),
	DateOut DATE,
	DateDue DATE
)

INSERT INTO tbl_library_branch (
	BranchName, Address
	)
	VALUES 
	('Sharpstown','222 Random St'),
	('Central','24 Central Ave'),
	('Austin','301 Brazos St'),
	('Elmo''s','123 Sesame St')

INSERT INTO tbl_publisher (
	PublisherName, Address, Phone)
	VALUES
	('Ratchet', '512 Wall St','555-555-5555'),
	('LarperCalling', '55 Baker Lane', '555-867-5309'),
	('Penguin Specific House', '21 Jump St', '800-555-0420')

INSERT INTO tbl_books (
	Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Ratchet'),  --John Malkovich
	('Misery', 'Penguin Specific House'),  --Stephen King
	('It', 'Penguin Specific House'),
	('The Old Man and the Sea', 'LarperCalling'), --Ernest Hemingway
	('A Farewell to Arms', 'LarperCalling'),
	('Childhood''s End', 'Ratchet'), -- Arthur C Clarke
	('2001', 'Ratchet'),
	('Jurassic Park', 'Penguin Specific House'), --Michael Crichton
	('The Lost World', 'Penguin Specific House'),
	('I, Robot', 'LarperCalling'), --Isaac Asimov
	('The Bicentennial Man', 'LarperCalling'),
	('To Kill a Mockingbird', 'Ratchet'), --Harper Lee
	('In Cold Blood', 'Ratchet'),
	('Adventures of Huckleberry Finn', 'Penguin Specific House'), --Mark Twain
	('The Adventures of Tom Sawyer', 'Penguin Specific House'),
	('War and Peace', 'LarperCalling'), --Leo Tolstoy
	('Childhood', 'LarperCalling'),
	('Great Expectations', 'Ratchet'), --Charles Dickens
	('A Christmas Carol', 'Ratchet'),
	('Oliver Twist', 'Ratchet')
	
INSERT INTO tbl_borrower 
	(Name, Address, Phone)
	VALUES
	('John Smith', '123 Sesame St', '555-555-5555'),
	('Joe Dirte', '124 Sesame St', '555-555-5555'),
	('April Oneil', '125 Sesame St', '555-555-5555'),
	('Katniss Everdeen', '126 Sesame St', '555-555-5555'),
	('Dwight Schrute', '127 Sesame St', '555-555-5555'),
	('Billy Bob Thornton', '128 Sesame St', '555-555-5555'),
	('Elizabeth Olsen', '129 Sesame St', '555-555-5555'),
	('Brad Pitt', '130 Sesame St', '555-555-5555')

INSERT INTO tbl_book_authors 
	(BookID, AuthorName)
	VALUES
	(2, 'Stephen King'),
	(3, 'Stephen King'),
	(4, 'Ernest Hemingway'),
	(5, 'Ernest Hemingway'),
	(6, 'Arthur C Clarke'),
	(7, 'Arthur C Clarke'),
	(8, 'Michael Crichton'),
	(9, 'Michael Crichton'),
	(10, 'Isaac Asimov'),
	(11, 'Isaac Asimov'),
	(12, 'Harper Lee'),
	(13, 'Harper Lee'),
	(14, 'Mark Twain'),
	(15, 'Mark Twain'),
	(16, 'Leo Tolstoy'),
	(17, 'Leo Tolstoy'),
	(18, 'Charles Dickens'),
	(19, 'Charles Dickens'),
	(20, 'Charles Dickens')

INSERT INTO tbl_book_copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(1, 1, 3), --Sharpstown
	(2, 1, 3),
	(3, 1, 3),
	(4, 1, 3),
	(5, 1, 3),
	(6, 1, 3),
	(7, 1, 3),
	(8, 1, 3),
	(9, 1, 3),
	(10, 1, 3),
	(1, 2, 3), --Central
	(2, 2, 3),
	(3, 2, 3),
	(4, 2, 3),
	(5, 2, 3),
	(6, 2, 3),
	(7, 2, 3),
	(8, 2, 3),
	(9, 2, 3),
	(10, 2, 3),
	(11, 3, 3), --Austin
	(12, 3, 3),
	(13, 3, 3),
	(14, 3, 3),
	(15, 3, 3),
	(16, 3, 3),
	(17, 3, 3),
	(18, 3, 3),
	(19, 3, 3),
	(20, 3, 3),
	(11, 4, 3), --Elmo's
	(12, 4, 3),
	(13, 4, 3),
	(14, 4, 3),
	(15, 4, 3),
	(16, 4, 3),
	(17, 4, 3),
	(18, 4, 3),
	(19, 4, 3),
	(20, 4, 3)

	INSERT INTO tbl_book_loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES 
	(1, 1, 1, '2019-08-09', '2019-09-09'), --John Smith
	(2, 1, 1, '2019-08-09', '2019-09-09'),
	(3, 1, 1, '2019-08-09', '2019-09-09'),
	(4, 1, 1, '2019-08-09', '2019-09-09'),
	(5, 1, 1, '2019-08-09', '2019-09-09'),
	(6, 1, 1, '2019-08-09', '2019-09-09'),
	(7, 1, 1, '2019-08-09', '2019-09-09'),
	(8, 1, 1, '2019-08-09', '2019-09-09'),
	(9, 1, 1, '2019-08-09', '2019-09-09'),
	(10, 1, 1, '2019-08-09', '2019-09-09'),
	(1, 2, 2, '2019-08-09', '2019-09-09'), --Joe Dirte
	(2, 2, 2, '2019-08-09', '2019-09-09'),
	(3, 2, 2, '2019-08-09', '2019-09-09'),
	(4, 2, 2, '2019-08-09', '2019-09-09'),
	(5, 2, 2, '2019-08-09', '2019-09-09'),
	(6, 2, 2, '2019-08-09', '2019-09-09'),
	(7, 2, 2, '2019-08-09', '2019-09-09'),
	(8, 2, 2, '2019-08-09', '2019-09-09'),
	(9, 2, 2, '2019-08-09', '2019-09-09'),
	(10, 2, 2, '2019-08-09', '2019-09-09'),
	(1, 2, 5, '2019-08-09', '2019-09-09'), --Dwight Schrute
	(2, 2, 5, '2019-08-09', '2019-09-09'),
	(3, 2, 5, '2019-08-09', '2019-09-09'),
	(4, 2, 5, '2019-08-09', '2019-09-09'),
	(5, 2, 5, '2019-08-09', '2019-09-09'),
	(6, 2, 5, '2019-08-09', '2019-09-09'),
	(7, 2, 5, '2019-08-09', '2019-09-09'),
	(8, 2, 5, '2019-08-09', '2019-09-09'),
	(9, 2, 5, '2019-08-09', '2019-09-09'),
	(10, 2, 5, '2019-08-09', '2019-09-09'),
	(11, 4, 7, '2019-08-09', '2019-09-09'), --Elizabeth Olsen
	(12, 4, 7, '2019-08-09', '2019-09-09'),
	(13, 4, 7, '2019-08-09', '2019-09-09'),
	(14, 4, 7, '2019-08-09', '2019-09-09'),
	(15, 4, 7, '2019-08-09', '2019-09-09'),
	(16, 4, 7, '2019-08-09', '2019-09-09'),
	(17, 4, 7, '2019-08-09', '2019-09-09'),
	(18, 4, 7, '2019-08-09', '2019-09-09'),
	(19, 4, 7, '2019-08-09', '2019-09-09'),
	(20, 4, 7, '2019-08-09', '2019-09-09'),
	(11, 3, 8, '2019-08-09', '2019-09-09'), --Brad Pitt
	(12, 3, 8, '2019-08-09', '2019-09-09'),
	(13, 3, 8, '2019-08-09', '2019-09-09'),
	(14, 3, 8, '2019-08-09', '2019-09-09'),
	(15, 3, 8, '2019-08-09', '2019-09-09'),
	(16, 3, 8, '2019-08-09', '2019-09-09'),
	(17, 3, 8, '2019-08-09', '2019-09-09'),
	(18, 3, 8, '2019-08-09', '2019-09-09'),
	(19, 3, 8, '2019-08-09', '2019-09-09'),
	(20, 3, 8, '2019-08-09', '2019-09-09')

SELECT * FROM tbl_book_copies

SELECT tbl_book_copies.Number_Of_Copies, tbl_library_branch.BranchName, tbl_books.Title FROM tbl_book_copies
	INNER JOIN tbl_library_branch ON tbl_book_copies.BranchID = tbl_library_branch.BranchID
	INNER JOIN tbl_books ON tbl_book_copies.BookID = tbl_books.BookID
	WHERE tbl_books.Title = 'The Lost Tribe' AND tbl_library_branch.BranchName = 'Sharpstown'


SELECT BookID, Title FROM tbl_books