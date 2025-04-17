SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************
 * Function:   dbo.GetWeekEnd
 * Purpose:    Returns the end of the week (Sunday 23:59:59.9999999) 
 *             for the week containing the given datetime.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The end of the current week.
 * Example:    SELECT dbo.GetWeekEnd('2025-04-17 13:45:00')
 *             -- If 2025-04-17 is a Thursday, returns: 2025-04-20 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetWeekEnd](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetWeekEndAt](@inputDate, 0)
END
GO

/**************************************************************
 * Function:   dbo.GetWeekEndAt
 * Purpose:    Returns the end of the week (Sunday 23:59:59.9999999) 
 *             after adjusting the week of the given datetime by 
 *             a specified number of weeks.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 *             @numberOfWeeks - Number of weeks to offset (can be negative).
 * Returns:    DATETIME2 - The end of the adjusted week.
 * Example:    SELECT dbo.GetWeekEndAt('2025-04-17 13:45:00', 1)
 *             -- Returns: 2025-04-27 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetWeekEndAt](@inputDate DATETIME2, @numberOfWeeks INT)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetDayEndPrev]([dbo].[GetWeekStartAt](@inputDate, @numberOfWeeks + 1))
END
GO

/**************************************************************
 * Function:   dbo.GetWeekEndNext
 * Purpose:    Returns the end of the next week (Sunday 23:59:59.9999999)
 *             after the week of the given datetime.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The end of the next week.
 * Example:    SELECT dbo.GetWeekEndNext('2025-04-17 13:45:00')
 *             -- Returns: 2025-04-27 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetWeekEndNext](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetWeekEndAt](@inputDate, 1)
END
GO

/**************************************************************
 * Function:   dbo.GetWeekEndPrev
 * Purpose:    Returns the end of the previous week (Sunday 23:59:59.9999999)
 *             before the week of the given datetime.
 * Parameters: @inputDate - Input datetime value (DATETIME2).
 * Returns:    DATETIME2 - The end of the previous week.
 * Example:    SELECT dbo.GetWeekEndPrev('2025-04-17 13:45:00')
 *             -- Returns: 2025-04-13 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetWeekEndPrev](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetWeekEndAt](@inputDate, -1)
END
GO
