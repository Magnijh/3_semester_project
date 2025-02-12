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
:setvar DefaultDataPath "C:\Users\Benno\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\Benno\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[AbsentTable]...';


GO
CREATE TABLE [dbo].[AbsentTable] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [EmployeeId]    VARCHAR (50)  NOT NULL,
    [Department_Id] INT           NOT NULL,
    [StartDate]     DATETIME      NOT NULL,
    [EndDate]       DATETIME      NOT NULL,
    [Note]          VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_AbsentTable] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[DepartmentTable]...';


GO
CREATE TABLE [dbo].[DepartmentTable] (
    [Department_Id] INT          IDENTITY (1, 1) NOT NULL,
    [Department]    VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_DepartmentTable] PRIMARY KEY CLUSTERED ([Department_Id] ASC)
);


GO
PRINT N'Creating [dbo].[EmployeeTable]...';


GO
CREATE TABLE [dbo].[EmployeeTable] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]       VARCHAR (50)  NOT NULL,
    [LastName]        VARCHAR (50)  NOT NULL,
    [EmployeeId]      VARCHAR (50)  NOT NULL,
    [EmpPass]         VARCHAR (256) NULL,
    [Email]           VARCHAR (100) NOT NULL,
    [Department_Id]   INT           NOT NULL,
    [WorkHoursInWeek] INT           NOT NULL,
    [Role]            INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([EmployeeId] ASC)
);


GO
PRINT N'Creating [dbo].[VacationTable]...';


GO
CREATE TABLE [dbo].[VacationTable] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [EmployeeId]    VARCHAR (50) NOT NULL,
    [Department_Id] INT          NOT NULL,
    [StartDate]     DATETIME     NOT NULL,
    [EndDate]       DATETIME     NOT NULL,
    [ReqCreateDate] DATETIME     NOT NULL,
    [Approved]      INT          NULL,
    [ApprovedBy]    VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[WorkTable]...';


GO
CREATE TABLE [dbo].[WorkTable] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [EmployeeId]    VARCHAR (50) NOT NULL,
    [Department_Id] INT          NOT NULL,
    [CheckInDate]   DATETIME     NOT NULL,
    [CheckOutDate]  DATETIME     NULL,
    [TimeWorked]    INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating unnamed constraint on [dbo].[EmployeeTable]...';


GO
ALTER TABLE [dbo].[EmployeeTable]
    ADD DEFAULT ((37)) FOR [WorkHoursInWeek];


GO
PRINT N'Creating unnamed constraint on [dbo].[EmployeeTable]...';


GO
ALTER TABLE [dbo].[EmployeeTable]
    ADD DEFAULT ((0)) FOR [Role];


GO
PRINT N'Creating unnamed constraint on [dbo].[VacationTable]...';


GO
ALTER TABLE [dbo].[VacationTable]
    ADD DEFAULT (0) FOR [Approved];


GO
PRINT N'Creating unnamed constraint on [dbo].[VacationTable]...';


GO
ALTER TABLE [dbo].[VacationTable]
    ADD DEFAULT (NULL) FOR [ApprovedBy];


GO
PRINT N'Creating [dbo].[FK_AbsentTable_ToUserTable]...';


GO
ALTER TABLE [dbo].[AbsentTable]
    ADD CONSTRAINT [FK_AbsentTable_ToUserTable] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[EmployeeTable] ([EmployeeId]);


GO
PRINT N'Creating [dbo].[FK_AbsentTable_ToDepartmentTable]...';


GO
ALTER TABLE [dbo].[AbsentTable]
    ADD CONSTRAINT [FK_AbsentTable_ToDepartmentTable] FOREIGN KEY ([Department_Id]) REFERENCES [dbo].[DepartmentTable] ([Department_Id]);


GO
PRINT N'Creating [dbo].[FK_EmployeeTable_ToDepartmentTable]...';


GO
ALTER TABLE [dbo].[EmployeeTable]
    ADD CONSTRAINT [FK_EmployeeTable_ToDepartmentTable] FOREIGN KEY ([Department_Id]) REFERENCES [dbo].[DepartmentTable] ([Department_Id]);


