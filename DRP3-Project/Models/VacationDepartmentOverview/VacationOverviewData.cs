using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DRP3_Project.Models.VacationDepartmentOverview
{
    public class VacationOverviewData
    {

        public List<VacationRequestPerWeek> VacationReqPerWeek { get; internal set; } = new List<VacationRequestPerWeek>();
        public List<VacationCurrentRequest> VacationRequests { get; internal set; } = new List<VacationCurrentRequest>();

    }
}
