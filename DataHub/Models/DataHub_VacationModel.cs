using System;
using System.Collections.Generic;
using System.Text;

namespace DataHub.Models
{
    public class DataHub_RequestVacationModel
    {
        public string EmployeeID { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
    }
}
