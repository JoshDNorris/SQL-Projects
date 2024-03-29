USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[uspGetBorrowersWithBooksOut]    Script Date: 8/9/2019 1:24:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[uspGetBorrowersWithBooksOut]
AS
SELECT tbl_borrower.Name, tbl_borrower.Address, COUNT(*) AS 'Books Out' FROM tbl_book_loans
	INNER JOIN tbl_borrower ON tbl_borrower.CardNo = tbl_book_loans.CardNo
	GROUP BY tbl_borrower.Name, tbl_borrower.Address
	HAVING COUNT(tbl_borrower.Name) > 5
