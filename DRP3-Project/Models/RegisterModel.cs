using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace DRP3_Project.Models
{
    public class RegisterModel
    {
        [Required(ErrorMessage = "{0} is a mandatory field")]
        [StringLength(maximumLength: 50, MinimumLength = 5,
        ErrorMessage = "The property {0} should have {1} maximum characters and {2} minimum characters")]
        [DataType(DataType.Text)]
        public string EmployeeId { get; set; }

        [Required(ErrorMessage = "{0} is a mandatory field")]
        [DataType(DataType.Password)]
        [StringLength(maximumLength: 50, MinimumLength = 5,
        ErrorMessage = "The property {0} should have {1} maximum characters and {2} minimum characters")]
        public string Password { get; set; }
    }
}
