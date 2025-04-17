SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetWeekStart](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetWeekStartAt(@inputDate, 0)
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetWeekStartAt]    Script Date: 16/04/2025 18:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetWeekStartAt](@inputDate DATETIME2, @numberOfWeeks INT)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetDayStart(DATEADD(DAY, -((DATEPART(WEEKDAY, @inputDate) + @@DATEFIRST - 2) % 7 - (@numberOfWeeks * 7)), @inputDate))
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetWeekStartNext]    Script Date: 16/04/2025 18:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetWeekStartNext](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetWeekStartAt(@inputDate, 0)
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetWeekStartPrev]    Script Date: 16/04/2025 18:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetWeekStartPrev](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetWeekStartAt(@inputDate, 0)
END

GO