GO
PRINT N'Creating [dbo].[FK_VacationTable_ToUserTable]...';


GO
ALTER TABLE [dbo].[VacationTable]
    ADD CONSTRAINT [FK_VacationTable_ToUserTable] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[EmployeeTable] ([EmployeeId]);


GO
PRINT N'Creating [dbo].[FK_VacationTable1_ToDepartmentTable]...';


GO
ALTER TABLE [dbo].[VacationTable]
    ADD CONSTRAINT [FK_VacationTable1_ToDepartmentTable] FOREIGN KEY ([Department_Id]) REFERENCES [dbo].[DepartmentTable] ([Department_Id]);


GO
PRINT N'Creating [dbo].[FK_WorkTable_ToUser]...';


GO
ALTER TABLE [dbo].[WorkTable]
    ADD CONSTRAINT [FK_WorkTable_ToUser] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[EmployeeTable] ([EmployeeId]);


GO
PRINT N'Creating [dbo].[FK_WorkTable_ToDepartmentTable]...';


GO
ALTER TABLE [dbo].[WorkTable]
    ADD CONSTRAINT [FK_WorkTable_ToDepartmentTable] FOREIGN KEY ([Department_Id]) REFERENCES [dbo].[DepartmentTable] ([Department_Id]);


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
PRINT N'Creating [dbo].[spCalender]...';


GO

CREATE PROCEDURE [dbo].[spCalender]
	
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

	SELECT Id AS 'id', StartDate AS 'start', EndDate AS 'end', @Rendering AS rendering, @Color AS color, Note
	FROM dbo.AbsentTable 
	WHERE EmployeeId = @EmpID;
END

IF (@Request = 'DepartmentVacation')
BEGIN
	SET @Color = 'grey';

	DECLARE @Holder INT = (Select Department_Id from EmployeeTable where EmployeeId = @EmpID )

	SELECT Id AS 'id', StartDate AS 'start', EndDate AS 'end', @Rendering AS rendering, @Color AS color 
	FROM dbo.VacationTable 
	WHERE Department_Id = @Holder
	AND Approved = 1;
END

IF (@Request = 'EmployeeVacation')
BEGIN
	SET @Color = 'grey';
	SELECT Id AS 'id', StartDate AS 'start', EndDate AS 'end', @Rendering AS rendering, @Color AS color 
	FROM dbo.VacationTable 
	WHERE EmployeeId = @EmpID
	AND Approved = 1;
END

RETURN
END
GO
PRINT N'Creating [dbo].[spCheckInOut]...';


GO
CREATE PROCEDURE [dbo].[spCheckInOut]

@Username	varchar(50)

AS

DECLARE @Holder INT = (
		SELECT COUNT(EmployeeId) 
		FROM dbo.WorkTable 
		WHERE EmployeeId = @Username AND CheckOutDate IS NULL)

DECLARE @DepartmentIDHolder INT = (
		SELECT Department_Id 
		FROM dbo.EmployeeTable 
		WHERE EmployeeId = @Username)

IF @Holder = 1
	UPDATE dbo.WorkTable
		SET 
		CheckOutDate = CURRENT_TIMESTAMP,
		TimeWorked = DATEDIFF(SECOND, CheckInDate, CURRENT_TIMESTAMP)
		WHERE 1=1
		AND EmployeeId = @Username
		AND CheckOutDate IS NULL

ELSE IF @Holder = 0
	INSERT INTO dbo.WorkTable
		(EmployeeId, Department_Id, CheckInDate)
		VALUES 
		(@Username, @DepartmentIDHolder, CURRENT_TIMESTAMP)

ELSE 
	PRINT 'something went wrong, multiple CheckIn with no CheckOut'
	-- someone should do some error handling.. 
GO
PRINT N'Creating [dbo].[spCheckInStatus]...';


GO
CREATE PROCEDURE [dbo].[spCheckInStatus]

	@USessionId VARCHAR(50)

