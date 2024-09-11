#pragma checksum "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "cd09df0a15ab5f221141d969b2f1ef5739109365"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Home_PersonalStatistics), @"mvc.1.0.view", @"/Views/Home/PersonalStatistics.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\_ViewImports.cshtml"
using DRP3_Project;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\_ViewImports.cshtml"
using DRP3_Project.Models;

#line default
#line hidden
#nullable disable
#nullable restore
#line 3 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\_ViewImports.cshtml"
using Microsoft.AspNetCore.Http;

#line default
#line hidden
#nullable disable
#nullable restore
#line 4 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\_ViewImports.cshtml"
using DRP3_Project.enums;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"cd09df0a15ab5f221141d969b2f1ef5739109365", @"/Views/Home/PersonalStatistics.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"7ef0cf39c050a84c8a9093a0ec5a224df33197e9", @"/Views/_ViewImports.cshtml")]
    public class Views_Home_PersonalStatistics : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<DataHub.Models.DataHub_PersonalStatistics.DataHub_PersonalStatisticsModel>
    {
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.HeadTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper;
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#nullable restore
#line 2 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
  
    ViewData["Title"] = "Personal statistics";

#line default
#line hidden
#nullable disable
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("head", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "cd09df0a15ab5f221141d969b2f1ef57391093653961", async() => {
                WriteLiteral("\r\n\r\n");
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.HeadTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n\r\n\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("body", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "cd09df0a15ab5f221141d969b2f1ef57391093654939", async() => {
                WriteLiteral("\r\n    <div style=\"text-align: center;\">\r\n        <p class=\"display-4\"> Personal statistics for ");
#nullable restore
#line 12 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                                                  Write(Model.PersonalStatistics[0].FirstName);

#line default
#line hidden
#nullable disable
                WriteLiteral(" ");
#nullable restore
#line 12 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                                                                                           Write(Model.PersonalStatistics[0].LastName);

#line default
#line hidden
#nullable disable
                WriteLiteral(@" </p>


        <div>
            <p class=""display-4"" style=""font-size: 25px""> Personal Information </p>
            <table class=""table table-striped"" id=""dataTable"">
                <thead>
                    <tr>
                        <th scope=""col"">Id</th>
                        <th scope=""col"">Name</th>
                        <th scope=""col"">Role</th>
                        <th scope=""col"">Target hours <br /> per/week</th>
");
                WriteLiteral("                        <th scope=\"col\">Average hours <br /> per/check in</th>\r\n                        <th scope=\"col\">Hours worked <br /> this week</th>\r\n");
                WriteLiteral("                    </tr>\r\n                </thead>\r\n                <tbody>\r\n");
#nullable restore
#line 32 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                     foreach (var item in Model.PersonalStatistics)
                    {

#line default
#line hidden
#nullable disable
                WriteLiteral("                        <tr>\r\n                            <td>\r\n                                ");
#nullable restore
#line 36 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                           Write(Html.DisplayFor(modelItem => item.EmployeeId));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                            </td>\r\n                            <td>\r\n                                ");
#nullable restore
#line 39 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                           Write(Html.DisplayFor(modelItem => item.FirstName));

#line default
#line hidden
#nullable disable
                WriteLiteral(" ");
#nullable restore
#line 39 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                                                                         Write(Html.DisplayFor(modelItem => item.LastName));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                            </td>\r\n                            <td>\r\n                                ");
#nullable restore
#line 42 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                           Write(Enum.GetName(typeof(Role), item.Role));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                            </td>\r\n                            <td>\r\n                                ");
#nullable restore
#line 45 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                           Write(Html.DisplayFor(modelItem => item.WorkHoursInWeek));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                            </td>\r\n                            <td>\r\n                                <a>");
#nullable restore
#line 48 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                              Write(TimeSpan.FromSeconds(item.AverageSecondsPerCheckIn));

#line default
#line hidden
#nullable disable
                WriteLiteral("</a>\r\n");
                WriteLiteral("                            </td>\r\n                            <td>\r\n                                <a>");
#nullable restore
#line 52 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                              Write(TimeSpan.FromSeconds(item.SecondsWorkedThisWeek));

#line default
#line hidden
#nullable disable
                WriteLiteral("</a>\r\n");
                WriteLiteral("                            </td>\r\n                        </tr>\r\n");
#nullable restore
#line 56 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                    }

#line default
#line hidden
#nullable disable
                WriteLiteral("                </tbody>\r\n            </table>\r\n        </div>\r\n\r\n        <hr />\r\n\r\n\r\n");
                WriteLiteral(@"        <div>
            <p class=""display-4"" style=""font-size: 25px""> History of Absence </p>
            <table class=""table table-striped"">
                <thead>
                    <tr>
                        <th scope=""col"">Id</th>
                        <th scope=""col"">Date</th>
                        <th scope=""col"">Length of Absence</th>
                        <th scope=""col"">Reason for Absence</th>
                    </tr>
                </thead>
                <tbody>
");
#nullable restore
#line 77 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                     foreach (var item in Model.AbsenceData)
                    {

#line default
#line hidden
#nullable disable
                WriteLiteral("                        <tr>\r\n                            <td>\r\n                                ");
#nullable restore
#line 81 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                           Write(Html.DisplayFor(modelItem => item.EmployeeID));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                            </td>\r\n                            <td>\r\n");
#nullable restore
#line 84 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                                  

                                    if (item.StartDate != item.EndDate)
                                    {

#line default
#line hidden
#nullable disable
                WriteLiteral("                                        <a>From ");
#nullable restore
#line 88 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                                           Write(item.StartDate.ToShortDateString());

#line default
#line hidden
#nullable disable
                WriteLiteral("</a>\r\n                                        <br />\r\n                                        <a>To ");
#nullable restore
#line 90 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                                         Write(item.EndDate.ToShortDateString());

#line default
#line hidden
#nullable disable
                WriteLiteral("</a>\r\n");
#nullable restore
#line 91 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                                    }
                                    else
                                    {

#line default
#line hidden
#nullable disable
                WriteLiteral("                                        <a>");
#nullable restore
#line 94 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                                      Write(item.StartDate.ToShortDateString());

#line default
#line hidden
#nullable disable
                WriteLiteral("</a>\r\n");
#nullable restore
#line 95 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                                    }

                                

#line default
#line hidden
#nullable disable
                WriteLiteral("                            </td>\r\n                            <td>\r\n                                <a>");
#nullable restore
#line 100 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                               Write((item.EndDate-item.StartDate).Days +1);

#line default
#line hidden
#nullable disable
                WriteLiteral(" days</a>\r\n                            </td>\r\n                            <td>\r\n                                <a>");
#nullable restore
#line 103 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                              Write(item.Reason);

#line default
#line hidden
#nullable disable
                WriteLiteral("</a>\r\n                            </td>\r\n                        </tr>\r\n");
#nullable restore
#line 106 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                    }

#line default
#line hidden
#nullable disable
                WriteLiteral("                </tbody>\r\n            </table>\r\n        </div>\r\n\r\n        <hr />\r\n");
                WriteLiteral(@"        <div>
            <p class=""display-4"" style=""font-size: 25px""> Vacation History </p>
            <table class=""table table-striped"">
                <thead>
                    <tr>
                        <th scope=""col"">Id</th>
                        <th scope=""col"">Date</th>
                        <th scope=""col"">Length of vacation</th>
                        <th scope=""col"">Status</th>
                    </tr>
                </thead>
                <tbody>
");
#nullable restore
#line 125 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                     foreach (var item in Model.PersonalAcceptedVacation)
                    {

#line default
#line hidden
#nullable disable
                WriteLiteral("                        <tr>\r\n                            <td>\r\n                                ");
#nullable restore
#line 129 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                           Write(Html.DisplayFor(modelItem => item.EmployeeId));

#line default
#line hidden
#nullable disable
                WriteLiteral("\r\n                            </td>\r\n                            <td>\r\n                                <a>From ");
#nullable restore
#line 132 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                                   Write(item.StartDate.ToShortDateString());

#line default
#line hidden
#nullable disable
                WriteLiteral("</a>\r\n                                <br />\r\n                                <a>To ");
#nullable restore
#line 134 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                                 Write(item.EndDate.ToShortDateString());

#line default
#line hidden
#nullable disable
                WriteLiteral("</a>\r\n                            </td>\r\n                            <td>\r\n                                <a>");
#nullable restore
#line 137 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                               Write((item.EndDate-item.StartDate).Days +1);

#line default
#line hidden
#nullable disable
                WriteLiteral(" days</a>\r\n                            </td>\r\n                            <td>\r\n");
#nullable restore
#line 140 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                                 if (item.Status == 1)
                                {

#line default
#line hidden
#nullable disable
                WriteLiteral("                                    <a>Accepted</a>\r\n");
#nullable restore
#line 143 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                                }

#line default
#line hidden
#nullable disable
                WriteLiteral("                            </td>\r\n\r\n                        </tr>\r\n");
#nullable restore
#line 147 "E:\Projects\TimeManagementSystemApp\DRP3-Project\DRP3-Project\Views\Home\PersonalStatistics.cshtml"
                    }

#line default
#line hidden
#nullable disable
                WriteLiteral("                </tbody>\r\n            </table>\r\n        </div>\r\n    </div>\r\n");
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n\r\n\r\n<script>\r\n\r\n    \r\n</script>");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<DataHub.Models.DataHub_PersonalStatistics.DataHub_PersonalStatisticsModel> Html { get; private set; }
    }
}
#pragma warning restore 1591
