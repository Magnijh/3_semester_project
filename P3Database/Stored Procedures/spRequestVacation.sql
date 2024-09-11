
CREATE PROCEDURE [dbo].[spRequestVacation]
	@EmpId		VARCHAR(50),
	@StartDate	DATETIME,
	@EndDate	DATETIME
AS
    SET NOCOUNT ON; 

DECLARE @EmpDEP INT = (SELECT Department_Id FROM dbo.EmployeeTable WHERE EmployeeId = @EmpId);


INSERT INTO dbo.VacationTable (EmployeeId, Department_Id, StartDate, EndDate, ReqCreateDate) VALUES (@EmpId, @EmpDEP, @StartDate, @EndDate, DATEADD(hour, 1, GETUTCDATE()));