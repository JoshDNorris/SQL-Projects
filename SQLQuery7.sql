CREATE PROC dbo.uspGetBooksByAuthorPerBranch @Author varchar(50), @Branch varchar(50)
AS
SELECT tbl_books.Title, tbl_book_copies.Number_Of_Copies FROM tbl_books
	LEFT JOIN tbl_book_copies ON tbl_books.BookID = tbl_book_copies.BookID
	INNER JOIN tbl_book_authors ON tbl_books.BookID = tbl_book_authors.BookID
	INNER JOIN tbl_library_branch ON tbl_book_copies.BranchID = tbl_library_branch.BranchID
	WHERE tbl_book_authors.AuthorName = @Author AND tbl_library_branch.BranchName = @Branch
GO
EXEC dbo.uspGetBooksByAuthorPerBranch @Author = 'Stephen King', @Branch = 'Central'