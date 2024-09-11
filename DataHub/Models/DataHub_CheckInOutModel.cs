using System;
using System.Collections.Generic;
using System.Text;


namespace DataHub.Models
{
    public class DataHub_CheckInOutModel
    {
        public string UserName { get; set; }
    }

    public class DataHub_LoadCheckInOutModel
    {

        public string EmployeeId { get; set; }

        public DateTime CheckInDate { get; set; }

        public DateTime CheckOutDate { get; set; }

        public int TimeWorked { get; set; }

    }
}
