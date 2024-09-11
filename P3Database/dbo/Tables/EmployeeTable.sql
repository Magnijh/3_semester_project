CREATE TABLE [dbo].[EmployeeTable] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]       VARCHAR (50)  NOT NULL,
    [LastName]        VARCHAR (50)  NOT NULL,
    [EmployeeId]      VARCHAR (50)  NOT NULL,
    [EmpPass]         VARCHAR (256)  ,
    [Email]           VARCHAR (100) NOT NULL,
    [Department_Id]   INT           NOT NULL,
    [WorkHoursInWeek] INT           DEFAULT ((37)) NOT NULL,
    [Role]            INT           DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([EmployeeId] ASC),
    CONSTRAINT [FK_EmployeeTable_ToDepartmentTable] FOREIGN KEY ([Department_Id]) REFERENCES [dbo].[DepartmentTable] ([Department_Id])
);

