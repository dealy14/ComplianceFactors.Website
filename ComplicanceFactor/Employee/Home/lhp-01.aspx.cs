﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ComplicanceFactor.BusinessComponent;
using ComplicanceFactor.BusinessComponent.DataAccessObject;
using ComplicanceFactor.Common;
using System.Text;
using Microsoft.Reporting.WebForms;
using ComplicanceFactor.Common.Languages;
using System.Globalization;
using System.Web.UI.HtmlControls;
using System.Net;

namespace ComplicanceFactor
{
    public partial class lhp_01 : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(SessionWrapper.u_userid))
                {
                    User userSplash = new User();
                    try
                    {
                        userSplash = UserBLL.GetUserSplash(SessionWrapper.u_userid);
                        bool result = userSplash.u_splash_display_flag;
                        SystemSplashPage splashContent = new SystemSplashPage();
                        //Here we can get the splash content based on the domain Id
                        splashContent = SystemSplashPageBLL.GetSplashContent(SessionWrapper.u_domain, SessionWrapper.CultureName);
                        spalsh.InnerHtml = WebUtility.HtmlDecode(splashContent.u_splash_content);
                        if (result == false && (!string.IsNullOrEmpty(splashContent.u_splash_content)) && string.IsNullOrEmpty(SessionWrapper.IsClose))
                        {
                            mpSplashPage.Show();
                        }

                    }
                    catch (Exception ex)
                    {
                        if (ConfigurationWrapper.LogErrors == true)
                        {
                            if (ex.InnerException != null)
                            {
                                Logger.WriteToErrorLog("lhp-01.aspx", ex.Message, ex.InnerException.Message);
                            }
                            else
                            {
                                Logger.WriteToErrorLog("lhp-01.aspx", ex.Message);
                            }
                        }
                    }
                }
                HtmlGenericControl divsearch = (HtmlGenericControl)Master.FindControl("divsearch");
                divsearch.Style.Add("display", "block");
                Label lblBreadCrumb = (Label)Master.FindControl("lblBreadCrumb");
                lblBreadCrumb.Text = "<a href=/Employee/Home/lhp-01.aspx>" + LocalResources.GetGlobalLabel("app_nav_employee") + "</a>" + "&nbsp>&nbsp;" + "<a class=bread_text>" + LocalResources.GetGlobalLabel("app_home_text") + "</a>";
                // GetAllCourse();
                //set courses recored display pref
                if (SessionWrapper.u_profile_my_courses_records_display_pref != 0)
                {
                    gvCourses.AllowPaging = true;
                    gvCourses.PageSize = SessionWrapper.u_profile_my_courses_records_display_pref;
                }

                GetAllEmployee();
                //expand and collapsed based on user for course
                if (SessionWrapper.u_profile_my_courses_collapse_pref == "app_ddl_collapsed")
                {
                    div_course.Style.Add("display", "none");
                    imgCourse.ImageUrl = "~/Images/addplus-sm.gif";
                    imgCourse.AlternateText = "plus";
                    
                }
                else
                {
                    div_course.Style.Add("display", "block");
                    imgCourse.ImageUrl = "~/Images/addminus-sm.gif";
                    imgCourse.AlternateText = "minus";
                }
                //expand and collapsed based on user for curriculum
                if (SessionWrapper.u_profile_my_curricula_collapse_pref == "app_ddl_collapsed")
                {
                    div_curriculum.Style.Add("display", "none");
                    imgCurriculum.ImageUrl = "~/Images/addplus-sm.gif";
                    imgCurriculum.AlternateText = "plus";
                }
                else
                {
                    div_curriculum.Style.Add("display", "block");
                    imgCurriculum.ImageUrl = "~/Images/addminus-sm.gif";
                    imgCurriculum.AlternateText = "minus";
                }
                //expand and collapsed based on user for Learning History
                if (SessionWrapper.u_profile_my_learning_history_collapse_pref == "app_ddl_collapsed")
                {
                    div_LearningHistory.Style.Add("display", "none");
                    imgLearningHistory.ImageUrl = "~/Images/addplus-sm.gif";
                    imgLearningHistory.AlternateText = "plus";
                }
                else
                {
                    div_LearningHistory.Style.Add("display", "block");
                    imgLearningHistory.ImageUrl = "~/Images/addminus-sm.gif";
                    imgLearningHistory.AlternateText = "minus";
                }
            }

            //go button
            Button btnGo = (Button)Master.FindControl("btnGo");
            btnGo.Click += new EventHandler(btnGo_Click);
            //advanced search
            LinkButton lnkAdvancedSearch = (LinkButton)Master.FindControl("lnkAdvancedSearch");
            lnkAdvancedSearch.Click += new EventHandler(lnkAdvancedSearch_Click);
            //browse
            LinkButton lnkBrowse = (LinkButton)Master.FindControl("lnkBrowse");
            lnkBrowse.Click += new EventHandler(lnkBrowse_Click);

        }
        private void GetAllEmployee()
        {
            if (!String.IsNullOrEmpty(SessionWrapper.u_userid))
            {
                DataSet dsEmployee = EmployeeBLL.GetAllEmployee(SessionWrapper.u_userid);
                //bind course
                gvCourses.DataSource = dsEmployee.Tables[0];
                gvCourses.DataBind();
                //bind curriculum
                gvCurriculum.DataSource = dsEmployee.Tables[1];
                gvCurriculum.DataBind();
                //bind LearningHistory
                gvLearningHistory.DataSource = dsEmployee.Tables[4];
                gvLearningHistory.DataBind();

                if (gvCourses.Rows.Count > 0)
                {
                    gvCourses.UseAccessibleHeader = true;
                    if (gvCourses.HeaderRow != null)
                    {
                        //This will tell ASP.NET to render the <thead> for the header row
                        //using instead of the simple <tr>
                        gvCourses.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }
                }
                if (gvCurriculum.Rows.Count > 0)
                {
                    gvCurriculum.UseAccessibleHeader = true;
                    if (gvCurriculum.HeaderRow != null)
                    {
                        //This will tell ASP.NET to render the <thead> for the header row
                        //using instead of the simple <tr>
                        gvCurriculum.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }
                }
                if (gvLearningHistory.Rows.Count > 0)
                {
                    gvLearningHistory.UseAccessibleHeader = true;
                    if (gvLearningHistory.HeaderRow != null)
                    {
                        //This will tell ASP.NET to render the <thead> for the header row
                        //using instead of the simple <tr>
                        gvLearningHistory.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }
                }
            }
        }
        //private void GetAllLearningHistory()
        //{
        //    DataSet dsEmployee = EmployeeBLL.GetAllEmployee(SessionWrapper.u_userid);
        //    //bind course
        //    gvLearningHistory.DataSource = dsEmployee.Tables[4];
        //    gvLearningHistory.DataBind();
        //    if (gvLearningHistory.Rows.Count > 0)
        //    {
        //        gvLearningHistory.UseAccessibleHeader = true;
        //        if (gvLearningHistory.HeaderRow != null)
        //        {
        //            //This will tell ASP.NET to render the <thead> for the header row
        //            //using instead of the simple <tr>
        //            gvLearningHistory.HeaderRow.TableSection = TableRowSection.TableHeader;
        //        }
        //    }

        //}
        //private void GetAllCurriculum()
        //{
        //    DataSet dsEmployee = EmployeeBLL.GetAllEmployee(SessionWrapper.u_userid);
        //    //bind curriculum
        //    gvCurriculum.DataSource = dsEmployee.Tables[1];
        //    gvCurriculum.DataBind();
        //    if (gvCurriculum.Rows.Count > 0)
        //    {
        //        gvCurriculum.UseAccessibleHeader = true;
        //        if (gvCurriculum.HeaderRow != null)
        //        {
        //            //This will tell ASP.NET to render the <thead> for the header row
        //            //using instead of the simple <tr>
        //            gvCurriculum.HeaderRow.TableSection = TableRowSection.TableHeader;
        //        }
        //    }

        //}
        
        protected void btnGo_Click(object sender, EventArgs e)
        {
            TextBox txtQuickSearch = (TextBox)Master.FindControl("txtQuickSearch");
            Response.Redirect("~/Employee/Catalog/qscr-01.aspx?Keyword=" + SecurityCenter.EncryptText(txtQuickSearch.Text), false);
        }
        protected void lnkAdvancedSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Employee/Catalog/ascp-01.aspx", false);
        }
        protected void lnkBrowse_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Employee/Catalog/bchp-01.aspx", false);
        }
        protected void lnkViewAllCourses_Click(object sender, EventArgs e)
        {
            //if (gvCourses.Rows.Count > 0)
            //{
            //    gvCourses.PageSize = Convert.ToInt32(gvCourses.PageCount * gvCourses.PageSize);
            //}
            //GetAllCourse();
            //div_course.Style.Add("display", "block");
            //imgCourse.ImageUrl = "~/Images/addminus-sm.gif";
            //imgCourse.AlternateText = "minus";
            Response.Redirect("~/Employee/Course/lmcp-01.aspx", false);


        }
        protected void lnkViewAllCurriculum_Click(object sender, EventArgs e)
        {
            //if (gvCurriculum.Rows.Count > 0)
            //{
            //    gvCurriculum.PageSize = Convert.ToInt32(gvCurriculum.PageCount * gvCurriculum.PageSize);
            //}
            //GetAllCurriculum();
            //div_curriculum.Style.Add("display", "block");
            //imgCurriculum.ImageUrl = "~/Images/addminus-sm.gif";
            //imgCurriculum.AlternateText = "minus";
            Response.Redirect("~/Employee/Curricula/lmcurp-01.aspx", false);

        }
        protected void gvCurriculum_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("View"))
                {
                    Response.Redirect("~/Employee/Curricula/lvcurd-01.aspx?id=" + SecurityCenter.EncryptText(e.CommandArgument.ToString()), false);

                }
                else if (e.CommandName.Equals("Enroll"))
                {
                    Response.Redirect("~/Employee/Curricula/lvcure-01.aspx?id=" + SecurityCenter.EncryptText(e.CommandArgument.ToString()), false);
                }
            }
            catch (Exception ex)
            {
                //Log here
                if (ConfigurationWrapper.LogErrors == true)
                {
                    if (ex.InnerException != null)
                    {
                        Logger.WriteToErrorLog("lhp-01.aspx", ex.Message, ex.InnerException.Message);
                    }
                    else
                    {
                        Logger.WriteToErrorLog("lhp-01.aspx", ex.Message);
                    }
                }
            }
        }

        protected void gvCourses_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button btnEnroll = (Button)e.Row.FindControl("btnEnroll");
                Button btnLaunch = (Button)e.Row.FindControl("btnLaunch");
                Button btnDrop = (Button)e.Row.FindControl("btnDrop");
                string status = DataBinder.Eval(e.Row.DataItem, "status").ToString().Trim();
                string deliveryType = DataBinder.Eval(e.Row.DataItem, "deliveryType").ToString().Trim();
                string e_enroll_system_id_pk = DataBinder.Eval(e.Row.DataItem, "e_enroll_system_id_pk").ToString().Trim();
                string enrollType = DataBinder.Eval(e.Row.DataItem, "enrollmentType").ToString().Trim();
                if (status == "Assigned")
                {
                    btnEnroll.Style.Add("display", "inline");
                }
                else if ((status == "Enrolled" || status == "Incomplete" || status == "Completed") && deliveryType == "OLT") 
                {
                    btnLaunch.Style.Add("display", "inline");
                    string host = HttpContext.Current.Request.Url.Host + ":" + HttpContext.Current.Request.Url.Port.ToString();
                    string url = "http://" + host + "/LMS/CoursePlayer.aspx?eid=" + e_enroll_system_id_pk + "&AICC_SID=" + e_enroll_system_id_pk + "&AICC_URL=" + host + "/LMS/HACP_Handler.aspx"; 
                    btnLaunch.OnClientClick = "window.open('" + url + "','_blank','height=' + screen.height + ',width=' + screen.width + ',location=0,menubar=0,status=0,toolbar=0,resizable=1');";
                }
                else if ((status == "Enrolled" || status == "Incomplete"))
                {
                    if (enrollType == "Self-enroll")
                    {
                        btnDrop.Style.Add("display", "inline");
                    }
                }
                else if (status == "Pending" && deliveryType == "OLT") // Note: If status is pending and delivery type is OLT then show drop button
                {
                    if (enrollType == "Self-enroll")
                    {
                        btnLaunch.Style.Add("display", "inline");
                    }
                }
                else if (status == "Pending" && deliveryType != "OLT") // Note: If status is pending and delivery type is not OLT then show drop button
                {
                    if (enrollType == "Self-enroll")
                    {
                        btnDrop.Style.Add("display", "inline");
                    }
                }
                else if (status == "Denied")
                {
                    if (enrollType == "Self-enroll")
                    {
                        btnDrop.Style.Add("display", "inline");
                    }
                }
                else if (status == "Approved")
                {
                    btnEnroll.Style.Add("display", "inline");
                }
                

            }
        }

        protected void gvCourses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Enroll"))
            {
                Response.Redirect("~/Employee/Catalog/ctdp-01.aspx?id=" + SecurityCenter.EncryptText(e.CommandArgument.ToString()), false);

            }
            else if (e.CommandName.Equals("Launch"))
            {
                int rowIndex = int.Parse(e.CommandArgument.ToString());

                string e_enroll_system_id_pk = gvCourses.DataKeys[rowIndex][1].ToString();
                DataTable dtEnroll = EnrollmentBLL.GetEnrollmentbyId(e_enroll_system_id_pk);
                DateTime? first_attempt = null;
                DateTime? last_attempt = null;
                if (dtEnroll != null)
                {
                    if (dtEnroll.Rows.Count > 0)
                    {
                        if (dtEnroll.Rows[0]["e_enroll_first_attempt_date_time"] == null)
                        {
                            first_attempt = DateTime.Now;
                        }
                        else if (string.IsNullOrEmpty(dtEnroll.Rows[0]["e_enroll_first_attempt_date_time"].ToString()))
                        {
                            first_attempt = DateTime.Now;
                        }
                        else
                        {
                            first_attempt = (DateTime)dtEnroll.Rows[0]["e_enroll_first_attempt_date_time"];
                            last_attempt = DateTime.Now;
                        }
                        EnrollmentBLL.UpdateEnrollmentAttemptDate(e_enroll_system_id_pk, first_attempt, last_attempt);
                        if (dtEnroll.Rows[0]["c_delivery_complete_on_launch"] != null)
                        {
                            if (dtEnroll.Rows[0]["c_delivery_complete_on_launch"].ToString() == "True")
                            {
                                SystemTranscripts sessiontranscripts = new SystemTranscripts
                                {
                                    t_transcript_id_pk = Guid.NewGuid().ToString(),
                                    t_transcript_user_id_fk = dtEnroll.Rows[0]["e_enroll_user_id_fk"].ToString(),
                                    t_transcript_course_id_fk = dtEnroll.Rows[0]["e_enroll_course_id_fk"].ToString(),
                                    t_transcript_delivery_id_fk = dtEnroll.Rows[0]["e_enroll_delivery_id_fk"].ToString(),
                                    t_transcript_attendance_id_fk = "app_ddl_attended_text",
                                    t_transcript_passing_status_id_fk = "app_ddl_completed_text",
                                    t_transcript_completion_date_time = DateTime.Now,
                                    t_transcript_completion_type_id_fk = "app_ddl_manual_user_mark_completion_text",
                                    t_transcript_marked_by_user_id_fk = SessionWrapper.u_userid,// all zeroes
                                    t_transcript_actual_date = DateTime.Now,
                                    t_transcript_target_due_date = string.IsNullOrEmpty(dtEnroll.Rows[0]["e_enroll_target_due_date"].ToString()) ?
                                    DateTime.Now : (DateTime)dtEnroll.Rows[0]["e_enroll_target_due_date"],
                                    t_transcript_score = string.IsNullOrEmpty(dtEnroll.Rows[0]["e_enroll_score"].ToString()) ? 0 : int.Parse(dtEnroll.Rows[0]["e_enroll_score"].ToString()),
                                    t_transcript_credits = string.IsNullOrEmpty(dtEnroll.Rows[0]["c_delivery_credit_units"].ToString()) ? 0 : int.Parse(dtEnroll.Rows[0]["c_delivery_credit_units"].ToString()),

                                    t_transcript_hours = string.IsNullOrEmpty(dtEnroll.Rows[0]["c_delivery_credit_hours"].ToString()) ? 0 : int.Parse(dtEnroll.Rows[0]["c_delivery_credit_hours"].ToString()),

                                    t_transcript_time_spent = string.IsNullOrEmpty(dtEnroll.Rows[0]["e_enroll_time_spent"].ToString()) ? 0 : int.Parse(dtEnroll.Rows[0]["e_enroll_time_spent"].ToString()),

                                    t_transcript_completion_score = 100,
                                    //t_transcript_status_id_fk = tx_status_id_fk,
                                    t_transcript_active_flag = true,
                                    //t_transcript_grade_id_fk = tx_grade_id_fk
                                    t_transcript_status_name = "Completed"

                                };


                                int result = ManageCompletionBLL.InsertTranscripts(sessiontranscripts);


                                ManageCompletionBLL.UpdateEnrollment(dtEnroll.Rows[0]["e_enroll_user_id_fk"].ToString(),
                                    dtEnroll.Rows[0]["e_enroll_course_id_fk"].ToString(), dtEnroll.Rows[0]["e_enroll_delivery_id_fk"].ToString(),
                                    sessiontranscripts.t_transcript_id_pk);
                                Response.Redirect(Request.Url.ToString()); 
                            }
                        }
                    }
                }



            }
            else if (e.CommandName.Equals("Details"))
            {
                //Response.Redirect("~/Employee/Catalog/ctdp-01.aspx?id=" + SecurityCenter.EncryptText(e.CommandArgument.ToString()), false);
            }
            else if (e.CommandName.Equals("Drop"))
            {
                BusinessComponent.DataAccessObject.Enrollment DropEnrollmentStatus = new BusinessComponent.DataAccessObject.Enrollment();
                DropEnrollmentStatus.e_enroll_user_id_fk = SessionWrapper.u_userid;
                DropEnrollmentStatus.e_enroll_course_id_fk = e.CommandArgument.ToString();
                EnrollmentBLL.DropEnrollmentStatus(DropEnrollmentStatus);
                //Response.Redirect("~/Employee/Home/lhp-01.aspx", false);
                GetAllEmployee();
             }
        }  

        protected void lnkViewAllLearningHistory_Click(object sender, EventArgs e)
        {
            //if (gvLearningHistory.Rows.Count > 0)
            //{
            //    gvLearningHistory.PageSize = Convert.ToInt32(gvLearningHistory.PageCount * gvLearningHistory.PageSize);
            //}
            //GetAllLearningHistory();
            //div_LearningHistory.Style.Add("display", "block");
            //imgLearningHistory.ImageUrl = "~/Images/addminus-sm.gif";
            //imgLearningHistory.AlternateText = "minus";

            Response.Redirect("~/Employee/LearningHistory/lmhp-01.aspx", false);
        }

        protected void gvLearningHistory_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string t_transcript_course_id_fk = gvLearningHistory.DataKeys[e.Row.RowIndex]["t_transcript_course_id_fk"].ToString();
                string reEnroll = DataBinder.Eval(e.Row.DataItem,"reEnroll").ToString();
                Button btnReview = (Button)e.Row.FindControl("btnReview");
                Button btnEnroll = (Button)e.Row.FindControl("btnEnroll");
                Button btnCertificate = (Button)e.Row.FindControl("btnCertificate");
                Literal ltlViewDetails = (Literal)e.Row.FindControl("ltlViewDetails");
                string status = DataBinder.Eval(e.Row.DataItem, "status").ToString();
                if (status == "Completed")
                {
                    ltlViewDetails.Text = "<input type='button' id=" + t_transcript_course_id_fk + ',' + SessionWrapper.u_userid + " value='" + LocalResources.GetLabel("app_view_details_button_text") + "' class='ViewLearningdetails' />";
                    btnReview.Style.Add("display", "inline");
                    btnCertificate.Style.Add("display", "none");
                }
                else if (status == "Acquired")
                {
                    //   Response.Redirect("~/Employee/Curricula/lvcurd-01.aspx?id=" + SecurityCenter.EncryptText(e.CommandArgument.ToString()), false);
                    ltlViewDetails.Text = "<input type='button' onclick='window.location=\"../Curricula/lvcurd-01.aspx?id=" + SecurityCenter.EncryptText(t_transcript_course_id_fk) + "\"' id=" + SecurityCenter.EncryptText(t_transcript_course_id_fk) + ',' + SessionWrapper.u_userid + " value='" + LocalResources.GetLabel("app_view_details_button_text") + "' class='ViewCurrLearningdetails' />";
                    btnReview.Style.Add("display", "none");
                    btnCertificate.Style.Add("display", "none");
                }
                else if (status == "Passed")
                {
                    //btnEnroll.Style.Add("display", "Block");
                    ltlViewDetails.Text = "<input type='button' id=" + t_transcript_course_id_fk+','+SessionWrapper.u_userid +" value='" + LocalResources.GetLabel("app_view_details_button_text") + "' class='ViewLearningdetails' />";
                    btnCertificate.Style.Add("display", "Block");
                }
                else if (status == "Failed" && reEnroll == "reenroll")
                {
                    ltlViewDetails.Text = "<input type='button' id=" + t_transcript_course_id_fk + ',' + SessionWrapper.u_userid + " value='" + LocalResources.GetLabel("app_view_details_button_text") + "' class='ViewLearningdetails' />";
                    //btnEnroll.Style.Add("display", "Block");
                    e.Row.Cells[2].ForeColor = System.Drawing.Color.Red;
                    e.Row.Cells[3].ForeColor = System.Drawing.Color.Red;

                }
                else if (status == "Failed")
                {                    
                    e.Row.Cells[2].ForeColor = System.Drawing.Color.Red;
                    e.Row.Cells[3].ForeColor = System.Drawing.Color.Red;
                }
                if (reEnroll == "enrolled")
                {
                    btnEnroll.Style.Add("display", "none");
                }
            }
        }

        protected void gvLearningHistory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = int.Parse(e.CommandArgument.ToString());
            string t_transcript_course_id_fk = gvLearningHistory.DataKeys[rowIndex][0].ToString();
            string deliveryType = gvLearningHistory.DataKeys[rowIndex][3].ToString();
            string title = gvLearningHistory.DataKeys[rowIndex][1].ToString();

            bool isEnroll;
            if (e.CommandName.Equals("Enroll"))
            {

                //Enrollment enroll = new Enrollment();
                //enroll.e_enroll_user_id_fk = SessionWrapper.u_userid;
                //enroll.e_enroll_course_id_fk = t_transcript_course_id_fk;
                //enroll.e_enroll_delivery_id_fk = gvLearningHistory.DataKeys[rowIndex][2].ToString();
                //enroll.e_enroll_type_name = "Self-enroll";
                //enroll.e_enroll_status_name = "Enrolled";
                //enroll.e_enroll_target_due_date = null;
                //int result = EnrollmentBLL.SingleReEnroll(enroll);
                //if (result == -2)
                //{
                //    ScriptManager.RegisterClientScriptBlock(this, GetType(), "Alert", @"alert('Already enrolled')", true);
                //}
                if (deliveryType == "CURR")
                {
                    Response.Redirect("~/Employee/Curricula/lvcure-01.aspx?id=" + SecurityCenter.EncryptText(t_transcript_course_id_fk), false);
                }
                else
                {
                    isEnroll = EnrollmentBLL.ChecReEnrollorNot(t_transcript_course_id_fk, SessionWrapper.u_userid);
                    if (isEnroll == true)
                    {
                        SessionWrapper.isLeraningHistory = true;
                    }
                    else
                    {
                        SessionWrapper.isLeraningHistory = false;
                    }
                    Response.Redirect("~/Employee/Catalog/ctdp-01.aspx?id=" + SecurityCenter.EncryptText(t_transcript_course_id_fk), false);
                    GetAllEmployee();
                }
               
                
            }
            else if (e.CommandName.Equals("Certificate"))
            {
                
                rvLearningHistory.LocalReport.DataSources.Clear();
                DataSet dsCertificate = new DataSet();
                try
                {
                    dsCertificate = EnrollmentBLL.GetCertificatePDF(SessionWrapper.u_userid, t_transcript_course_id_fk, SessionWrapper.CultureName);
                }
                catch (Exception ex)
                {
                    //TODO: Show user friendly error here
                    //Log here
                    if (ConfigurationWrapper.LogErrors == true)
                    {
                        if (ex.InnerException != null)
                        {
                            Logger.WriteToErrorLog("lhp-01.aspx (Certificate PDF)", ex.Message, ex.InnerException.Message);
                        }
                        else
                        {
                            Logger.WriteToErrorLog("lhp-01.aspx (Certificate PDF)", ex.Message);
                        }
                    }

                }
                if (dsCertificate.Tables[0].Rows.Count > 0)
                {
                    divError.Style.Add("display", "none");
                    Warning[] warnings;
                    string[] streamIds;
                    string mimeType = string.Empty;
                    string encoding = string.Empty;
                    string extension = string.Empty;
                    rvLearningHistory.ProcessingMode = ProcessingMode.Local;
                    rvLearningHistory.LocalReport.EnableExternalImages = true;
                    rvLearningHistory.LocalReport.ReportEmbeddedResource = "ComplicanceFactor.Employee.LearningHistory.PdfTemplate.MyCertificate.rdlc";

                    SystemThemes userTheme = new SystemThemes();
                    userTheme = GetthemeforEmailandPdf();


                    string protocol = Request.Url.AbsoluteUri;
                    int len = protocol.IndexOf(':');
                    protocol = protocol.Substring(0, len);

                    rvLearningHistory.LocalReport.DataSources.Add(new ReportDataSource("dsCertificate", dsCertificate.Tables[0]));

                    List<ReportParameter> param = new List<ReportParameter>();
                    param.Add(new ReportParameter("s_theme_report_logo_file_name", protocol + "://" + Request.Url.Host.ToLower() + "/SystemHome/Configuration/Themes/Logo/" + userTheme.s_theme_report_logo_file_name));
                    param.Add(new ReportParameter("s_theme_css_tag_main_background_hex_value", "#" + userTheme.s_theme_css_tag_main_background_hex_value));
                    param.Add(new ReportParameter("s_theme_css_tag_foot_top_line_hex_value", "#" + userTheme.s_theme_css_tag_foot_top_line_hex_value));
                    param.Add(new ReportParameter("s_theme_css_tag_foot_bot_line_hex_value", "#" + userTheme.s_theme_css_tag_foot_bot_line_hex_value));
                    param.Add(new ReportParameter("s_theme_css_tag_section_head_hex_value", "#" + userTheme.s_theme_css_tag_section_head_hex_value));
                    param.Add(new ReportParameter("s_theme_css_tag_section_head_text_hex_value", "#" + userTheme.s_theme_css_tag_section_head_text_hex_value));
                    param.Add(new ReportParameter("s_theme_css_tag_section_head_border_hex_value", "#" + userTheme.s_theme_css_tag_section_head_border_hex_value));
                    param.Add(new ReportParameter("s_theme_css_tag_table_head_hex_value", "#" + userTheme.s_theme_css_tag_table_head_hex_value));
                    param.Add(new ReportParameter("s_theme_css_tag_table_head_text_hex_value", "#" + userTheme.s_theme_css_tag_table_head_text_hex_value));
                    param.Add(new ReportParameter("s_theme_css_tag_table_border_hex_value", "#" + userTheme.s_theme_css_tag_table_border_hex_value));
                    param.Add(new ReportParameter("s_theme_css_tag_body_text_hex_value", "#" + userTheme.s_theme_css_tag_body_text_hex_value));
                    this.rvLearningHistory.LocalReport.SetParameters(param);

                    byte[] bytes = rvLearningHistory.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);
                    Response.Buffer = true;
                    Response.Clear();
                    Response.ClearHeaders();
                    Response.ContentType = mimeType;
                    Response.AddHeader("content-disposition", "attachment; filename=\"" + "Certificate" + ".pdf" + "\"");
                    Response.BinaryWrite(bytes); // create the file     
                    Response.Flush(); // send it to the client to download  
                    Response.End();
                    Response.Close();
                    
                }
                else
                {
                    divError.Style.Add("display", "block");
                    divError.InnerText = LocalResources.GetText("app_course_instructor_error_empty") + title + ".";
                    
                }
            }
        }

        // For Theme for email and pdf
        private static SystemThemes GetthemeforEmailandPdf()
        {
            SystemThemes userTheme = new SystemThemes();
            userTheme = SystemThemeBLL.GetThemeForEmailPdf(SessionWrapper.u_userid);
            return userTheme;
        }


        //Splash pages

        protected void btnDonotShow_Click(object sender, EventArgs e)
        {
            //Set the u_splash_display_flag as 1.
            User userSplash = new User();
            userSplash.Userid = SessionWrapper.u_userid;
            userSplash.u_splash_display_flag = true;

            try
            {
                int result = UserBLL.UpdateSplash(userSplash);
            }
            catch (Exception ex)
            {
                if (ConfigurationWrapper.LogErrors == true)
                {
                    if (ex.InnerException != null)
                    {
                        Logger.WriteToErrorLog("lhp-01.aspx", ex.Message, ex.InnerException.Message);
                    }
                    else
                    {
                        Logger.WriteToErrorLog("lhp-01.aspx", ex.Message);
                    }
                }
            }
        }
        protected void btnCloseSplashPage_Click(object sender, EventArgs e)
        {
            SessionWrapper.IsClose = "True";
        }
        protected void ibtnCloseSplash_Click(object sender, EventArgs e)
        {
            SessionWrapper.IsClose = "True";
        }  

    }
}