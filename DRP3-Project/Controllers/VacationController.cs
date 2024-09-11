using DRP3_Project.CustomAttributes;
using DRP3_Project.enums;
using DRP3_Project.Models.VacationDepartmentOverview;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using static DataHub.Logic.VacationHandler;

namespace DRP3_Project.Controllers
{
    public class VacationController : Controller
    {
        [VerifyRights(Role.Asst_Manager, FuncType.AllowHR)]
        public IActionResult VacationRequestOverview()
        {
            try
            {
                VacationOverviewData Data = new VacationOverviewData();

                int DepartmentId = (int)HttpContext.Session.GetInt32("UserDepartment");

                var SidebarData = GetVacationRequestsGroupedByWeek(DepartmentId);
                var VacaReqData = GetVacationCurrentRequest(DepartmentId);

                foreach (var item in SidebarData)
                {
                    Data.VacationReqPerWeek.Add(new VacationRequestPerWeek
                    {
                        WeekNumber = item.WeekNum,
                        WeeklyRequests = item.WeeklyRequests
                    });
                }

                foreach (var item in VacaReqData)
                {
                    Data.VacationRequests.Add(new VacationCurrentRequest
                    {
                        Id = item.Id,
                        EmployeeId = item.EmployeeId,
                        Firstname = item.Firstname,
                        Lastname = item.Lastname,
                        StartDate = item.StartDate,
                        EndDate = item.EndDate,
                        RequestCreatedDate = item.ReqCreateDate,
                        Status = item.Status,
                        ChangedBy = item.ChangedBy
                    });
                }

                Data.VacationRequests.Reverse();

                return View(Data);
            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error"); ;
            }
        }


        [VerifyRights(Role.Asst_Manager, FuncType.AllowHR)]
        public IActionResult VacationRequestOverviewCalendar()
        {
            return PartialView();
        }


        [VerifyRights(Role.Asst_Manager, FuncType.DenyHR)]
        public IActionResult ChangeVacationStatus(int id, int NewStatus)
        {
            try
            {
            string ChangedByUserId = HttpContext.Session.GetString("UserSessionId");
            ChangeVacationStatusDatabase(id, NewStatus, ChangedByUserId); //datahub func

            return LocalRedirect("/Vacation/VacationRequestOverview");
            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error"); ;
            }
        }

        // Request vacation controller is home because yes.
         
        //public IActionResult _RequestVacation()
        //{
        //    if (HttpContext.Session.GetString("UserSessionId") == null) //checks for login cookie
        //    {
        //        return LocalRedirect("/Account/Login");
        //    }
        //    return PartialView();
        //}

        //[HttpPost]
        //public IActionResult _RequestVacation(VacationRequestModel model)
        //{
        //    // Validate login
        //    if (HttpContext.Session.GetString("UserSessionId") == null) //checks for login cookie
        //    {
        //        return LocalRedirect("/Account/Login");
        //    }

        //    // Validate model
        //    if (ModelState.IsValid == false)
        //    {
        //        return View();
        //    }

        //    // Post request
        //    //NewVacationRequest(model.employeeID, model.department, model.startDate, model.endDate);

        //    ViewData["test"] = model.startDate; // for testing...

        //    // Redirect
        //    // return LocalRedirect("/");
        //    return View();
        //}
    }
}