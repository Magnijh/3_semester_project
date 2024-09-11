using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using static DataHub.Logic.AdminHandler;

namespace DRP3_Project.Models
{
    public class AdminPageModel
    {
        // (@Firstname, @Lastname, @EmoployeeId, @Email, @DepartmentId, @WorkHoursInWeek, @Role)

        // This is done in the server itself.
        //[Key]
        //[Column("Id")]
        //[Required]
        //[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        //[Display(Name = "ID")]
        //public virtual int Id { get; set; }

        //[Column("EmployeeID")]
        //[Required]
        //[Display(Name = "Employee ID")]
        //public virtual int EmployeeID { get; set; }

        [Column("FirstName")]
        [Required]
        [Display(Name = "First Name")]
        public string Firstname { get; set; }

        [Column("LastName")]
        [Required]
        [Display(Name = "Last Name")]
        public string Lastname { get; set; }

        [Column("EmployeeId")]
        [Display(Name = "Employee ID")]
        public string EmployeeId { get; set; }

        [Column("Email")]
        [Required]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Column("Department_Id")]
        [Required]
        [Display(Name = "Department")]
        public int Department_Id { get; set; }

        [Column("WorkHoursInWeek")]
        [Required]
        [Display(Name = "Fixed weekly hours")]
        public int WorkHoursInWeek { get; set; }

        [Column("Role")]
        [Required]
        [Display(Name = "Role")]
        public int Role { get; set; }

        [Column("EmpPass")]
        [Required]
        [Display(Name = "Password")]
        public string Password { get; set; }

        public bool GenerateNewEmployeeData()
        {
            string[] NewEmpId = Email.Split("@");
            var result = CheckIfEmpIdExists(NewEmpId[0]); //datahub func

            if (result.Count == 0)
            {
                EmployeeId = NewEmpId[0];
                Password = BCrypt.Net.BCrypt.HashPassword(Password);
                return true;
            }
            else
            {
                return false;
            }
        }
    }

    public class AdminPageModel_LoadIn
    {
        [Column("FirstName")]
        [Display(Name = "Firstname")]
        public string Firstname { get; set; }

        [Column("LastName")]
        [Display(Name = "Lastname")]
        public string Lastname { get; set; }

        [Column("EmployeeId")]
        [Display(Name = "Employee ID")]
        public string EmployeeId { get; set; }

        [Column("Email")]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Column("Department")]
        [Display(Name = "Department")]
        public string Department { get; set; }

        [Column("WorkHoursInWeek")]
        [Display(Name = "Hours/week")]
        public int WorkHoursInWeek { get; set; }

        [Column("Role")]
        [Display(Name = "Role")]
        public int Role { get; set; }
    }
}