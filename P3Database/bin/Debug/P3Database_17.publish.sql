﻿/*
Deployment script for P3Database

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "P3Database"
:setvar DefaultFilePrefix "P3Database"
:setvar DefaultDataPath "C:\Users\Wraff\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb\"
:setvar DefaultLogPath "C:\Users\Wraff\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\mssqllocaldb\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Altering [dbo].[spCalender]...';


GO

ALTER PROCEDURE [dbo].[spCalender]
	
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

	SELECT Id AS 'id', StartDate AS 'start', EndDate AS 'end', @Rendering AS rendering, @Color AS color 
	FROM dbo.AbsentTable 
	WHERE EmployeeId = @EmpID;
END

IF (@Request = 'EmployeeVacation')
BEGIN
	SET @Color = 'grey';

	SELECT Id AS 'id', StartDate AS 'start', EndDate AS 'end', @Rendering AS rendering, @Color AS color 
	FROM dbo.VacationTable 
	WHERE EmployeeId = @EmpID;
END

RETURN
END
GO
PRINT N'Creating [dbo].[spAbsent]...';


GO
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
GO
PRINT N'Update complete.';


GO
