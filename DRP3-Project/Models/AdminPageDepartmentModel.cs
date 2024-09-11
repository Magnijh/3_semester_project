using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace DRP3_Project.Models
{
    public class AdminPageDepartmentModel
    {
    [Key]
    [Column("Id")]
    [Required]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Display(Name = "ID")]
    public virtual int Id { get; set; }

    [Column("Department")]
    [Required]
    [Display(Name = "Department")]
    public virtual string Department { get; set; }
    }
}
