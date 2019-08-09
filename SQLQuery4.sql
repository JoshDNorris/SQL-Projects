
CREATE PROC dbo.uspGetDueBooksByBranch @Due DATE, @Branch varchar(50)
AS
SELECT tbl_books.Title, tbl_borrower.Name, tbl_borrower.Address FROM tbl_book_loans
	INNER JOIN tbl_books ON tbl_books.BookID = tbl_book_loans.BookID
	INNER JOIN tbl_borrower ON tbl_borrower.CardNo = tbl_book_loans.CardNo
	INNER JOIN tbl_library_branch ON tbl_library_branch.BranchID = tbl_book_loans.BranchID
	WHERE tbl_book_loans.DateDue = @Due AND tbl_library_branch.BranchName  = @Branch
GO
EXEC dbo.uspGetDueBooksByBranch @Due = '2019-08-09', @Branch = 'Sharpstown'