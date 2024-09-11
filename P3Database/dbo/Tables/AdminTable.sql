CREATE TABLE [dbo].[AdminTable]
(
	[Id] INT IDENTITY (1,1) NOT NULL , 
    [EmployeeName] VARCHAR(50) NOT NULL, 
    [EmployeeLastName] VARCHAR(50) NOT NULL, 
    [Role] INT NOT NULL, 
    [Email] VARCHAR(50) NOT NULL, 
    [Department] VARCHAR(50) NOT NULL, 
    [WorkHoursInWeek] INT NOT NULL, 
    PRIMARY KEY ([Id])
)
