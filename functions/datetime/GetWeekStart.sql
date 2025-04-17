SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************
 * Function:   dbo.GetWeekStart
 * Purpose:    Returns the start of the week (Monday 00:00:00) 
 *             for the week containing the given datetime.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The beginning of the current week.
 * Example:    SELECT dbo.GetWeekStart('2025-04-17 13:45:00')
 *             -- If 2025-04-17 is a Thursday, returns: 2025-04-14 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetWeekStart](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetWeekStartAt(@inputDate, 0)
END
GO

/**************************************************************
 * Function:   dbo.GetWeekStartAt
 * Purpose:    Returns the start of the week (Monday 00:00:00) 
 *             after adjusting the given datetime by a specified 
 *             number of weeks.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 *             @numberOfWeeks - Number of weeks to offset (can be negative).
 * Returns:    DATETIME2 - The beginning of the adjusted week.
 * Example:    SELECT dbo.GetWeekStartAt('2025-04-17 13:45:00', 1)
 *             -- Returns: 2025-04-21 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetWeekStartAt](@inputDate DATETIME2, @numberOfWeeks INT)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetDayStart(DATEADD(DAY, -((DATEPART(WEEKDAY, @inputDate) + @@DATEFIRST - 2) % 7 - (@numberOfWeeks * 7)), @inputDate))
END
GO

/**************************************************************
 * Function:   dbo.GetWeekStartNext
 * Purpose:    Returns the start of the next week 
 *             (Monday 00:00:00 of the following week).
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The beginning of the next week.
 * Example:    SELECT dbo.GetWeekStartNext('2025-04-17 13:45:00')
 *             -- Returns: 2025-04-21 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetWeekStartNext](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetWeekStartAt(@inputDate, 1)
END
GO

/**************************************************************
 * Function:   dbo.GetWeekStartPrev
 * Purpose:    Returns the start of the previous week 
 *             (Monday 00:00:00 of the previous week).
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The beginning of the previous week.
 * Example:    SELECT dbo.GetWeekStartPrev('2025-04-17 13:45:00')
 *             -- Returns: 2025-04-07 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetWeekStartPrev](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetWeekStartAt(@inputDate, -1)
END
GO
