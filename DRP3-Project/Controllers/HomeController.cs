using ClosedXML.Excel;
using DRP3_Project.CustomAttributes;
using DRP3_Project.enums;
using DRP3_Project.Models;
using FullcalendarMvcApp;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using static DataHub.Logic.CalenderHandler;
using static DataHub.Logic.StatisticsHandler;
using static DataHub.Logic.VacationHandler;

namespace DRP3_Project.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

       
        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }


        [VerifyRights(Role.Worker, FuncType.AllowHR)]
        public IActionResult Privacy()
        {
            return View();
        }


        [VerifyRights(Role.Worker, FuncType.AllowHR)]
        public IActionResult Absent()
        {
            return View();
        }


        [HttpGet]
        [VerifyRights(Role.Worker, FuncType.AllowHR)]
        public IActionResult Schedule()
        {
            return View(new EventViewModel());
        }


        public string GetWorkHourCalendar()
        {
            try
            {
                string USID = HttpContext.Session.GetString("UserSessionId");
                string[] databaselocation = { "EmployeeWorkHours", "EmployeeAbsence", "EmployeeVacation" };
                var CalendarEvents = new List<EventViewModel>();

                for (int i = 0; i <= 2; i++ ) {
                    var val = NewCalenderData(USID, databaselocation[i]);
                    IList<EventViewModel> ListofObject = JsonConvert.DeserializeObject<IList<EventViewModel>>(val);
                    foreach(var insideValue in ListofObject)
                    {
                        string ToTitle = "";

                        if (i == 0) {
                            TimeSpan Diff = insideValue.end - insideValue.start;
                            ToTitle = string.Format("Worked {0} hours, {1} min", Diff.Hours, Diff.Minutes);  }
                        else if (i == 1) { ToTitle = insideValue.Note; }
                        else if (i == 2) { ToTitle = "On Vacation"; insideValue.end = insideValue.end.AddDays(1); }


                        CalendarEvents.Add(new EventViewModel()
                        {
                            title = ToTitle,
                            id = insideValue.id,
                            start = insideValue.start,
                            end = insideValue.end,
                            rendering = insideValue.rendering,
                            color = insideValue.color

                        });

                        

                    }
                }
                string SendingEvents = JsonConvert.SerializeObject(CalendarEvents, Formatting.Indented);
                return SendingEvents;
            }
            catch (Exception)
            {
                return "[]";
            }
        }


        public string GetEvents(DateTime start, DateTime end)
        {
            string USID = HttpContext.Session.GetString("UserSessionId");
            //int USDEP = HttpContext.Session.GetInt32("UserDepartment");

            /*Can be callede with: EmployeeWorkHours , EmployeeAbsence , EmployeeVacation , DepartmentVacation*/
            var val = NewCalenderData(USID, "DepartmentVacation");
            IList<EventViewModel> ListofVacationsAccepted = JsonConvert.DeserializeObject<IList<EventViewModel>>(val);

            int[] arrayofpeople = new int[43];
            foreach (var needtochange in ListofVacationsAccepted)
            {

                if (needtochange.start <= end && needtochange.end >= start)
                {
                    for (int i = 0; i <= 42; i++)
                    {
                        if (needtochange.start == start.AddDays(i))
                        {

                            for (int j = i; j <= 42; j++)
                            {
                                if (needtochange.end >= start.AddDays(j))
                                {
                                    arrayofpeople[j] = arrayofpeople[j] + 1;
                                }
                            }
                            break;

                        }
                    }
                }
            }
            var EventsForCalendar = new List<EventViewModel>();


            for (int i = 0; i <= 41; i++)
            {
                if (arrayofpeople[i] != 0)
                {
                    int j = i + 1;
                    if (arrayofpeople[i] == arrayofpeople[j] && start.AddDays(i).DayOfWeek != DayOfWeek.Sunday && start.AddDays(i).DayOfWeek != DayOfWeek.Saturday)
                    {

                        while (arrayofpeople[i] == arrayofpeople[j] && start.AddDays(j).DayOfWeek != DayOfWeek.Sunday && start.AddDays(j).DayOfWeek != DayOfWeek.Saturday)
                        {
                            j++;
                        }

                        EventsForCalendar.Add(new EventViewModel()
                        {
                            title = $"On vacation: {arrayofpeople[i]}",
                            id = i,
                            start = start.AddDays(i),

                            end = start.AddDays(j),
                            rendering = "background",
                            color = "green",
                            allDay = true

                        });
                        i = j - 1;
                    }
                    else if (start.AddDays(i).DayOfWeek != DayOfWeek.Sunday && start.AddDays(i).DayOfWeek != DayOfWeek.Saturday)
                    {

                        EventsForCalendar.Add(new EventViewModel()
                        {
                            title = $"On vacation: {arrayofpeople[i]}",
                            id = i,
                            start = start.AddDays(i),

                            end = start.AddDays(i),
                            rendering = "background",
                            color = "green",
                            allDay = true

                        });
                    }
                    else { }
                }
                else { }
            }
            string EventsToString = JsonConvert.SerializeObject(EventsForCalendar, Formatting.Indented);

            return EventsToString;
        }

       
        [VerifyRights(Role.Asst_Manager, FuncType.AllowHR)]
        public IActionResult Statistics()
        {
            try
            {
                // nullable int (int?) is a little weird..
                var DepId = Convert.ToInt32(HttpContext.Session.GetInt32("UserDepartment"));

                var data = GetDepartmentStatistics(DepId);
                return View(data);
            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error"); ;
            }
        }


        [VerifyRights(Role.Asst_Manager, FuncType.AllowHR)]
        public IActionResult Excel()
        {
            var DepId = Convert.ToInt32(HttpContext.Session.GetInt32("UserDepartment"));

            var data = GetDepartmentStatistics(DepId);
            Debug.WriteLine("test");
            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("Migatronic");
                var currentRow = 1;
                
                worksheet.Cell(currentRow, 1).Value = "ID";
                worksheet.Cell(currentRow, 2).Value = "First name";
                worksheet.Cell(currentRow, 3).Value = "Last name";
                worksheet.Cell(currentRow, 4).Value = "Role";
                worksheet.Cell(currentRow, 5).Value = "Hours per / week";
                worksheet.Cell(currentRow, 6).Value = "Average hours per / check in";
                worksheet.Cell(currentRow, 7).Value = "Hours worked this week";
                worksheet.Row(1).Height = 33;
                worksheet.Columns(1,7).Width = 13.3;
                worksheet.Row(1).Style.Alignment.WrapText = true;
                worksheet.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;

                foreach (var user in data)
                {
                    currentRow++;
                    worksheet.Cell(currentRow, 1).Value = user.EmployeeId;
                    worksheet.Cell(currentRow, 2).Value = user.FirstName;
                    worksheet.Cell(currentRow, 3).Value = user.LastName;
                    worksheet.Cell(currentRow, 4).Value = user.Role;
                    worksheet.Cell(currentRow, 5).Value = TimeSpan.FromHours(user.WorkHoursInWeek);
                    //if (TimeSpan.FromHours(user.WorkHoursInWeek) >= TimeSpan.FromSeconds(user.SecondsWorkedThisWeek)){ 
                    //    worksheet.Cell(currentRow, 7).Style.Fill.SetBackgroundColor(XLColor.Red);
                    //}
                    worksheet.Cell(currentRow, 6).Value = TimeSpan.FromSeconds(user.AverageSecondsPerCheckIn);
                    worksheet.Cell(currentRow, 7).Value = TimeSpan.FromSeconds(user.SecondsWorkedThisWeek);
                }

                using (var stream = new MemoryStream())
                {
                    workbook.SaveAs(stream);
                    var content = stream.ToArray();

                    return File(
                        content,
                        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                        "users.xlsx");
                }
            }
           
        }





        [VerifyRights(Role.Worker, FuncType.AllowHR)]
        public IActionResult PersonalStatistics()
        {
            try
            {
                var EmpId = HttpContext.Session.GetString("UserSessionId");
                var Data = GetAbsenceByEmpId(EmpId);
                return View(Data);
            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error"); ;
            }
        }


        public IActionResult HRError()
        {
            return View();
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }



        [HttpPost]
        [VerifyRights(Role.Worker, FuncType.AllowHR)]
        public IActionResult RequestVacation(DateTime txtStartDate, DateTime txtEndDate)
        {
            try
            {
                DateTime startDate = txtStartDate;
                DateTime endDate = txtEndDate;
                string employeeID = HttpContext.Session.GetString("UserSessionId");

                // Validate model
                if (ModelState.IsValid == false)
                {
                    return LocalRedirect("/Home/Schedule");
                }

                NewVacationRequest(employeeID, startDate, endDate);

                

                return LocalRedirect("/Home/Schedule");
            }
            catch (Exception)
            {
                return LocalRedirect("/Home/Error"); ;
            }
        }
    }  
}