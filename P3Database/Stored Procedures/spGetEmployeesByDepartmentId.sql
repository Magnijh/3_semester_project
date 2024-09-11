CREATE PROCEDURE [dbo].[spGetEmployeesBy]

@DepId INT, 
@EmpId VARCHAR(50)

AS

IF (@DepId != 0)
BEGIN

SELECT FirstName as 'Firstname', LastName as 'Lastname', A.EmployeeId as 'EmployeeId', 
	Role, Email, Department, WorkHoursInWeek
FROM EmployeeTable AS A 
left join DepartmentTable AS B
ON A.Department_Id = B.Department_Id
WHERE A.Department_Id = @DepId
END

ELSE
BEGIN
SELECT FirstName as 'Firstname', LastName as 'Lastname', A.EmployeeId as 'EmployeeId', 
	Role, Email, Department, WorkHoursInWeek
FROM EmployeeTable AS A 
left join DepartmentTable AS B
ON A.Department_Id = B.Department_Id
WHERE A.EmployeeId = @EmpId

END
RETURN