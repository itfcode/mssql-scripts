SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************
 * Function:   dbo.GetDayEnd
 * Purpose:    Returns the end of the day (23:59:59.9999999) 
 *             for the given date.
 * Parameters: @inputDate - Input date value (DATE).
 * Returns:    DATETIME2 - The end of the same day.
 * Example:    SELECT dbo.GetDayEnd('2025-04-17')
 *             -- Returns: 2025-04-17 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetDayEnd](@inputDate DATE)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetDayEndAt(@inputDate, 0)
END
GO

/**************************************************************
 * Function:   dbo.GetDayEndAt
 * Purpose:    Returns the end of a day (23:59:59.9999999) 
 *             after adjusting the given date by a specified 
 *             number of days.
 * Parameters: @inputDate - Input date value (DATE).
 *             @numberOfDays - Number of days to offset (can be negative).
 * Returns:    DATETIME2 - The end of the adjusted day.
 * Example:    SELECT dbo.GetDayEndAt('2025-04-17', 2)
 *             -- Returns: 2025-04-19 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetDayEndAt](@inputDate DATE, @numberOfDays INT)
RETURNS DATETIME2
AS
BEGIN
	RETURN DATEADD(MICROSECOND, -1, DATEADD(DAY, @numberOfDays + 1, CAST(@inputDate AS DATETIME2)))
END
GO

/**************************************************************
 * Function:   dbo.GetDayEndNext
 * Purpose:    Returns the end of the next day (23:59:59.9999999)
 *             after the given date.
 * Parameters: @inputDate - Input date value (DATE).
 * Returns:    DATETIME2 - The end of the next day.
 * Example:    SELECT dbo.GetDayEndNext('2025-04-17')
 *             -- Returns: 2025-04-18 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetDayEndNext](@inputDate DATE)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetDayEndAt(@inputDate, 1)
END
GO

/**************************************************************
 * Function:   dbo.GetDayEndPrev
 * Purpose:    Returns the end of the previous day (23:59:59.9999999)
 *             before the given date.
 * Parameters: @inputDate - Input date value (DATE).
 * Returns:    DATETIME2 - The end of the previous day.
 * Example:    SELECT dbo.GetDayEndPrev('2025-04-17')
 *             -- Returns: 2025-04-16 23:59:59.9999999
 **************************************************************/
CREATE FUNCTION [dbo].[GetDayEndPrev](@inputDate DATE)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetDayEndAt(@inputDate, -1)
END
GO