CREATE PROCEDURE [dbo].[spCheckInOut]

@Username	varchar(50)

AS

DECLARE @Holder INT = (
		SELECT COUNT(EmployeeId) 
		FROM dbo.WorkTable 
		WHERE EmployeeId = @Username AND CheckOutDate IS NULL)

DECLARE @DepartmentIDHolder INT = (
		SELECT Department_Id 
		FROM dbo.EmployeeTable 
		WHERE EmployeeId = @Username)

IF @Holder = 1
	UPDATE dbo.WorkTable
		SET 
		CheckOutDate = DATEADD(hour, 1, GETUTCDATE()),
		TimeWorked = DATEDIFF(SECOND, CheckInDate, DATEADD(hour, 1, GETUTCDATE()))
		WHERE 1=1
		AND EmployeeId = @Username
		AND CheckOutDate IS NULL

ELSE IF @Holder = 0
	INSERT INTO dbo.WorkTable
		(EmployeeId, Department_Id, CheckInDate)
		VALUES 
		(@Username, @DepartmentIDHolder, DATEADD(hour, 1, GETUTCDATE()))

ELSE 
	PRINT 'something went wrong, multiple CheckIn with no CheckOut'
	-- someone should do some error handling.. 