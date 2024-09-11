using System;
using System.Collections.Generic;
using System.Text;

namespace DataHub.Models
{
    public class DataHub_ChangeVacationStatusModel
    {
        public int Id { get; set; }
        public int NewStatus { get; set; }
        public string ChangedByUserId { get; set; }
    }
}
