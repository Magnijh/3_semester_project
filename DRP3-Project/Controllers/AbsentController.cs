using DRP3_Project.CustomAttributes;
using DRP3_Project.enums;
using DRP3_Project.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using static DataHub.Logic.AbsentHandler;

namespace DRP3_Project.Controllers
{
    public class AbsentController : Controller
    {
        [VerifyRights(Role.Worker, FuncType.AllowHR)]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [VerifyRights(Role.Worker, FuncType.AllowHR)]
        public IActionResult RequestAbsence(AbsentModel model)
        {
            try
            {
                // Validate model
                if (ModelState.IsValid == false)
                {
                    return LocalRedirect("/Home/Schedule");
                }

                var SessionId = HttpContext.Session.GetString("UserSessionId");

                // New Absent() Throws Error: SqlDateTime overflow. Must be between 1/1/1753 12:00:00 AM and 12/31/9999
                NewAbsent(SessionId, model.StartDate, model.EndDate, model.Reason);

                return LocalRedirect("/C/Index");
            }
            catch (System.Exception)
            {
                return LocalRedirect("/Home/Error");
            }
        }
    }
}