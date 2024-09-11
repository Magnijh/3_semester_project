CREATE PROCEDURE [dbo].[spLogin]
(
@EmpID		VARCHAR(50)
)
AS

SET NOCOUNT ON

BEGIN	

SELECT EmpPass AS 'AccountHash', Department_Id AS 'AccountDepartment', Role AS 'AccountRole'
FROM dbo.EmployeeTable 
WHERE EmployeeId = @EmpID
	
END
RETURN
