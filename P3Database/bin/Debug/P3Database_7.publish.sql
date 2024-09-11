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
PRINT N'Creating [dbo].[CheckInOutTable]...';


GO
CREATE TABLE [dbo].[CheckInOutTable] (
    [Id]           INT          IDENTITY (1, 1) NOT NULL,
    [UserName]     VARCHAR (50) NOT NULL,
    [CheckInDate]  DATETIME     NOT NULL,
    [CheckOutDate] DATETIME     NULL,
    [TimeWorked]   INT          NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UserTable]...';


GO
CREATE TABLE [dbo].[UserTable] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [EmployeeId] VARCHAR (50)  NOT NULL,
    [EmpPass]    VARCHAR (50)  NOT NULL,
    [Email]      VARCHAR (100) NULL,
    [Department] VARCHAR (50)  NULL,
    [Role]       INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating unnamed constraint on [dbo].[UserTable]...';


GO
ALTER TABLE [dbo].[UserTable]
    ADD DEFAULT ((1)) FOR [Role];


GO
PRINT N'Creating [dbo].[spCheckInOut]...';


GO
CREATE PROCEDURE [dbo].[spCheckInOut]

@Username	varchar(50)

AS

DECLARE @Holder INT = (
		SELECT COUNT(UserName) 
		FROM dbo.CheckInOutTable 
		WHERE UserName = @Username AND CheckOutDate IS NULL)

IF @Holder = 1
	UPDATE dbo.CheckInOutTable
		SET 
		CheckOutDate = CURRENT_TIMESTAMP,
		TimeWorked = DATEDIFF(SECOND, CheckInDate, CURRENT_TIMESTAMP)
		WHERE 1=1
		AND UserName = @Username
		AND CheckOutDate IS NULL

ELSE IF @Holder = 0
	INSERT INTO dbo.CheckInOutTable
		(UserName, CheckInDate)
		VALUES 
		(@Username, CURRENT_TIMESTAMP)

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
	
	DECLARE @CheckedInStatus		VARCHAR(50)	= (
		SELECT UserName FROM dbo.CheckInOutTable WHERE UserName = @USessionId AND CheckOutDate IS NULL
		)
	
	DECLARE @LastCheckInDate		DATETIME = (
		SELECT CheckInDate FROM dbo.CheckInOutTable WHERE UserName = @USessionId AND CheckOutDate IS NULL
		)
	
	DECLARE @SecWorkedLastWeek		INT = (
		SELECT SUM(TimeWorked) FROM dbo.CheckInOutTable WHERE UserName = @USessionId AND CheckOutDate IS NOT NULL
		)
	
	SELECT @CheckedInStatus AS CheckedInStatus, @LastCheckInDate AS CheckInDate, @SecWorkedLastWeek AS SecondsWorkedLastWeek
	--SELECT COUNT(UserName), CAST(CheckInDate AS DATETIME) FROM dbo.CheckInOutTable WHERE UserName = @USessionId AND CheckOutDate IS NULL
	--SELECT COUNT(UserName) AS CheckedInStatus FROM dbo.CheckInOutTable WHERE UserName = @USessionId AND CheckOutDate IS NULL
	--SELECT CheckInDate FROM dbo.CheckInOutTable WHERE UserName = @USessionId AND CheckOutDate IS NULL
	--SELECT SUM(TimeWorked) AS SecondsWorked FROM dbo.CheckInOutTable WHERE UserName = @USessionId AND CheckOutDate IS NOT NULL
RETURN
END
GO
PRINT N'Creating [dbo].[spLogin]...';


GO
CREATE PROCEDURE [dbo].[spLogin]
(
@EmpID		VARCHAR(50),
@EmpPASS	VARCHAR(50)
)
AS

SET NOCOUNT ON


begin
	Declare @Ucount			int
	Declare @EmpPassCount	int
	Declare @returnId		int

	select @EmpPassCount = COUNT(*) from dbo.UserTable where EmpPass = @EmpPASS
	select @Ucount = COUNT(*) from dbo.UserTable where EmployeeId = @EmpID


	if @Ucount = 0
	begin
		set @returnId = 0 /* User Does not exist*/
	end
	else if @Ucount <> 0  and  @EmpPassCount <> 0
	begin
		set @returnId = 1 /* EmpID & EmpPass er good, succes*/
	end
	else if @Ucount <> 0  and  @EmpPassCount = 0
	begin
		set @returnId = 2 /*forkert password*/
	end
	else
	begin
		set @returnId = 3 /*fejl*/
	end

	SELECT @returnId;
end


--select case when EXISTS (
-- select 1 
-- from dbo.UserTable
-- where EmployeeId = @EmpID AND EmpPass = @EmpPASS
-- ) then 1 else 0 end




--DECLARE @ReturnVAL INT ;
--SET @ReturnVAL = (SELECT COUNT(Id) FROM dbo.UserTable WHERE EmployeeId = @EmpID AND EmpPass = @EmpPASS)
--SELECT @ReturnVAL;
--RETURN
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
