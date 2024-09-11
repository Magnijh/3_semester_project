CREATE TABLE [dbo].[WorkTable]
(
	[Id]                INT             NOT NULL   PRIMARY KEY IDENTITY,
    [EmployeeId]        VARCHAR (50)    NOT NULL,
    [Department_Id]     INT             NOT NULL,
    [CheckInDate]       DATETIME        NOT NULL,
    [CheckOutDate]      DATETIME                ,
    [TimeWorked]        INT                     , 
    CONSTRAINT [FK_WorkTable_ToUser] FOREIGN KEY ([EmployeeId]) REFERENCES [EmployeeTable]([EmployeeId]), 
    CONSTRAINT [FK_WorkTable_ToDepartmentTable] FOREIGN KEY ([Department_Id]) REFERENCES [DepartmentTable]([Department_Id]),


)
