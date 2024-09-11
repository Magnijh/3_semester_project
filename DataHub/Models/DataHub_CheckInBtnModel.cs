using System;

namespace DataHub.Models
{
    public class DataHub_CheckInBtnModel
    {
        public string UserName { get; set; }
        public int CheckedInStatus { get; set; }
        public DateTime CheckInDate { get; set; }
        public int SecondsWorkedLastWeek { get; set; }
        public int TargetWorkHours { get; set; }
    }
}