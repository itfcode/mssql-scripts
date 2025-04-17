SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************
 * Function:   [dbo].GetYearStart
 * Purpose:    Returns the beginning of the year (Jan 1st, 00:00:00)
 *             for the year containing the given datetime.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The start of the current year.
 * Example:    SELECT [dbo].GetYearStart('2025-04-17 13:45:00')
 *             -- Returns: 2025-01-01 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetYearStart](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetYearStartAt](@inputDate, 0)
END
GO

/**************************************************************
 * Function:   [dbo].[GetYearStartAt]
 * Purpose:    Returns the beginning of a year (Jan 1st, 00:00:00)
 *             after adjusting the input datetime by a number of years.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 *             @numberOfYears - Number of years to offset (can be negative).
 * Returns:    DATETIME2 - The start of the adjusted year.
 * Example:    SELECT [dbo].[GetYearStartAt]('2025-04-17 13:45:00', 1)
 *             -- Returns: 2026-01-01 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetYearStartAt](@inputDate DATETIME2, @numberOfYears INT)
RETURNS DATETIME2
AS
BEGIN
	RETURN DATEFROMPARTS(YEAR(DATEADD(YEAR, @numberOfYears, @inputDate)), 1, 1)
END
GO

/**************************************************************
 * Function:   [dbo].GetYearStartNext
 * Purpose:    Returns the beginning of the next year.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The start of the next year.
 * Example:    SELECT [dbo].GetYearStartNext('2025-04-17 13:45:00')
 *             -- Returns: 2026-01-01 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetYearStartNext](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetYearStartAt](@inputDate, 1)
END
GO

/**************************************************************
 * Function:   [dbo].GetYearStartPrev
 * Purpose:    Returns the beginning of the previous year.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The start of the previous year.
 * Example:    SELECT [dbo].GetYearStartPrev('2025-04-17 13:45:00')
 *             -- Returns: 2024-01-01 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetYearStartPrev](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetYearStartAt](@inputDate, -1)
END
GO
