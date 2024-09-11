CREATE TABLE [dbo].[AbsentTable]
(
	[Id]         INT            IDENTITY (1, 1) NOT NULL,
    [EmployeeId] VARCHAR (50)   NOT NULL,
    [Department_Id] INT         NOT NULL,
    [StartDate]  DATETIME       NOT NULL,
    [EndDate]    DATETIME       NOT NULL,
    [Note]       VARCHAR (200)  NOT NULL, 
    CONSTRAINT [PK_AbsentTable] PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_AbsentTable_ToUserTable] FOREIGN KEY ([EmployeeId]) REFERENCES [EmployeeTable]([EmployeeId]), 
    CONSTRAINT [FK_AbsentTable_ToDepartmentTable] FOREIGN KEY ([Department_Id]) REFERENCES [DepartmentTable]([Department_Id]),
)
