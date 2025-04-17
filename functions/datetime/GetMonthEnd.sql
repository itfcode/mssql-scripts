SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************
 * Function:   [dbo].GetMonthEnd
 * Purpose:    Returns the end of the current month (last day, 23:59:59.9999999)
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The end of the current month.
 * Example:    SELECT [dbo].GetMonthEnd('2025-04-17 13:45:00')
 *             -- Returns: 2025-04-30 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetMonthEnd](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetMonthEndAt](@inputDate, 0)
END
GO

/**************************************************************
 * Function:   [dbo].[GetYearStartAt]
 * Purpose:    Returns the end of a month (last day, 23:59:59.9999999)
 *             after adjusting the input datetime by a given number of months.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 *             @numberOfMonths - Number of months to offset (can be negative).
 * Returns:    DATETIME2 - The end of the adjusted month.
 * Example:    SELECT [dbo].[GetYearStartAt]('2025-04-17 13:45:00', 1)
 *             -- Returns: 2025-05-31 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetMonthEndAt](@inputDate DATETIME2, @numberOfMonths INT)
RETURNS DATETIME2
AS
BEGIN
	RETURN DATEADD(MICROSECOND, -1, DATEFROMPARTS(YEAR(DATEADD(MONTH, @numberOfMonths + 1, @inputDate)), MONTH(DATEADD(MONTH, @numberOfMonths + 1, @inputDate)), 1))
END
GO

/**************************************************************
 * Function:   [dbo].GetMonthEndNext
 * Purpose:    Returns the end of the next month.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The end of the next month.
 * Example:    SELECT [dbo].GetMonthEndNext('2025-04-17 13:45:00')
 *             -- Returns: 2025-05-31 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetMonthEndNext](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetMonthEndAt](@inputDate, 1)
END
GO

/**************************************************************
 * Function:   [dbo].GetMonthEndPrev
 * Purpose:    Returns the end of the previous month.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The end of the previous month.
 * Example:    SELECT [dbo].GetMonthEndPrev('2025-04-17 13:45:00')
 *             -- Returns: 2025-03-31 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetMonthEndPrev](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetMonthEndAt](@inputDate, -1)
END
GO
