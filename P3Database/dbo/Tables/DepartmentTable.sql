CREATE TABLE [dbo].[DepartmentTable] (
    [Department_Id] INT          IDENTITY (1, 1) NOT NULL,
    [Department]    VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_DepartmentTable] PRIMARY KEY CLUSTERED ([Department_Id] ASC)
);
