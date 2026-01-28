CREATE OR ALTER PROCEDURE dbo.GetAllBookTitles
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Title
    FROM dbo.Book;
END;
GO

CREATE OR ALTER PROCEDURE dbo.GetBooksByAuthor
    @AuthorName VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT b.Title
    FROM dbo.Book AS b
    INNER JOIN dbo.Author AS a
        ON b.AuthorId = a.AuthorId
    WHERE a.AuthorName = @AuthorName;
END;
GO

CREATE OR ALTER FUNCTION dbo.fn_BookCountByAuthor (@AuthorName VARCHAR(100))
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(*)
        FROM dbo.Book AS b
        INNER JOIN dbo.Author AS a
            ON b.AuthorId = a.AuthorId
        WHERE a.AuthorName = @AuthorName
    );
END;

GO
