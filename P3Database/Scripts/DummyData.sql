/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
/*  COPY INTO QUERY TO INSERT DUMMY DATA  */


--SET IDENTITY_INSERT [dbo].[DepartmentTable] ON
--INSERT INTO [dbo].[DepartmentTable] ([Department_Id], [Department]) VALUES (2002, N'Sales')
--INSERT INTO [dbo].[DepartmentTable] ([Department_Id], [Department]) VALUES (2003, N'Marketing')
--SET IDENTITY_INSERT [dbo].[DepartmentTable] OFF

--SET IDENTITY_INSERT [dbo].[EmployeeTable] ON
--INSERT INTO [dbo].[EmployeeTable] ([Id], [FirstName], [LastName], [EmployeeId], [EmpPass], [Email], [Department_Id], [WorkHoursInWeek], [Role]) VALUES (1005, N'Hanne', N'Georgesen', N'hg', N'$2a$11$.9K5LJfwZTz0eK1czotwMug8ARZ4AaQ2ijk4Vsb8ZRERWPFbwTkIi', N'hg@mail.dk', 2002, 37, 1)
--INSERT INTO [dbo].[EmployeeTable] ([Id], [FirstName], [LastName], [EmployeeId], [EmpPass], [Email], [Department_Id], [WorkHoursInWeek], [Role]) VALUES (1002, N'John', N'Nielsen', N'jn', N'$2a$11$7I2TubAyAUJxPqe.UiO5Tu4htc4Z7ycOC0GEeLQIzfC1SIMKHXubC', N'jn@mail.dk', 2002, 37, 2)
--INSERT INTO [dbo].[EmployeeTable] ([Id], [FirstName], [LastName], [EmployeeId], [EmpPass], [Email], [Department_Id], [WorkHoursInWeek], [Role]) VALUES (1003, N'Kirsten', N'Petersen', N'kp', N'$2a$11$eTckFbI/YHzbVoJdTzFX1exUMFqK6W5b/yw2xzPQyMXETiNq0jD02', N'kp@mail.dk', 2002, 37, 0)
--INSERT INTO [dbo].[EmployeeTable] ([Id], [FirstName], [LastName], [EmployeeId], [EmpPass], [Email], [Department_Id], [WorkHoursInWeek], [Role]) VALUES (1006, N'Kasper', N'Scheel', N'ks', N'$2a$11$F3exRjlQu0nkOs89v3.XAe.zZyvuoaA6jfDg7yWbXHgv3A0zgrtgG', N'ks@mail.dk', 2002, 37, 0)
--INSERT INTO [dbo].[EmployeeTable] ([Id], [FirstName], [LastName], [EmployeeId], [EmpPass], [Email], [Department_Id], [WorkHoursInWeek], [Role]) VALUES (1007, N'Ole', N'Iversen', N'oi', N'$2a$11$J5sXwKpCUsv1b8eCchb0j.L6a1l9IDQLOdd.McYJ2tO3Qrb.c7jty', N'oi@mail.dk', 2002, 37, 3)
--INSERT INTO [dbo].[EmployeeTable] ([Id], [FirstName], [LastName], [EmployeeId], [EmpPass], [Email], [Department_Id], [WorkHoursInWeek], [Role]) VALUES (1004, N'Peter', N'Hansen', N'ph', N'$2a$11$Ctoh/5qk6l/Hq4MDUB2U3uP8YyfcMQDD4pbKNg7StPtrRPajkyK.2', N'ph@mail.dk', 2002, 37, 0)
--SET IDENTITY_INSERT [dbo].[EmployeeTable] OFF

