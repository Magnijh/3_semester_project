using DRP3_Project.CustomAttributes;
using DRP3_Project.enums;
using DRP3_Project.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using static DataHub.Logic.CheckInOutHandler;

namespace DRP3_Project.Controllers
{
    public class CController : Controller
    {
        /*CHECK IN/OUT PAGELOAD*/

        [HttpGet]
        [VerifyRights(Role.Worker, FuncType.AllowHR)]
        public IActionResult Index()
        {
            try
            {
                CheckButtonState(HttpContext.Session.GetString("UserSessionId")); //Local function
                return View();
            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error");
            }
        }

        /*CHECK IN/OUT "BUTTON"*/

        [HttpPost]
        [VerifyRights(Role.Worker, FuncType.AllowHR)]
        public IActionResult Index(CheckInModel model)
        {
            try
            {
                string USID = HttpContext.Session.GetString("UserSessionId"); //get User session cookie containing username
                
                NewCheckInOut(USID); //goes to function in datahub
                CheckButtonState(USID); // local function
                return View();
            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error");
            }
        }

        /*DISPLAYS FULL CHECK IN/OUT DATABASE*/

        [HttpGet]
        [VerifyRights(Role.Asst_Manager, FuncType.AllowHR)]
        public ActionResult DVLoadCheckInOutList()
        {
            try
            {
                var data = LoadCheckInOut();
                List<LoadCheckInOutModel> CheckInOutList = new List<LoadCheckInOutModel>();

                foreach (var row in data)
                {
                    CheckInOutList.Add(new LoadCheckInOutModel
                    {
                        EmployeeId = row.EmployeeId,
                        CheckInDate = row.CheckInDate,
                        CheckOutDate = row.CheckOutDate,
                        TimeWorked = row.TimeWorked
                    });
                }

                CheckInOutList.Reverse();

                return View(CheckInOutList);
            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error");
            }
        }

        /*Updates the check in page information depending on check in/out status*/

        private void CheckButtonState(string USID)
        {
            var data = EmpCheckInStatus(USID);
            List<CheckInStatusModel> TempData = new List<CheckInStatusModel>();

            foreach (var row in data)
            {
                TempData.Add(new CheckInStatusModel
                {
                    CheckedInStatus = row.CheckedInStatus,
                    CheckInDate = row.CheckInDate,
                    SecondsWorkedLastWeek = row.SecondsWorkedLastWeek,
                    TargetWorkHours = row.TargetWorkHours
                });
            }

            if (TempData[0].CheckedInStatus != 0)
                ViewData["CheckedInTime"] = "Checked in at " + TempData[0].CheckInDate;
            else
                ViewData["CheckedInTime"] = null;

            /*ProgressBar...*/
            double MathPartOne = 3600 * TempData[0].TargetWorkHours;
            double MathPartTwo = TempData[0].SecondsWorkedLastWeek / MathPartOne;
            System.Diagnostics.Debug.WriteLine(MathPartOne + "--" + MathPartTwo);
            double TempDouble = MathPartTwo * 100;
            // OLD doesnt work because the "()" fucks up, idk; 100 * (TempData[0].SecondsWorkedLastWeek / (TempData[0].TargetWorkHours * 60*60));
            if (TempDouble <= 99 && TempDouble >= 0)
                ViewData["ProgressBarLoad"] = Math.Round(TempDouble).ToString("G");
            else if (TempDouble >= 100 && TempDouble <= 999)
                ViewData["ProgressBarLoad"] = "100";
            else
                ViewData["ProgressBarLoad"] = "0";

            /*Button state*/
            if (TempData[0].CheckedInStatus != 0) // User is checked in
            {
                ViewData["CheckedStatus"] = "Check out";
                ViewData["BtnColour"] = "#ffc230";
            }
            else if (TempData[0].CheckedInStatus == 0) // User is checked out
            {
                ViewData["CheckedStatus"] = "Check in";
                ViewData["BtnColour"] = "#008A46";
            }
            else
            {
                ViewData["CheckedStatus"] = "Check in/out"; // error
                ViewData["BtnColour"] = "#008A46";
            }
        }
    }
}