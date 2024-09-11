using System;
using System.ComponentModel.DataAnnotations;

namespace DRP3_Project.Models
{
    public class AbsentModel
    {
        [DataType(DataType.Text)]
        public string EmployeeID { get; set; }

        [DataType(DataType.DateTime)]
        public DateTime StartDate { get; set; } = DateTime.UtcNow.AddHours(1);

        [DataType(DataType.DateTime)]
        public DateTime EndDate { get; set; } = DateTime.UtcNow.AddHours(1);

        [Required]
        [DataType(DataType.Text)]
        public string Reason { get; set; }
    }
}
