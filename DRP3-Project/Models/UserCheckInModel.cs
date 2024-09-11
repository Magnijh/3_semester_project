using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace DRP3_Project.Models
{
   //testing model.. fix later
    public class CheckInModel
    {
        public string SessionId { get; set; }
    }

    public class LoadCheckInOutModel
    {

        public string EmployeeId { get; set; }

        public DateTime CheckInDate { get; set; }

        public DateTime CheckOutDate { get; set; }

        public int TimeWorked { get; set; }

    }

    public class CheckInStatusModel
    {
        public string UserName { get; set; }
        public int CheckedInStatus { get; set; }
        public DateTime CheckInDate { get; set; }
        public int SecondsWorkedLastWeek { get; set; }
        public int TargetWorkHours { get; set; }
    }

    

}
