using DRP3_Project.Controllers;
using DRP3_Project.enums;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;

namespace DRP3_Project.CustomAttributes
{
    [AttributeUsage(AttributeTargets.All)]
    public class VerifyRightsAttribute : ActionFilterAttribute
    {
        public VerifyRightsAttribute(Role roleNeeded, FuncType fType)
        {
            RoleNeeded = roleNeeded;
            FType = fType;
        }

        private Role RoleNeeded { get; set; }
        private FuncType FType { get; set; }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            try
            {
                //reads only role cookie, as if it exists, all the cookies exists.. reads only one for speed
                var RoleCookie = context.HttpContext.Session.GetInt32("UserRole");

                //as the cookie can return int or null, it have to be a nullable int.
                //Made the check for null complicated b/c it was the only thing I could
                //get working :/
                int? EmployeeRoleId = RoleCookie.ToString() == string.Empty ? -1 : RoleCookie;

                if (EmployeeRoleId == -1)
                {
                    context.Result = new RedirectToActionResult(nameof(AccountController.Login), "Account", null);
                }

                //Casts the EmployeeRoleId to the Enum 'Role'.
                //This way the Attribute can be called like [VerifyRights(Role.Manager, FuncType.ViewData)]
                Role EmpRole = (Role)EmployeeRoleId;

                if (RoleNeeded > EmpRole)
                {
                    //Role too low
                    context.Result = new RedirectToActionResult(nameof(CController.Index), "C", null);
                }
                else if (EmpRole.Equals(Role.HR) && FType.Equals(FuncType.DenyHR))
                {
                    //this happens if HR role tries to change data, they only have view rights
                    context.Result = new RedirectToActionResult(nameof(HomeController.HRError), "Home", null);
                }

                // if this is reached, they are good.
            }
            catch (Exception)
            {
                //dont know if this is necessary but if somehow the cookie fails to cast to a Role(enum) it will throw an error
                context.Result = new RedirectToActionResult(nameof(HomeController.Error), "Home", null);
            }
        }
    }
}