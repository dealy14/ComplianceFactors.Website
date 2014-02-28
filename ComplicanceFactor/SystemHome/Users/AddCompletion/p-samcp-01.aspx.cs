﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ComplicanceFactor.Common;
using System.Data;
using ComplicanceFactor.BusinessComponent;
using System.Text;
using System.Configuration;
using System.Net.Mail;
using ComplicanceFactor.BusinessComponent.DataAccessObject;

namespace ComplicanceFactor.SystemHome.Users.AddCompletion
{
    public partial class p_samcp_01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SessionWrapper.Compltion_courses = null;
                SessionWrapper.Selected_delivery = null;

                SessionWrapper.Compltion_courses = TempDataTables.TempCompletionCourse();
                SessionWrapper.Selected_delivery = TempSelectedDelivery();
            }
            string val = hdnIsCatalogBind.Value;
            if (SessionWrapper.Compltion_courses.Rows.Count > 0 && hdnIsCatalogBind.Value != "1")
            {
                gvCatalog.DataSource = SessionWrapper.Compltion_courses;
                gvCatalog.DataBind();
                hdnIsCatalogBind.Value = "1";
            }
        }


        protected void gvCatalog_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            GridView GridView1 = (GridView)sender;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string courseId = GridView1.DataKeys[e.Row.RowIndex][0].ToString();
                try
                {
                    DropDownList ddlDelivery = (DropDownList)e.Row.FindControl("ddlDelivery");
                    ddlDelivery.DataSource = SystemMassCompletionBLL.GetDelivery(courseId);
                    ddlDelivery.DataBind();
                    ListItem liFirstItem = new ListItem();
                    liFirstItem.Text = "Select a Delivery";
                    ///liFirstItem.Value = "0";
                    ddlDelivery.Items.Insert(0, liFirstItem);
                    ddlDelivery.SelectedIndex = 0;

                    DataRowView drv = (DataRowView)e.Row.DataItem;
                    string delivery = Convert.ToString(drv["c_delivery_system_id_pk"]);
                    if (!string.IsNullOrEmpty(delivery))
                    {
                        ddlDelivery.SelectedValue = delivery;
                    }
                }
                catch (Exception ex)
                {
                    if (ConfigurationWrapper.LogErrors == true)
                    {
                        if (ex.InnerException != null)
                        {
                            Logger.WriteToErrorLog("p-samcp-01.aspx", ex.Message, ex.InnerException.Message);
                        }
                        else
                        {
                            Logger.WriteToErrorLog("p-samcp-01.aspx", ex.Message);
                        }
                    }
                }
            }
        }

        protected void gvCompletionInfo_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                try
                {
                    DataRowView drheader = (DataRowView)e.Row.DataItem;
                    string Header = Convert.ToString(drheader["Id"]);

                    Label lblDelivery = (Label)e.Row.FindControl("lblDeliveryIdName");
                    lblDelivery.Text = Header;

                    DataRowView drgrade = (DataRowView)e.Row.DataItem;
                    string deliveryId = Convert.ToString(drgrade["c_delivery_id_pk"]);

                    DropDownList ddlGrade = (DropDownList)e.Row.FindControl("ddlGrade");
                    ddlGrade.DataSource = ManageCompletionBLL.GetGrade(deliveryId);
                    ddlGrade.DataBind();

                    DropDownList ddlAttendance = (DropDownList)e.Row.FindControl("ddlAttendanceStatus");
                    ddlAttendance.DataSource = ManageCompletionBLL.GetAttendanceStatus(SessionWrapper.CultureName, "samcsmp-01");
                    ddlAttendance.DataBind();

                    DropDownList ddlPassingStatus = (DropDownList)e.Row.FindControl("ddlPassignStatus");
                    ddlPassingStatus.DataSource = ManageCompletionBLL.GetPassingStatus(SessionWrapper.CultureName, "samcsmp-01");
                    ddlPassingStatus.DataBind();
                }
                catch (Exception ex)
                {
                    if (ConfigurationWrapper.LogErrors == true)
                    {
                        if (ex.InnerException != null)
                        {
                            Logger.WriteToErrorLog("p-samcp-01.aspx", ex.Message, ex.InnerException.Message);
                        }
                        else
                        {
                            Logger.WriteToErrorLog("p-samcp-01.aspx", ex.Message);
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Add the value to Selected deliveries
        /// </summary>
        /// <param name="idx"></param>
        /// <param name="id"></param>
        /// <param name="c_delivery_id_pk"></param>
        /// <param name="courseid"></param>
        /// <param name="dtTempSelectedDeliveries"></param>
        private void AddDataToSelectedDeliveries(int idx, string id, string c_delivery_id_pk,string courseid, DataTable dtTempSelectedDeliveries)
        {
            DataRow[] getrow = dtTempSelectedDeliveries.Select("RowIndex=" + idx);
            if (getrow.Length > 0)
            {
                if (id != "Select a Delivery")
                {
                    foreach (var updaterow in getrow)
                    {
                        updaterow["c_delivery_id_pk"] = c_delivery_id_pk;
                        updaterow["c_course_system_id_pk"] = courseid;
                        updaterow["Id"] = id;
                    }
                }
            }
            else
            {
                if (id != "Select a Delivery")
                {
                    DataRow row;
                    row = dtTempSelectedDeliveries.NewRow();
                    //row["c_instructor_id_fk"] = c_instructor_id_fk;
                    row["Id"] = id;
                    row["RowIndex"] = idx;
                    row["c_course_system_id_pk"] = courseid;
                    row["c_delivery_id_pk"] = c_delivery_id_pk;
                    dtTempSelectedDeliveries.Rows.Add(row);
                }
            }

            if (id == "Select a Delivery")
            {
                var rows = dtTempSelectedDeliveries.Select("RowIndex= " + idx + "");
                foreach (var row in rows)
                    row.Delete();
                dtTempSelectedDeliveries.AcceptChanges();
            }
        }

        protected void btnProcessMassCompletion_Click(object sender, EventArgs e)
        {
            string deliveryType = string.Empty;
            string deliveryID = string.Empty;
            string passingStatus = string.Empty;
            string grade = string.Empty;
            int score = 0;
            //For get the completion status and session emplyee/course
            DataTable dtCompletionStatus = TempCompletionStatus();

            // To Calculate the Attendance Passing Status 
            foreach (GridViewRow row in gvCompletionInfo.Rows)
            {
                string c_delivery_id_pk = gvCompletionInfo.DataKeys[row.RowIndex][0].ToString();
                DropDownList ddlAttendance = (DropDownList)row.FindControl("ddlAttendanceStatus");
                DropDownList ddlPassingStatus = (DropDownList)row.FindControl("ddlPassignStatus");
                DropDownList ddlGrade = (DropDownList)row.FindControl("ddlGrade");
                TextBox txtscore = (TextBox)row.FindControl("txtScore");
                TextBox txtCompletionDate = (TextBox)row.FindControl("txtCompletionDate");
                if (!string.IsNullOrEmpty(txtscore.Text) && !string.IsNullOrWhiteSpace(txtscore.Text))
                {
                    //do calculation and change the Passing status Grading Scheme
                    Decimal scoreValue = Convert.ToDecimal(txtscore.Text);
                    score = Convert.ToInt32(scoreValue);
                    SystemGradingSchemes gradevalues = new SystemGradingSchemes();
                    gradevalues = ManageCompletionBLL.GetGradeByScore(c_delivery_id_pk, score);
                    if (!string.IsNullOrEmpty(gradevalues.s_grading_scheme_value_pass_status_id_fk))
                    {
                        if (gradevalues.s_grading_scheme_value_pass_status_id_fk == "app_ddl_pass_text")
                        {
                            passingStatus = "app_ddl_passed_text";
                        }
                        else
                        {
                            passingStatus = "app_ddl_failed_text";
                        }
                        grade = gradevalues.s_grading_scheme_system_value_id_pk;
                    }
                    else
                    {
                        passingStatus = ddlPassingStatus.SelectedValue;
                        grade = ddlGrade.SelectedValue;
                    }
                }
                else
                {
                    passingStatus = ddlPassingStatus.SelectedValue;
                    grade = ddlGrade.SelectedValue;
                }
                DataRow Completionrow;
                Completionrow = dtCompletionStatus.NewRow();
                Completionrow["c_delivery_id_pk"] = c_delivery_id_pk;
                Completionrow["t_transcript_attendance_id_fk"] = ddlAttendance.SelectedValue;
                Completionrow["t_transcript_passing_status_id_fk"] = passingStatus;
                if (!string.IsNullOrEmpty(grade))
                {
                    Completionrow["t_transcript_grade_id_fk"] = grade;
                }
                else
                {
                    Completionrow["t_transcript_grade_id_fk"] = DBNull.Value;
                }
                if (!string.IsNullOrEmpty(txtscore.Text) && !string.IsNullOrWhiteSpace(txtscore.Text))
                {
                    Completionrow["t_transcript_completion_score"] = score;
                }
                else
                {
                    Completionrow["t_transcript_completion_score"] = 0;
                }
                Completionrow["attendance_value"] = ddlAttendance.SelectedItem.Text;
                Completionrow["passsingstatusValue"] = ddlPassingStatus.SelectedItem.Text;
                Completionrow["gradeValue"] = ddlGrade.SelectedItem.Text;
                if (!string.IsNullOrEmpty(txtCompletionDate.Text))
                {
                    Completionrow["t_transcript_completion_date_time"] = txtCompletionDate.Text;
                }
                else
                {
                    Completionrow["t_transcript_completion_date_time"] = DateTime.Now;
                }
                dtCompletionStatus.Rows.Add(Completionrow);
            }

            //This datatable was converted to xml so we merge the all session course and session employee and Completion status
            DataTable dtCourseCompletion = TempCourseCompletionDatatable();

            //To merge the two session wrappers in to one
            for (int i = 0; i < SessionWrapper.Compltion_courses.Rows.Count; i++)
            {
                DropDownList ddlDelivery = (DropDownList)gvCatalog.Rows[i].FindControl("ddlDelivery");
                deliveryID = ddlDelivery.SelectedValue;
                deliveryType = SystemWaitListBLL.GetDeliveryType(ddlDelivery.SelectedValue);

                DataRow courserow;
                courserow = dtCourseCompletion.NewRow();
                courserow["c_course_id_pk"] = SessionWrapper.Compltion_courses.Rows[i]["c_course_system_id_pk"].ToString();
                courserow["c_delivery_id_pk"] = ddlDelivery.SelectedValue;
                courserow["u_user_id_pk"] = Request.QueryString["userId"];
                courserow["delivery_type"] = deliveryType;
                courserow["t_transcript_attendance_id_fk"] = dtCompletionStatus.Rows[i]["t_transcript_attendance_id_fk"].ToString(); //GetAttendance( ddlDelivery.SelectedValue,dtCompletionStatus);
                courserow["t_transcript_passing_status_id_fk"] = dtCompletionStatus.Rows[i]["t_transcript_passing_status_id_fk"].ToString();
                courserow["t_transcript_grade_id_fk"] = dtCompletionStatus.Rows[i]["t_transcript_grade_id_fk"].ToString();
                courserow["t_transcript_completion_score"] = dtCompletionStatus.Rows[i]["t_transcript_completion_score"].ToString();
                courserow["t_transcript_completion_date_time"] = dtCompletionStatus.Rows[i]["t_transcript_completion_date_time"].ToString();
                courserow["attendance_value"] = dtCompletionStatus.Rows[i]["attendance_value"].ToString();
                courserow["passsingstatusValue"] = dtCompletionStatus.Rows[i]["passsingstatusValue"].ToString();
                courserow["gradeValue"] = dtCompletionStatus.Rows[i]["gradeValue"].ToString();
                dtCourseCompletion.Rows.Add(courserow);

            }
            //To pass the transcripts to BLL
            SystemTranscripts transcripts = new SystemTranscripts();
            transcripts.t_transcript_id_pk = Guid.NewGuid().ToString();
            transcripts.t_transcript_assign_id_fk = string.Empty;
            transcripts.t_transcript_enroll_id_fk = string.Empty;
            transcripts.t_transcript_completion_date_time = DateTime.UtcNow;
            transcripts.t_transcript_completion_type_id_fk = "app_ddl_manual_user_mark_completion_text";//doubt
            transcripts.t_transcript_marked_by_user_id_fk = SessionWrapper.u_userid;
            transcripts.t_transcript_required_flag = true;
            transcripts.t_transcript_target_due_date = DateTime.Now; //Target date
            transcripts.t_transcript_actual_date = DateTime.Now; //Actual date  
            transcripts.t_transcript_status_name = "Completed";
            transcripts.t_transcript_time_spent = 0;
            transcripts.t_transcript_score = 0;
            transcripts.t_transcript_credits = 0;
            transcripts.t_transcript_hours = 0;
            transcripts.t_transcript_active_flag = true;
            transcripts.mass_completion = ConvertDataTableToXml(dtCourseCompletion);
            //Audit Log
            string strIPAddress = string.Empty;
            strIPAddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (strIPAddress == "" || strIPAddress == null)
                strIPAddress = Request.ServerVariables["REMOTE_ADDR"];
            transcripts.Userid = SessionWrapper.u_userid;
            transcripts.user_type = SessionWrapper.u_user_type;
            transcripts.user_detail = SessionWrapper.u_lastname + ' ' + SessionWrapper.u_firstname + ' ' + SessionWrapper.u_middlename;
            transcripts.action_desc = "Marked Completion";
            transcripts.ipaddress = strIPAddress;
            transcripts.device = Request.UserAgent;

            try
            {
                DataSet ds = SystemMassCompletionBLL.MassCompletion(transcripts);
                if (ds.Tables[ds.Tables.Count - 1].Rows.Count > 0)
                {
                    SendClosedMailToUser(ds.Tables[ds.Tables.Count - 1]);                  
                }
                if (ds.Tables.Count > 0)
                {
                    divSuccess.Style.Add("display", "block");
                    divSuccess.InnerHtml = "Courses Completed Successfully";
                }
            }
            catch (Exception ex)
            {
                if (ConfigurationWrapper.LogErrors == true)
                {
                    if (ex.InnerException != null)
                    {
                        Logger.WriteToErrorLog("p-samcp-01.aspx", ex.Message, ex.InnerException.Message);
                    }
                    else
                    {
                        Logger.WriteToErrorLog("p-samcp-01.aspx", ex.Message);
                    }
                }
            }
        }

        /// <summary>
        /// Convert Datatable to Xml
        /// </summary>
        /// <param name="dtBuildSql"></param>
        /// <returns></returns>
        public string ConvertDataTableToXml(DataTable dtBuildSql)
        {
            DataSet dsBuildSql = new DataSet("DataSet");

            dsBuildSql.Tables.Add(dtBuildSql.Copy());
            dsBuildSql.Tables[0].TableName = "Table";

            foreach (DataColumn col in dsBuildSql.Tables[0].Columns)
            {
                col.ColumnMapping = MappingType.Attribute;
            }
            return dsBuildSql.GetXml().ToString();
        }

        //Delete Course
        [System.Web.Services.WebMethod]
        public static void DeleteCourse(string args)
        {
            try
            {
                //Delete previous selected course              
                var rows = SessionWrapper.Compltion_courses.Select("c_course_system_id_pk= '" + args.Trim() + "'");
                foreach (var row in rows)
                    row.Delete();
                SessionWrapper.Compltion_employees.AcceptChanges();
            }
            catch (Exception ex)
            {
                //TODO: Show user friendly error here
                //Log here
                if (ConfigurationWrapper.LogErrors == true)
                {
                    if (ex.InnerException != null)
                    {
                        Logger.WriteToErrorLog("p-samcp-01", ex.Message, ex.InnerException.Message);
                    }
                    else
                    {
                        Logger.WriteToErrorLog("p-samcp-01", ex.Message);
                    }
                }
            }

        }

        protected void ddlDelivery_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlCurrentDropDownList = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlCurrentDropDownList.Parent.Parent;

            int idx = row.RowIndex;

            string courseId = gvCatalog.DataKeys[idx][0].ToString();

            AddDataToSelectedDeliveries(idx, ddlCurrentDropDownList.SelectedItem.Text, Convert.ToString(ddlCurrentDropDownList.SelectedValue), courseId, SessionWrapper.Selected_delivery);

            DataView dv = new DataView();
            dv = SessionWrapper.Selected_delivery.DefaultView;
            dv.Sort = "RowIndex asc";

            DataTable dt = dv.ToTable();

            gvCompletionInfo.DataSource = dt;
            gvCompletionInfo.DataBind();
        }

        /// <summary>
        /// Temp Datatable for Course Completion 
        /// </summary>
        /// <returns></returns>

        private DataTable TempCourseCompletionDatatable()
        {
            DataTable dt = new DataTable();

            DataColumn dtColumn;

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "c_course_id_pk";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "c_delivery_id_pk";
            dt.Columns.Add(dtColumn);


            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "u_user_id_pk";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "delivery_type";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "t_transcript_attendance_id_fk";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "t_transcript_passing_status_id_fk";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "t_transcript_grade_id_fk";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "t_transcript_completion_score";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "t_transcript_completion_date_time";
            dt.Columns.Add(dtColumn);
            
            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "attendance_value";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "passsingstatusValue";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "gradeValue";
            dt.Columns.Add(dtColumn);

            return dt;
        }

        /// <summary>
        /// Temp datatable for selected delivery
        /// </summary>
        /// <returns></returns>
        private DataTable TempSelectedDelivery()
        {
            DataTable dt = new DataTable();

            DataColumn dtColumn;

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "Id";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.Int32");
            dtColumn.ColumnName = "RowIndex";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "c_course_system_id_pk";
            dt.Columns.Add(dtColumn);
            //

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "c_delivery_id_pk";
            dt.Columns.Add(dtColumn);
            return dt;
        }

        /// <summary>
        /// Temp datatable for Completion status 
        /// </summary>
        /// <returns></returns>
        private DataTable TempCompletionStatus()
        {
            DataTable dt = new DataTable();

            DataColumn dtColumn;
            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "c_delivery_id_pk";
            dt.Columns.Add(dtColumn);


            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "t_transcript_attendance_id_fk";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "t_transcript_passing_status_id_fk";
            dt.Columns.Add(dtColumn);


            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "t_transcript_grade_id_fk";
            dt.Columns.Add(dtColumn);
            dt.Columns["t_transcript_grade_id_fk"].AllowDBNull = true;

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "t_transcript_completion_score";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.DateTime");
            dtColumn.ColumnName = "t_transcript_completion_date_time";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "attendance_value";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "passsingstatusValue";
            dt.Columns.Add(dtColumn);

            dtColumn = new DataColumn();
            dtColumn.DataType = Type.GetType("System.String");
            dtColumn.ColumnName = "gradeValue";
            dt.Columns.Add(dtColumn);

            return dt;
        }

        /// <summary>
        /// Closed mail
        /// </summary>
        /// <param name="dtMail"></param>
        private void SendClosedMailToUser(DataTable dtMail)
        {
            SystemNotification notificationWailtlist = new SystemNotification();
            notificationWailtlist = SystemNotificationBLL.GetSingleNotificationbyId("ENROLL-WAITLIST-DROPPED", SessionWrapper.CultureName);
            if (notificationWailtlist.s_notification_on_off_flag == true)
            {
                for (int i = 0; i < dtMail.Rows.Count; i++)
                {
                    try
                    {
                        StringBuilder sbEnrolledWarning = new StringBuilder();

                        string warningrSubjectMananger = string.Empty;
                        warningrSubjectMananger = notificationWailtlist.s_notification_email_subject;
                        warningrSubjectMananger = warningrSubjectMananger.Replace("@$&Course Name&$@", dtMail.Rows[i]["courseName"].ToString());
                        //warningrSubjectMananger = warningrSubjectMananger.Replace("@$&User First Name&$@", dtMail.Rows[i]["u_first_name"].ToString());

                        string EnrollTextManager = string.Empty;
                        EnrollTextManager = notificationWailtlist.s_notification_email_text;
                        EnrollTextManager = EnrollTextManager.Replace("@$&User First Name&$@", dtMail.Rows[i]["u_first_name"].ToString());
                        EnrollTextManager = EnrollTextManager.Replace("@$&User Last Name&$@", dtMail.Rows[i]["u_last_name"].ToString());
                        EnrollTextManager = EnrollTextManager.Replace("@$&Course Name&$@(@$&Course ID&$@)", dtMail.Rows[i]["courseName"].ToString());
                        EnrollTextManager = EnrollTextManager.Replace("@$&Delivery Title&$@(@$&Delivery ID&$@)", dtMail.Rows[i]["deliveryName"].ToString());
                        //EnrollTextManager = EnrollTextManager.Replace("@$&Target Due Date&$@", dtMail.Rows[i]["e_curriculum_assign_target_due_date"].ToString());
                        //e_enroll_target_due_date
                        sbEnrolledWarning.Append(EnrollTextManager);

                        string toEmailid = dtMail.Rows[i]["u_email_address"].ToString();
                        string[] toaddress = toEmailid.Split(',');
                        List<MailAddress> mailAddresses = new List<MailAddress>();
                        foreach (string recipient in toaddress)
                        {
                            if (recipient.Trim() != string.Empty)
                            {
                                mailAddresses.Add(new MailAddress(recipient));
                            }
                        }

                        string fromAddress = (ConfigurationManager.AppSettings["FROMMAIL"]);
                        //mailAddresses.Add(new MailAddress(ConfigurationManager.AppSettings["FROMMAIL"]));
                        if (mailAddresses.Count > 0)
                        {
                            Utility.SendEMailMessages(mailAddresses, fromAddress, warningrSubjectMananger, sbEnrolledWarning.ToString());
                        }
                        else
                        {
                            if (!string.IsNullOrEmpty(dtMail.Rows[i]["u_mobile_number"].ToString()))
                            {
                                StringBuilder smsText = new StringBuilder();
                                string[] toPhoneNumber = SessionWrapper.u_mobile_number.Split(',');
                                string username = Server.UrlEncode(ConfigurationManager.AppSettings["mobileusername"]);
                                string passwd = Server.UrlEncode(ConfigurationManager.AppSettings["mobilepwd"]);

                                string messagetext = notificationWailtlist.s_notification_SMS_text;
                                //messagetext = messagetext.Replace("", "");
                                //messagetext = messagetext.Replace("", "");
                                if (messagetext.Length > 180)
                                {
                                    messagetext = messagetext.Substring(0, 179);
                                }
                                messagetext = messagetext.Replace("@$&Status&$@", "Waiting Closed");
                                messagetext = messagetext.Replace("@$&Course Name&$@({Course ID&$@)", dtMail.Rows[i]["courseName"].ToString());
                                Utility.SendSms(toPhoneNumber, username, passwd, messagetext);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        if (ConfigurationWrapper.LogErrors == true)
                        {
                            if (ex.InnerException != null)
                            {
                                Logger.WriteToErrorLog("p-samcp-01", ex.Message, ex.InnerException.Message);
                            }
                            else
                            {
                                Logger.WriteToErrorLog("p-samcp-01", ex.Message);
                            }
                        }
                    }
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "fancyboxclose", "javascript:parent.document.forms[0].submit();parent.jQuery.fancybox.close();", true);
        }

        protected void gvCatalog_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = int.Parse(e.CommandArgument.ToString());
            if (e.CommandName.Equals("Remove"))
            {

                string courseid = gvCatalog.DataKeys[rowIndex].Values[0].ToString();
                var rows = SessionWrapper.Compltion_courses.Select("c_course_system_id_pk= '" + courseid + "'");
                foreach (var row in rows)
                    row.Delete();
                SessionWrapper.Compltion_courses.AcceptChanges();

                var deliveryrows = SessionWrapper.Selected_delivery.Select("c_course_system_id_pk= '" + courseid + "'");
                foreach (var row in deliveryrows)
                    row.Delete();
                SessionWrapper.Selected_delivery.AcceptChanges();
            }

            for (int i = 0; i < SessionWrapper.Compltion_courses.Rows.Count; i++)
            {
                DropDownList ddlDelivery = (DropDownList)gvCatalog.Rows[i].FindControl("ddlDelivery");
                SessionWrapper.Compltion_courses.Rows[i]["c_delivery_system_id_pk"] = ddlDelivery.SelectedValue;
                SessionWrapper.Compltion_courses.AcceptChanges();
            }

            gvCatalog.DataSource = SessionWrapper.Compltion_courses;
            gvCatalog.DataBind();

            gvCompletionInfo.DataSource = SessionWrapper.Selected_delivery;
            gvCompletionInfo.DataBind();
        }
    }
}