AS
BEGIN  

    SET NOCOUNT ON; 
	
	DECLARE @CheckedInStatus		INT	= (
		SELECT COUNT(EmployeeId) FROM dbo.WorkTable WHERE EmployeeId = @USessionId AND CheckOutDate IS NULL
		)
	
	DECLARE @LastCheckInDate		DATETIME = (
		SELECT CheckInDate FROM dbo.WorkTable WHERE EmployeeId = @USessionId AND CheckOutDate IS NULL
		)


	DECLARE @WeekBegin DATETIME = DATEADD(wk, 0, DATEADD(DAY, 1-DATEPART(WEEKDAY, GETDATE()), DATEDIFF(dd, 0, GETDATE()))) --first day current week.. starts sunday tho..
	
	DECLARE @SecWorkedLastWeek		INT = (
		SELECT SUM(TimeWorked) FROM dbo.WorkTable WHERE EmployeeId = @USessionId AND CheckOutDate IS NOT NULL 
		AND CheckInDate BETWEEN @WeekBegin AND GETDATE()
		)

	DECLARE @WorkHoursInWeek		INT = (
		SELECT WorkHoursInWeek FROM dbo.EmployeeTable WHERE EmployeeId = @USessionId
		)
	
	SELECT @CheckedInStatus AS CheckedInStatus, @LastCheckInDate AS CheckInDate, 
			@SecWorkedLastWeek AS SecondsWorkedLastWeek, @WorkHoursInWeek AS TargetWorkHours


	--SELECT COUNT(UserName), CAST(CheckInDate AS DATETIME) FROM dbo.CheckInOutTable WHERE UserName = @USessionId AND CheckOutDate IS NULL
	--SELECT COUNT(UserName) AS CheckedInStatus FROM dbo.CheckInOutTable WHERE UserName = @USessionId AND CheckOutDate IS NULL
	--SELECT CheckInDate FROM dbo.CheckInOutTable WHERE UserName = @USessionId AND CheckOutDate IS NULL
	--SELECT SUM(TimeWorked) AS SecondsWorked FROM dbo.CheckInOutTable WHERE UserName = @USessionId AND CheckOutDate IS NOT NULL
RETURN
END
GO
PRINT N'Creating [dbo].[spGetEmployeesBy]...';


GO
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
GO
PRINT N'Creating [dbo].[spGraphDataDepartment]...';


GO
CREATE PROCEDURE [dbo].[spGraphDataDepartment]
	@EmpId VARCHAR(50)
AS

DECLARE @EmpDepId INT = (SELECT Department_Id FROM EmployeeTable WHERE EmployeeId = @EmpId)

DECLARE @EmpsInDep INT = (SELECT COUNT(Id) FROM dbo.EmployeeTable WHERE Department_Id = 3)

SELECT  MonthNumber = DATEPART("mm", DATEADD(MONTH, DATEDIFF(MONTH, 0, CheckOutDate), 0)), 
        SUM(TimeWorked)/@EmpsInDep as AvgSecondsWorked
FROM    WorkTable
WHERE   CheckOutDate >= (CURRENT_TIMESTAMP - 365)
AND     CheckOutDate <= (CURRENT_TIMESTAMP + 365)
AND     CheckOutDate IS NOT NULL
AND		Department_Id = @EmpDepId
GROUP BY DATEADD(MONTH, DATEDIFF(MONTH, 0, CheckOutDate), 0)

RETURN
GO
PRINT N'Creating [dbo].[spGraphDataPersonal]...';


GO
CREATE PROCEDURE [dbo].[spGraphDataPersonal]
	@EmpId VARCHAR(50)
AS


DECLARE @EmpsInDep INT = (SELECT COUNT(Id) FROM dbo.EmployeeTable WHERE Department_Id = 3)

SELECT  MonthNumber = DATEPART("mm", DATEADD(MONTH, DATEDIFF(MONTH, 0, CheckOutDate), 0)), 
        SUM(TimeWorked) as AvgSecondsWorked 
