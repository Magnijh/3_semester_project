using System;
using System.Collections.Generic;
using System.Text;

namespace DataHub.Models
{
    public class DataHub_LoginModel
    {
        public string EmployeeId { get; set; }

        //reponse variables
        public string AccountHash { get; set; }
        public int AccountDepartment { get; set; }
        public int AccountRole { get; set; }
    }
}
