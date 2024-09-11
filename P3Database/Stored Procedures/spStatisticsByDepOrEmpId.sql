CREATE PROCEDURE [dbo].[spStatisticsByDepOrEmpId]
	@DepId	INT,
	@EmpId VARCHAR(50)
AS
    SET NOCOUNT ON; 
BEGIN

DECLARE @WeekBegin DATETIME = DATEADD(wk, 0, DATEADD(DAY, 1-DATEPART(WEEKDAY, DATEADD(hour, 1, GETUTCDATE())), DATEDIFF(dd, 0, DATEADD(hour, 1, GETUTCDATE())))) --first day current week.. starts sunday tho..


IF(@EmpId = '')
BEGIN
SELECT EmployeeId, FirstName, LastName, Role, WorkHoursInWeek,

(SELECT AVG(TimeWorked) 
	FROM dbo.WorkTable
	WHERE TimeWorked IS NOT NULL	
	AND EmployeeId = A.EmployeeId)
	AS AverageSecondsPerCheckIn,

(SELECT SUM(TimeWorked)
	FROM dbo.WorkTable 
	WHERE EmployeeId = A.EmployeeId 
	AND CheckInDate BETWEEN @WeekBegin AND DATEADD(hour, 1, GETUTCDATE())) 
	AS SecondsWorkedThisWeek

FROM EmployeeTable as A
WHERE A.Department_Id = @DepId
END

ELSE
BEGIN
SELECT EmployeeId, FirstName, LastName, Role, WorkHoursInWeek,

(SELECT AVG(TimeWorked) 
	FROM dbo.WorkTable
	WHERE TimeWorked IS NOT NULL	
	AND EmployeeId = A.EmployeeId)
	AS AverageSecondsPerCheckIn,

(SELECT SUM(TimeWorked)
	FROM dbo.WorkTable 
	WHERE EmployeeId = A.EmployeeId 
	AND CheckInDate BETWEEN @WeekBegin AND DATEADD(hour, 1, GETUTCDATE())) 
	AS SecondsWorkedThisWeek

FROM EmployeeTable as A
WHERE A.EmployeeId = @EmpId
END

END

	--select EmployeeId, Department from EmployeeTable as A left join DepartmentTable as B on A.Department_Id = B.Department_Id






