using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace DRP3_Project.Models
{
    public class VacationRequestModel
    {
        /*[DataType(DataType.Text)]
        private string _employeeID;
        [DataType(DataType.Text)]
        private string _deparment;
        [DataType(DataType.DateTime)]
        private DateTime _startDate;
        [DataType(DataType.DateTime)]
        private DateTime _endDate;
 

        public string employeeID
        {
            get { return _employeeID; }
            set { _employeeID = value; }
        }

        public string deparment
        {
            get { return _deparment; }
            set { _deparment = value; }
        }

        public DateTime startDate
        {
            set { _startDate = value; }
        }

        public DateTime endDate
        {
            set { _endDate = value; }
        }*/

        [DataType(DataType.Text)]
        public string employeeID { get; set; }

        [DataType(DataType.Text)]
        public string department { get; set; }

        [Required(ErrorMessage = "{0} is a mandatory field")]
        [DataType(DataType.DateTime)]
        public DateTime startDate { get; set; }

        [Required(ErrorMessage = "{0} is a mandatory field")]
        [DataType(DataType.DateTime)]
        public DateTime endDate { get; set; }
    }
}


/*
    Employee id
    request id
    Start dae
    end date
 */