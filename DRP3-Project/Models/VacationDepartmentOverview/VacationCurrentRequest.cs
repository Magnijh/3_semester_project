using System;
using System.Diagnostics.CodeAnalysis;

namespace DRP3_Project.Models.VacationDepartmentOverview
{
    public class VacationCurrentRequest
    {
        public int Id { get; set; }
        public string EmployeeId { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public DateTime RequestCreatedDate { get; set; }
        public int Status { get; set; }
        public string ChangedBy { get; set; }

       
    }
}