FROM    WorkTable
WHERE   CheckOutDate >= (CURRENT_TIMESTAMP - 365)
AND     CheckOutDate <= (CURRENT_TIMESTAMP + 365)
AND     CheckOutDate IS NOT NULL
AND		EmployeeId = @EmpId
GROUP BY DATEADD(MONTH, DATEDIFF(MONTH, 0, CheckOutDate), 0)

RETURN
GO
PRINT N'Creating [dbo].[spLogin]...';


GO
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


--select case when EXISTS (
-- select 1 
-- from dbo.UserTable
-- where EmployeeId = @EmpID AND EmpPass = @EmpPASS
-- ) then 1 else 0 end




--DECLARE @ReturnVAL INT ;
--SET @ReturnVAL = (SELECT COUNT(Id) FROM dbo.UserTable WHERE EmployeeId = @EmpID AND EmpPass = @EmpPASS)
--SELECT @ReturnVAL;
--RETURN

--DECLARE @EmpDepartment		VARCHAR(50)	= (
--		SELECT Department_Id FROM dbo.EmployeeTable WHERE EmployeeId = @EmpID AND EmpPass = @EmpPASS
--		)

--	Declare @Ucount			int
--	Declare @EmpPassCount	int
--	Declare @returnId		int

--	select @EmpPassCount = COUNT(*) from dbo.EmployeeTable where EmpPass = @EmpPASS
--	select @Ucount = COUNT(*) from dbo.EmployeeTable where EmployeeId = @EmpID


--	if @Ucount = 0
--	begin
--		set @returnId = 0 /* User Does not exist*/
--	end
--	else if @Ucount <> 0  and  @EmpPassCount <> 0
--	begin
--		set @returnId = 1 /* EmpID & EmpPass er good, succes*/
--	end
--	else if @Ucount <> 0  and  @EmpPassCount = 0
--	begin
--		set @returnId = 2 /*forkert password*/
--	end
--	else
--	begin
--		set @returnId = 3 /*fejl*/
--	end

--	SELECT @returnId AS SuccessStatus, @EmpDepartment AS AccountDepartment;
GO
PRINT N'Creating [dbo].[spRequestVacation]...';


GO

CREATE PROCEDURE [dbo].[spRequestVacation]
	@EmpId		VARCHAR(50),
	@StartDate	DATETIME,
	@EndDate	DATETIME
AS
    SET NOCOUNT ON; 

DECLARE @EmpDEP INT = (SELECT Department_Id FROM dbo.EmployeeTable WHERE EmployeeId = @EmpId);


INSERT INTO dbo.VacationTable (EmployeeId, Department_Id, StartDate, EndDate, ReqCreateDate) VALUES (@EmpId, @EmpDEP, @StartDate, @EndDate, CURRENT_TIMESTAMP);
GO
PRINT N'Creating [dbo].[spStatisticsByDepOrEmpId]...';


GO
CREATE PROCEDURE [dbo].[spStatisticsByDepOrEmpId]
	@DepId	INT,
	@EmpId VARCHAR(50)
AS
    SET NOCOUNT ON; 
BEGIN

DECLARE @WeekBegin DATETIME = DATEADD(wk, 0, DATEADD(DAY, 1-DATEPART(WEEKDAY, GETDATE()), DATEDIFF(dd, 0, GETDATE()))) --first day current week.. starts sunday tho..


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
	AND CheckInDate BETWEEN @WeekBegin AND GETDATE()) 
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
	AND CheckInDate BETWEEN @WeekBegin AND GETDATE()) 
	AS SecondsWorkedThisWeek

FROM EmployeeTable as A
WHERE A.EmployeeId = @EmpId
END

END

	--select EmployeeId, Department from EmployeeTable as A left join DepartmentTable as B on A.Department_Id = B.Department_Id
GO
PRINT N'Creating [dbo].[spVacationCurrentRequests]...';


GO
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
AND ReqCreateDate >= (CURRENT_TIMESTAMP - 100)
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
GO
PRINT N'Creating [dbo].[spVacationRequestsGroupedByWeek]...';


GO
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
GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
