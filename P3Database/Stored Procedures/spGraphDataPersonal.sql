CREATE PROCEDURE [dbo].[spGraphDataPersonal]
	@EmpId VARCHAR(50)
AS


DECLARE @EmpsInDep INT = (SELECT COUNT(Id) FROM dbo.EmployeeTable WHERE Department_Id = 3)

SELECT  MonthNumber = DATEPART("mm", DATEADD(MONTH, DATEDIFF(MONTH, 0, CheckOutDate), 0)), 
        SUM(TimeWorked) as AvgSecondsWorked 
FROM    WorkTable
WHERE   CheckOutDate >= (DATEADD(hour, 1, GETUTCDATE()) - 365)
AND     CheckOutDate <= (DATEADD(hour, 1, GETUTCDATE()) + 365)
AND     CheckOutDate IS NOT NULL
AND		EmployeeId = @EmpId
GROUP BY DATEADD(MONTH, DATEDIFF(MONTH, 0, CheckOutDate), 0)

RETURN