using Dapper;
using DRP3_Project.Abstraction;
using DRP3_Project.CustomAttributes;
using DRP3_Project.enums;
using DRP3_Project.Models;
using Microsoft.AspNetCore.Mvc;
using System;

namespace DRP3_Project.Controllers
{
    public class AdminPageDepartmentController : Controller
    {
        private readonly IDatabaseStrategy _databaseStrategy;

        public AdminPageDepartmentController(IDatabaseStrategy databaseStrategy)
        {
            _databaseStrategy = databaseStrategy;
        }

        //public IActionResult Index()
        //{
        //    return View();
        //}

        [HttpGet]
        [VerifyRights(Role.Manager, FuncType.DenyHR)]
        public IActionResult AddDepartment()
        {
            return View(new AdminPageDepartmentModel());
        }

        [HttpPost]
        [VerifyRights(Role.Manager, FuncType.DenyHR)]
        public IActionResult AddDepartment(AdminPageDepartmentModel model)
        {
            try
            {
                using (var connection = _databaseStrategy.Connection)
                {
                    _ = connection.Execute("insert into [DepartmentTable](Department)" + "values (@Department)", model);
                }
                return LocalRedirect("~/Admin/Index");
            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error");
            }
        }
    }
}