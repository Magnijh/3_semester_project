using System;

namespace DataHub.Models.DataHub_VacationDepartmentOverview
{
    public class DataHub_VacationCurrentRequest
    {
        public int Id { get; set; }
        public string EmployeeId { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public DateTime ReqCreateDate { get; set; }
        public int Status { get; set; }
        public string ChangedBy { get; set; }

    }
}
