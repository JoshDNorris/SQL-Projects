CREATE PROC dbo.uspGetTotalLoanedBooksByBranch
AS
SELECT BranchName, COUNT(tbl_book_loans.BranchID) AS 'Loaned Books' FROM tbl_library_branch
	JOIN tbl_book_loans ON tbl_book_loans.BranchID = tbl_library_branch.BranchID
	GROUP BY BranchName
GO
EXEC dbo.uspGetTotalLoanedBooksByBranch