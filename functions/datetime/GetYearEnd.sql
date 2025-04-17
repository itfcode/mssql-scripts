SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************
 * Function:   [dbo].GetYearEnd
 * Purpose:    Returns the end of the current year (Dec 31, 23:59:59.9999999)
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The end of the current year.
 * Example:    SELECT [dbo].GetYearEnd('2025-04-17 13:45:00')
 *             -- Returns: 2025-12-31 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetYearEnd](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetYearEndAt](@inputDate, 0)
END
GO

/**************************************************************
 * Function:   [dbo].GetYearEndAt
 * Purpose:    Returns the end of a year (Dec 31, 23:59:59.9999999)
 *             after adjusting the input datetime by a number of years.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 *             @numberOfYears - Number of years to offset (can be negative).
 * Returns:    DATETIME2 - The end of the adjusted year.
 * Example:    SELECT [dbo].GetYearEndAt('2025-04-17 13:45:00', 1)
 *             -- Returns: 2026-12-31 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetYearEndAt](@inputDate DATETIME2, @numberOfYears INT)
RETURNS DATETIME2
AS
BEGIN
	RETURN DATEADD(MICROSECOND, -1, DATEFROMPARTS(YEAR(DATEADD(YEAR, @numberOfYears + 1, @inputDate)), 1, 1))
END
GO

/**************************************************************
 * Function:   [dbo].GetYearEndNext
 * Purpose:    Returns the end of the next year.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The end of the next year.
 * Example:    SELECT [dbo].GetYearEndNext('2025-04-17 13:45:00')
 *             -- Returns: 2026-12-31 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetYearEndNext](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetYearEndAt](@inputDate, 1)
END
GO

/**************************************************************
 * Function:   [dbo].GetYearEndPrev
 * Purpose:    Returns the end of the previous year.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The end of the previous year.
 * Example:    SELECT [dbo].GetYearEndPrev('2025-04-17 13:45:00')
 *             -- Returns: 2024-12-31 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetYearEndPrev](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetYearEndAt](@inputDate, -1)
END
GO
