
CREATE PROCEDURE [dbo].[spCalender]
	
	@EmpID		VARCHAR(50),
	@Request	VARCHAR(50)
	

AS
BEGIN  

	SET NOCOUNT ON;

	DECLARE @Color		VARCHAR(10);
	DECLARE @Rendering	VARCHAR(10) = 'background';
	
IF (@Request = 'EmployeeWorkHours')
BEGIN
	SET @Color = 'green';

	SELECT Id AS 'id', CheckInDate AS 'start', CheckOutDate AS 'end', @Rendering AS rendering, @Color AS color 
	FROM WorkTable 
	WHERE CheckOutDate IS NOT NULL
	and EmployeeId = @EmpID;
END

IF (@Request = 'EmployeeAbsence')
BEGIN
	SET @Color = 'red';

	SELECT Id AS 'id', StartDate AS 'start', EndDate AS 'end', @Rendering AS rendering, @Color AS color, Note
	FROM dbo.AbsentTable 
	WHERE EmployeeId = @EmpID;
END

IF (@Request = 'DepartmentVacation')
BEGIN
	SET @Color = 'grey';

	DECLARE @Holder INT = (Select Department_Id from EmployeeTable where EmployeeId = @EmpID )

	SELECT Id AS 'id', StartDate AS 'start', EndDate AS 'end', @Rendering AS rendering, @Color AS color 
	FROM dbo.VacationTable 
	WHERE Department_Id = @Holder
	AND Approved = 1;
END

IF (@Request = 'EmployeeVacation')
BEGIN
	SET @Color = 'grey';
	SELECT Id AS 'id', StartDate AS 'start', EndDate AS 'end', @Rendering AS rendering, @Color AS color 
	FROM dbo.VacationTable 
	WHERE EmployeeId = @EmpID
	AND Approved = 1;
END

RETURN
END