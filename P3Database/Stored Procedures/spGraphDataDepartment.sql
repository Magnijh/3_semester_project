CREATE PROCEDURE [dbo].[spGraphDataDepartment]
	@EmpId VARCHAR(50)
AS

DECLARE @EmpDepId INT = (SELECT Department_Id FROM EmployeeTable WHERE EmployeeId = @EmpId)

DECLARE @EmpsInDep INT = (SELECT COUNT(Id) FROM dbo.EmployeeTable WHERE Department_Id = 3)

SELECT  MonthNumber = DATEPART("mm", DATEADD(MONTH, DATEDIFF(MONTH, 0, CheckOutDate), 0)), 
        SUM(TimeWorked)/@EmpsInDep as AvgSecondsWorked
FROM    WorkTable
WHERE   CheckOutDate >= (DATEADD(hour, 1, GETUTCDATE()) - 365)
AND     CheckOutDate <= (DATEADD(hour, 1, GETUTCDATE()) + 365)
AND     CheckOutDate IS NOT NULL
AND		Department_Id = @EmpDepId
GROUP BY DATEADD(MONTH, DATEDIFF(MONTH, 0, CheckOutDate), 0)

RETURN