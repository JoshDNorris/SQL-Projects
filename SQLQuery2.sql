CREATE PROC dbo.uspGetBooksFromEachBranch @Title varchar(50)
AS
SELECT tbl_book_copies.Number_Of_Copies, tbl_library_branch.BranchName, tbl_books.Title FROM tbl_book_copies
	INNER JOIN tbl_library_branch ON tbl_book_copies.BranchID = tbl_library_branch.BranchID
	INNER JOIN tbl_books ON tbl_book_copies.BookID = tbl_books.BookID
	WHERE tbl_books.Title = @Title 
GO
EXEC dbo.uspGetBooksFromEachBranch @Title = 'The Lost Tribe'