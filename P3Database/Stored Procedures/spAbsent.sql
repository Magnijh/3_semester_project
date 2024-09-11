CREATE PROCEDURE [dbo].[spAbsent]
	@EmpId		VARCHAR(50),
	@StartDate	DATETIME,
	@EndDate	DATETIME,
	@Reason		VARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON; 

DECLARE @EmpDEP INT = (SELECT Department_Id FROM dbo.EmployeeTable WHERE EmployeeId = @EmpId)


INSERT INTO dbo.AbsentTable (EmployeeId, Department_Id, StartDate, EndDate, Note) VALUES (@EmpId, @EmpDEP, @StartDate, @EndDate, @Reason);
END