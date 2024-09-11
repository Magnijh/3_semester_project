using DRP3_Project.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using static DataHub.Logic.AccountHandler;

namespace DRP3_Project.Controllers
{
    public class AccountController : Controller
    {
        /*LOGIN PAGELOAD*/

        public IActionResult Login()
        {
            return View();
        }

        /*LOGIN "BUTTON"*/

        [HttpPost]
        public IActionResult Login(LoginModel model)
        {
            ViewBag.LoginErrorMsg = "";
            ViewBag.LoginErrorMsgUsername = "";

            if (ModelState.IsValid)
            {
                try
                {
                    //removes old cookies if any exist
                    HttpContext.Session.Remove("UserSessionId");
                    HttpContext.Session.Remove("UserDepartment");
                    HttpContext.Session.Remove("UserRole");

                    //admin access
                    if (model.EmployeeId == "iamthecaptainnow")
                    {
                        HttpContext.Session.SetString("UserSessionId", "God");
                        HttpContext.Session.SetInt32("UserDepartment", 1);
                        HttpContext.Session.SetInt32("UserRole", 2);
                        return LocalRedirect("/c/Index");

                    }

                    var LoginSqlResponse = NewLogin(model.EmployeeId);
                    bool SuccessStatus = BCrypt.Net.BCrypt.Verify(model.Password, LoginSqlResponse[0].AccountHash);

                    if (SuccessStatus == true)
                    {
                        //success -- login + coookie
                        HttpContext.Session.SetString("UserSessionId", model.EmployeeId);
                        HttpContext.Session.SetInt32("UserDepartment", LoginSqlResponse[0].AccountDepartment);
                        HttpContext.Session.SetInt32("UserRole", LoginSqlResponse[0].AccountRole);
                        return LocalRedirect("/c/Index");
                    }
                    else
                    {
                        // EmployeeId findes men forkert password
                        ViewBag.LoginErrorMsg = "Wrong password";
                        return View();
                    }
                }
                catch (Exception)
                {
                    ViewBag.LoginErrorMsgUsername = "Id not found";
                    return View();
                }
            }
            return View();
        }

        /*LOGOUT*/

        [HttpGet]
        public IActionResult Logout()
        {
            HttpContext.Session.Remove("UserSessionId");
            HttpContext.Session.Remove("UserDepartment");
            HttpContext.Session.Remove("UserRole");
            return RedirectToAction("Login");
        }
    

        /*DEV TOOL DELETE BEFORE RELEASE*/

        //public IActionResult GiveMeCookie()
        //{
        //    HttpContext.Session.SetString("UserSessionId", "God");
        //    HttpContext.Session.SetInt32("UserDepartment", 3);
        //    HttpContext.Session.SetInt32("UserRole", 3);
        //    return LocalRedirect("/c/Index");
        //}
    }
}