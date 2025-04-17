SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************
 * Function:   [dbo].GetMonthStart
 * Purpose:    Returns the beginning of the month (1st day, 00:00:00)
 *             for the month containing the given datetime.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The start of the current month.
 * Example:    SELECT [dbo].GetMonthStart('2025-04-17 13:45:00')
 *             -- Returns: 2025-04-01 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetMonthStart](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetMonthStartAt](@inputDate, 0)
END
GO

/**************************************************************
 * Function:   [dbo].GetMonthStartAt
 * Purpose:    Returns the start of a month (1st day, 00:00:00)
 *             after adjusting the input datetime by a given number of months.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 *             @numberOfMonths - Number of months to offset (can be negative).
 * Returns:    DATETIME2 - The start of the adjusted month.
 * Example:    SELECT [dbo].GetMonthStartAt('2025-04-17 13:45:00', 1)
 *             -- Returns: 2025-05-01 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetMonthStartAt](@inputDate DATETIME2, @numberOfMonths INT)
RETURNS DATETIME2
AS
BEGIN
	RETURN DATEFROMPARTS(YEAR(DATEADD(MONTH, @numberOfMonths, @inputDate)), MONTH(DATEADD(MONTH, @numberOfMonths, @inputDate)), 1)
END
GO

/**************************************************************
 * Function:   [dbo].GetMonthStartNext
 * Purpose:    Returns the beginning of the next month.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The start of the next month.
 * Example:    SELECT [dbo].GetMonthStartNext('2025-04-17 13:45:00')
 *             -- Returns: 2025-05-01 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetMonthStartNext](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetMonthStartAt](@inputDate, 1)
END
GO

/**************************************************************
 * Function:   [dbo].GetMonthStartPrev
 * Purpose:    Returns the beginning of the previous month.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The start of the previous month.
 * Example:    SELECT [dbo].GetMonthStartPrev('2025-04-17 13:45:00')
 *             -- Returns: 2025-03-01 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetMonthStartPrev](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetMonthStartAt](@inputDate, -1)
END
GO
