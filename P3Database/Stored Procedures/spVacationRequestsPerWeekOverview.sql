CREATE PROCEDURE [dbo].[spVacationRequestsGroupedByWeek]
	
@DepId INT 

AS
SELECT
  DATEPART(week, StartDate) AS 'WeekNum',
  COUNT(EmployeeId) AS 'WeeklyRequests'
FROM VacationTable
WHERE Approved = 0
	AND Department_Id = @DepId
GROUP BY DATEPART(week, StartDate)
ORDER BY DATEPART(week, StartDate)

RETURN