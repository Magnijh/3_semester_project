CREATE PROCEDURE [dbo].[spVacationCurrentRequests]

@EmpId VARCHAR(50),
@DepId INT 

AS

IF (@EmpId = '')
BEGIN
SELECT A.Id as 'Id', A.EmployeeId as 'EmployeeId', FirstName as 'Firstname', LastName as 'Lastname', 
	StartDate, EndDate, ReqCreateDate, Approved as 'Status', ApprovedBy as ChangedBy
FROM VacationTable AS A 
left join EmployeeTable AS B
ON A.EmployeeId = B.EmployeeId
WHERE A.Department_Id = @DepId
AND ReqCreateDate >= (DATEADD(hour, 1, GETUTCDATE()) - 100)
ORDER BY ReqCreateDate ASC
END

ELSE
BEGIN
SELECT A.Id as 'Id', A.EmployeeId as 'EmployeeId', FirstName as 'Firstname', LastName as 'Lastname', 
	StartDate, EndDate, ReqCreateDate, Approved as 'Status', ApprovedBy as ChangedBy
FROM VacationTable AS A 
left join EmployeeTable AS B
ON A.EmployeeId = B.EmployeeId
WHERE A.EmployeeId = @EmpId
AND Approved = 1
ORDER BY ReqCreateDate ASC
END
RETURN