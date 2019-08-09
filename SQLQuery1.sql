CREATE PROC dbo.uspGetBooksFromBranch @Title varchar(50), @Branch varchar(50)
AS
SELECT tbl_book_copies.Number_Of_Copies, tbl_library_branch.BranchName, tbl_books.Title FROM tbl_book_copies
	INNER JOIN tbl_library_branch ON tbl_book_copies.BranchID = tbl_library_branch.BranchID
	INNER JOIN tbl_books ON tbl_book_copies.BookID = tbl_books.BookID
	WHERE tbl_books.Title = @Title AND tbl_library_branch.BranchName = @Branch
GO
EXEC dbo.uspGetBooksFromBranch @Title = 'The Lost Tribe', @Branch = 'Sharpstown'