SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************
 * Function:   dbo.GetDayStart
 * Purpose:    Returns the start of the day (00:00:00) for the given datetime.
 * Parameters: @inputDateTime - Input datetime value.
 * Returns:    DATETIME2 - The beginning of the same day.
 * Example:    SELECT dbo.GetDayStart('2025-04-17 13:45:00')
 *             -- Returns: 2025-04-17 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetDayStart](@inputDateTime DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetDayStartAt](@inputDateTime, 0)
END
GO

/**************************************************************
 * Function:   dbo.GetDayStartAt
 * Purpose:    Returns the start of the day (00:00:00) after adjusting
 *             the given datetime by a specified number of days.
 * Parameters: @inputDateTime - Input datetime value.
 *             @numberOfDays - Number of days to offset (can be negative).
 * Returns:    DATETIME2 - The beginning of the adjusted day.
 * Example:    SELECT dbo.GetDayStartAt('2025-04-17 13:45:00', 2)
 *             -- Returns: 2025-04-19 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetDayStartAt](@inputDateTime DATETIME2, @numberOfDays INT)
RETURNS DATETIME2
AS
BEGIN
	RETURN DATEADD(DAY, @numberOfDays, CAST(CAST(@inputDateTime AS DATE) AS DATETIME2))
END
GO

/**************************************************************
 * Function:   dbo.GetDayStartNext
 * Purpose:    Returns the start of the next day (00:00:00) after the given datetime.
 * Parameters: @inputDateTime - Input datetime value.
 * Returns:    DATETIME2 - The beginning of the next day.
 * Example:    SELECT dbo.GetDayStartNext('2025-04-17 13:45:00')
 *             -- Returns: 2025-04-18 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetDayStartNext](@inputDateTime DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetDayStartAt](@inputDateTime, 1)
END
GO

/**************************************************************
 * Function:   dbo.GetDayStartPrev
 * Purpose:    Returns the start of the previous day (00:00:00) before the given datetime.
 * Parameters: @inputDateTime - Input datetime value.
 * Returns:    DATETIME2 - The beginning of the previous day.
 * Example:    SELECT dbo.GetDayStartPrev('2025-04-17 13:45:00')
 *             -- Returns: 2025-04-16 00:00:00
 **************************************************************/
CREATE FUNCTION [dbo].[GetDayStartPrev](@inputDateTime DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN [dbo].[GetDayStartAt](@inputDateTime, -1)
END
GO