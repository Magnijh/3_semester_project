CREATE TABLE [dbo].[VacationTable] (
    [Id]            INT          IDENTITY (1, 1) NOT NULL,
    [EmployeeId]    VARCHAR (50) NOT NULL,
    [Department_Id] INT          NOT NULL,
    [StartDate]     DATETIME     NOT NULL,
    [EndDate]       DATETIME     NOT NULL,
    [ReqCreateDate] DATETIME     NOT NULL,
    [Approved]      INT          DEFAULT (0)NULL,
    [ApprovedBy]    VARCHAR (50) DEFAULT (NULL) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_VacationTable_ToUserTable] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[EmployeeTable] ([EmployeeId]),
    CONSTRAINT [FK_VacationTable1_ToDepartmentTable] FOREIGN KEY ([Department_Id]) REFERENCES [dbo].[DepartmentTable] ([Department_Id])
);

