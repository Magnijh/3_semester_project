CREATE PROCEDURE [dbo].[spCheckInStatus]

	@USessionId VARCHAR(50)

AS
BEGIN  

    SET NOCOUNT ON; 
	
	DECLARE @CheckedInStatus		INT	= (
		SELECT COUNT(EmployeeId) FROM dbo.WorkTable WHERE EmployeeId = @USessionId AND CheckOutDate IS NULL
		)
	
	DECLARE @LastCheckInDate		DATETIME = (
		SELECT CheckInDate FROM dbo.WorkTable WHERE EmployeeId = @USessionId AND CheckOutDate IS NULL
		)


	DECLARE @WeekBegin DATETIME = DATEADD(wk, 0, DATEADD(DAY, 1-DATEPART(WEEKDAY, DATEADD(hour, 1, GETUTCDATE())), DATEDIFF(dd, 0, DATEADD(hour, 1, GETUTCDATE())))) --first day current week.. starts sunday tho..
	
	DECLARE @SecWorkedLastWeek		INT = (
		SELECT SUM(TimeWorked) FROM dbo.WorkTable WHERE EmployeeId = @USessionId AND CheckOutDate IS NOT NULL 
		AND CheckInDate BETWEEN @WeekBegin AND DATEADD(hour, 1, GETUTCDATE())
		)

	DECLARE @WorkHoursInWeek		INT = (
		SELECT WorkHoursInWeek FROM dbo.EmployeeTable WHERE EmployeeId = @USessionId
		)
	
	SELECT @CheckedInStatus AS CheckedInStatus, @LastCheckInDate AS CheckInDate, 
			@SecWorkedLastWeek AS SecondsWorkedLastWeek, @WorkHoursInWeek AS TargetWorkHours


	--SELECT COUNT(UserName), CAST(CheckInDate AS DATETIME) FROM dbo.CheckInOutTable WHERE UserName = @USessionId AND CheckOutDate IS NULL
	--SELECT COUNT(UserName) AS CheckedInStatus FROM dbo.CheckInOutTable WHERE UserName = @USessionId AND CheckOutDate IS NULL
	--SELECT CheckInDate FROM dbo.CheckInOutTable WHERE UserName = @USessionId AND CheckOutDate IS NULL
	--SELECT SUM(TimeWorked) AS SecondsWorked FROM dbo.CheckInOutTable WHERE UserName = @USessionId AND CheckOutDate IS NOT NULL
RETURN
END