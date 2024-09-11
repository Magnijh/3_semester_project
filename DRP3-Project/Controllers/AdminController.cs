using Dapper;
using DRP3_Project.Abstraction;
using DRP3_Project.CustomAttributes;
using DRP3_Project.CustomExceptions;
using DRP3_Project.enums;
using DRP3_Project.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using static DataHub.Logic.AdminHandler;

namespace DRP3_Project.Controllers
{
    public class AdminController : Controller
    {
        private readonly IDatabaseStrategy _databaseStrategy;

        public AdminController(IDatabaseStrategy databaseStrategy)
        {
            _databaseStrategy = databaseStrategy;
        }

        [VerifyRights(Role.Asst_Manager, FuncType.AllowHR)]
        public IActionResult Index()
        {
            try
            {
                var DepartmentId = HttpContext.Session.GetInt32("UserDepartment");
                using (var connection = _databaseStrategy.Connection)
                {
                    var data = connection.Query<AdminPageModel_LoadIn>($"EXEC dbo.spGetEmployeesBy @DepId = {DepartmentId}, @EmpId = DoesntMatter");
                    return View(data);
                }
            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error");
            }
        }

        [HttpGet]
        [VerifyRights(Role.Manager, FuncType.DenyHR)]
        public IActionResult Add()
        {
            try
            {
                var deplist = GetDepartmentList();

                ViewBag.DepartmentList = deplist;

                return View(new AdminPageModel());
            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error");
            }
        }

        [HttpPost]
        [VerifyRights(Role.Manager, FuncType.DenyHR)]
        public IActionResult Add(AdminPageModel model)
        {
            try
            {
                ViewBag.ErrorMsg = "";
                var result = model.GenerateNewEmployeeData();

                if(result == true)
                {
                    using (var connection = _databaseStrategy.Connection)
                    {
                        _ = connection.Execute("INSERT INTO dbo.EmployeeTable (FirstName, LastName, EmployeeId, EmpPass, Email, Department_Id, WorkHoursInWeek, Role) VALUES (@Firstname, @Lastname, @EmployeeId, @Password, @Email, @Department_Id, @WorkHoursInWeek, @Role)", model);
                    }
                }
                else
                {
                    return LocalRedirect("/Home/Error");
                }

                return RedirectToAction("Index");

            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error");
            }
        }

        [HttpGet]
        [VerifyRights(Role.Asst_Manager, FuncType.AllowHR)]
        public IActionResult Details(string employeeId)
        {
            try
            {
                using (var connection = _databaseStrategy.Connection)
                {
                    var data = connection.QueryFirstOrDefault<AdminPageModel_LoadIn>($"EXEC dbo.spGetEmployeesBy @DepId = 0, @EmpId = {employeeId}");
                    return View(data);
                }
            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error");
            }
        }

        [HttpGet]
        [VerifyRights(Role.Manager, FuncType.DenyHR)]
        public IActionResult Edit(string employeeId)
        {
            try
            {
                var deplist = GetDepartmentList();
                ViewBag.DepartmentList = deplist;

                using (var connection = _databaseStrategy.Connection)
                {
                    var data = connection.QueryFirstOrDefault<AdminPageModel>($"select * from dbo.EmployeeTable where EmployeeId = '{employeeId}'");
                    return View(data);
                }
            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error");
            }
        }

        [HttpPost]
        [VerifyRights(Role.Manager, FuncType.DenyHR)]
        public IActionResult Edit(AdminPageModel model)
        {
            try
            {
                ViewBag.ErrorMsg = "";

                using (var connection = _databaseStrategy.Connection)
                {
                    _ = connection.Execute(@"Update dbo.EmployeeTable Set FirstName = @Firstname, LastName = @Lastname, Email = @Email, Department_Id = @Department_Id, Role = @Role, WorkHoursInWeek = @WorkHoursInWeek where EmployeeId = @EmployeeId", model);
                }
                return RedirectToAction("Index");
            }
            catch (EmployeeIdAlreadyExistsException)
            {
                ViewBag.ErrorMsg = "The Email already has an account connected";
                return View();
            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error");
            }
        }

        [HttpGet]
        [VerifyRights(Role.Manager, FuncType.DenyHR)]
        public IActionResult Delete(string employeeId)
        {
            try
            {
                using (var connection = _databaseStrategy.Connection)
                {
                    var returnValue = connection.Execute("DELETE from [AbsentTable] WHERE EmployeeId = @EmpId;" +
                                                         "DELETE from [VacationTable] WHERE EmployeeId = @EmpId;" +
                                                         "DELETE from [WorkTable] WHERE EmployeeId = @EmpId;" +
                                                         "DELETE from [EmployeeTable] WHERE EmployeeId = @EmpId", new { EmpId = employeeId });
                }
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error");
            }
        }
    }
}