--SET IDENTITY_INSERT [dbo].[WorkTable] ON
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6003, N'jn', 2002, N'2020-12-09 08:03:34', N'2020-12-09 15:03:36', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6004, N'hg', 2002, N'2020-12-09 08:07:35', N'2020-12-09 15:07:36', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6005, N'kp', 2002, N'2020-12-09 08:07:52', N'2020-12-09 15:07:53', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6006, N'ks', 2002, N'2020-12-09 08:08:10', N'2020-12-09 15:08:11', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6008, N'oi', 2002, N'2020-12-09 08:08:38', N'2020-12-09 15:08:39', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6009, N'ph', 2002, N'2020-12-09 08:08:49', N'2020-12-09 15:08:50', 25200)
																																															
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6010, N'jn', 2002, N'2020-12-10 08:03:34', N'2020-12-10 15:03:36', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6011, N'hg', 2002, N'2020-12-10 08:07:35', N'2020-12-10 15:07:36', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6012, N'kp', 2002, N'2020-12-10 08:07:52', N'2020-12-10 15:07:53', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6013, N'ks', 2002, N'2020-12-10 08:08:10', N'2020-12-10 15:08:11', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6015, N'oi', 2002, N'2020-12-10 08:08:38', N'2020-12-10 15:08:39', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6016, N'ph', 2002, N'2020-12-10 08:08:49', N'2020-12-10 15:08:50', 25200)
																																															
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6017, N'jn', 2002, N'2020-12-11 08:03:34', N'2020-12-11 15:03:36', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6018, N'hg', 2002, N'2020-12-11 08:07:35', N'2020-12-11 15:07:36', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6019, N'kp', 2002, N'2020-12-11 08:07:52', N'2020-12-11 15:07:53', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6020, N'ks', 2002, N'2020-12-11 08:08:10', N'2020-12-11 15:08:11', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6022, N'oi', 2002, N'2020-12-11 08:08:38', N'2020-12-11 15:08:39', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6023, N'ph', 2002, N'2020-12-11 08:08:49', N'2020-12-11 15:08:50', 25200)
																																															
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6024, N'jn', 2002, N'2020-12-14 08:03:34', N'2020-12-14 15:03:36', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6025, N'hg', 2002, N'2020-12-14 08:07:35', N'2020-12-14 15:07:36', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6026, N'kp', 2002, N'2020-12-14 08:07:52', N'2020-12-14 15:07:53', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6027, N'ks', 2002, N'2020-12-14 08:08:10', N'2020-12-14 15:08:11', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6029, N'oi', 2002, N'2020-12-14 08:08:38', N'2020-12-14 15:08:39', 25200)
--INSERT INTO [dbo].[WorkTable] ([Id], [EmployeeId], [Department_Id], [CheckInDate], [CheckOutDate], [TimeWorked]) VALUES (6030, N'ph', 2002, N'2020-12-14 08:08:49', N'2020-12-14 15:08:50', 25200)
--SET IDENTITY_INSERT [dbo].[WorkTable] OFF

--SET IDENTITY_INSERT [dbo].[VacationTable] ON
--INSERT INTO [dbo].[VacationTable] ([Id], [EmployeeId], [Department_Id], [StartDate], [EndDate], [ReqCreateDate], [Approved], [ApprovedBy]) VALUES (3004, N'jn', 2002, N'2020-12-23 00:00:00', N'2020-12-31 00:00:00', N'2020-12-14 12:44:10', 1, N'jn')
--INSERT INTO [dbo].[VacationTable] ([Id], [EmployeeId], [Department_Id], [StartDate], [EndDate], [ReqCreateDate], [Approved], [ApprovedBy]) VALUES (3005, N'oi', 2002, N'2020-12-22 00:00:00', N'2020-12-24 00:00:00', N'2020-12-14 12:56:10', 1, N'jn')
--INSERT INTO [dbo].[VacationTable] ([Id], [EmployeeId], [Department_Id], [StartDate], [EndDate], [ReqCreateDate], [Approved], [ApprovedBy]) VALUES (3006, N'hg', 2002, N'2020-12-15 00:00:00', N'2021-01-02 00:00:00', N'2020-12-14 12:57:52', 2, N'jn')
--INSERT INTO [dbo].[VacationTable] ([Id], [EmployeeId], [Department_Id], [StartDate], [EndDate], [ReqCreateDate], [Approved], [ApprovedBy]) VALUES (3007, N'ks', 2002, N'2020-12-22 00:00:00', N'2020-12-25 00:00:00', N'2020-12-14 12:59:37', 0, NULL)
--INSERT INTO [dbo].[VacationTable] ([Id], [EmployeeId], [Department_Id], [StartDate], [EndDate], [ReqCreateDate], [Approved], [ApprovedBy]) VALUES (3008, N'ks', 2002, N'2020-12-30 00:00:00', N'2020-12-31 00:00:00', N'2020-12-14 12:59:46', 0, NULL)
--SET IDENTITY_INSERT [dbo].[VacationTable] OFF

--SET IDENTITY_INSERT [dbo].[AbsentTable] ON
--INSERT INTO [dbo].[AbsentTable] ([Id], [EmployeeId], [Department_Id], [StartDate], [EndDate], [Note]) VALUES (2002, N'jn', 2002, N'2020-12-02 12:41:47', N'2020-12-02 12:41:47', N'Doctors appointment')
--INSERT INTO [dbo].[AbsentTable] ([Id], [EmployeeId], [Department_Id], [StartDate], [EndDate], [Note]) VALUES (2003, N'jn', 2002, N'2020-11-17 00:00:00', N'2020-11-20 00:00:00', N'Work related accident')
--SET IDENTITY_INSERT [dbo].[AbsentTable] OFF

