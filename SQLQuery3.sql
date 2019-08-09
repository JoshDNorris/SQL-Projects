CREATE PROC dbo.uspGetNullUsers
AS
SELECT Name FROM tbl_borrower 
	LEFT JOIN tbl_book_loans ON tbl_borrower.CardNo = tbl_book_loans.CardNo
	WHERE tbl_book_loans.BookID IS NULL
GO
EXEC dbo.uspGetNullUsers 