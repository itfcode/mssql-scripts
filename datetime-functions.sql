USE [vbdtmp]
GO
/****** Object:  UserDefinedFunction [dbo].[GetDayEnd]    Script Date: 16/04/2025 18:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetDayEnd](@inputDate DATE)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetDayEndAt(@inputDate,0)
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetDayEndAt]    Script Date: 16/04/2025 18:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetDayEndAt](@inputDate DATE,  @numberOfDays INT)
RETURNS DATETIME2
AS
BEGIN
	RETURN DATEADD(MICROSECOND, -1, DATEADD(DAY, @numberOfDays + 1, CAST(@inputDate AS DATETIME2)));
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetDayEndNext]    Script Date: 16/04/2025 18:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetDayEndNext](@inputDate DATE)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetDayEndAt(@inputDate, 1)
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetDayEndPrev]    Script Date: 16/04/2025 18:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetDayEndPrev](@inputDate DATE)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetDayEndAt(@inputDate,-1)
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetDayStart]    Script Date: 16/04/2025 18:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetDayStart](@inputDateTime DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetDayStartAt(@inputDateTime, 0)
END
	
GO
/****** Object:  UserDefinedFunction [dbo].[GetDayStartAt]    Script Date: 16/04/2025 18:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetDayStartAt](@inputDateTime DATETIME2, @numberOfDays INT)
RETURNS DATETIME2
AS
BEGIN
	RETURN DATEADD(DAY, @numberOfDays, CAST(CAST(@inputDateTime AS DATE) AS DATETIME2))
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetDayStartNext]    Script Date: 16/04/2025 18:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetDayStartNext](@inputDateTime DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetDayStartAt(@inputDateTime, 1)
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetDayStartPrev]    Script Date: 16/04/2025 18:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetDayStartPrev](@inputDateTime DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetDayStartAt(@inputDateTime, -1)
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetWeekEnd]    Script Date: 16/04/2025 18:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetWeekEnd](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetWeekEndAt(@inputDate, 0)
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetWeekEndAt]    Script Date: 16/04/2025 18:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetWeekEndAt](@inputDate DATETIME2, @numberOfWeeks INT)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetDayEndPrev(dbo.GetWeekStartAt(@inputDate, @numberOfWeeks + 1))
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetWeekEndNext]    Script Date: 16/04/2025 18:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetWeekEndNext](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetWeekEndAt(@inputDate, 1)
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetWeekEndPrev]    Script Date: 16/04/2025 18:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[GetWeekEndPrev](@inputDate DATETIME2)
RETURNS DATETIME2
AS
BEGIN
	RETURN dbo.GetWeekEndAt(@inputDate, -1)
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetWeekStart]    Script Date: 16/04/2025 18:47:28 ******/
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
