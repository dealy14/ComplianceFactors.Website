﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ComplicanceFactor.BusinessComponent;
using ComplicanceFactor.Common;
using System.Web.UI.HtmlControls;
using ComplicanceFactor.BusinessComponent.DataAccessObject;
using ComplicanceFactor.Common.Languages;

namespace ComplicanceFactor.Compliance
{
    public partial class ccppp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SessionWrapper.navigationText = "app_nav_compliance";

                Label lblBreadCrumb = (Label)Master.FindControl("lblBreadCrumb");
                lblBreadCrumb.Text = "<a href=/Compliance/cchp-01.aspx>" + LocalResources.GetLocaleResourceString("app_nav_compliance") + "</a>" + " > " + "<a href=/Compliance/cchp-01.aspx>" + LocalResources.GetGlobalLabel("app_home_text") + "</a>&nbsp;" + " >&nbsp;" + LocalResources.GetGlobalLabel("app_manager_pod_mprofile_title");

                //timezone
                ddlTimezone.DataSource = UserBLL.GetUserTimeZone();
                ddlTimezone.DataBind();
                //language
                ddlLocale.DataSource = UserBLL.GetLocalelist();
                ddlLocale.DataBind();
                //mobile carrier
                ddlCarrier.DataSource = UserBLL.GetCarrierType(SessionWrapper.CultureName, "lppp-01");
                ddlCarrier.DataBind();
                //mobile type
                ddlMobileType.DataSource = UserBLL.GetMobileType(SessionWrapper.CultureName, "lppp-01");
                ddlMobileType.DataBind();
                //country
                ddlCountry.DataSource = UserBLL.GetCountrylist();
                ddlCountry.DataBind();

                ddlCollapsedMyTodo.DataSource = UserBLL.GetExpandCollapse(SessionWrapper.CultureName, "lppp-01");
                ddlCollapsedMyTodo.DataBind();
                //Expand and collapsed for curricula
                ddlCollapsedHarm.DataSource = UserBLL.GetExpandCollapse(SessionWrapper.CultureName, "lppp-01");
                ddlCollapsedHarm.DataBind();

                ddlCollapsedGiris.DataSource = UserBLL.GetExpandCollapse(SessionWrapper.CultureName, "lppp-01");
                ddlCollapsedGiris.DataBind();
                //Expand and collapsed for learning history
                ddlCollapsedReport.DataSource = UserBLL.GetExpandCollapse(SessionWrapper.CultureName, "lppp-01");
                ddlCollapsedReport.DataBind();

                //get user information
                PopulateUserInfo(SessionWrapper.u_userid);
            }
        }

        private void PopulateUserInfo(string userId)
        {
            User edituser = new User();
            try
            {
                edituser = UserBLL.GetUserInfo_by_id(userId);
                //username decrypt
                HashEncryption encHash = new HashEncryption();
                lblUserName.Text = encHash.Decrypt(edituser.Username_enc_ash, true);
                //end
                lblFirstName.Text = edituser.Firstname;
                txtMiddleName.Text = edituser.Middlename;
                lblLastName.Text = edituser.Lastname;
                txtEmailAddress.Text = edituser.EmailId;
                ddlMobileType.SelectedValue = edituser.Mobiletype.Trim();
                ddlCarrier.SelectedValue = edituser.MobileCarrier;
                txtMobilenumber.Text = edituser.MobileNumber;
                txtWorkPhone.Text = edituser.WorkPhone;
                txtWorkExtension.Text = edituser.Workextension;
                txtAddress1.Text = edituser.Address1;
                txtAddress2.Text = edituser.Address2;
                txtAddress3.Text = edituser.Address3;
                txtCity.Text = edituser.City;
                txtStateprovince.Text = edituser.StateProvince;
                txtzippostalcode.Text = edituser.ZipPostalcode;
                ddlCountry.SelectedValue = edituser.Country;
                ddlLocale.SelectedValue = edituser.LocaleId;
                ddlTimezone.SelectedValue = edituser.TimezoneId;
                ddlLocale.SelectedValue = edituser.LocaleId;
                lblManager.Text = edituser.Hris_manager_text;
                lblSupervisor.Text = edituser.Hris_supervisor_text;
                lblMentor.Text = edituser.Hris_mentor_text;
                lblAltManager.Text = edituser.Hris_Alternate_manager_text;
                lblAltSupervisor.Text = edituser.Hris_alternate_supervisor_text;
                lblAltMentor.Text = edituser.Alternate_mentor_text;

                ddlCollapsedMyTodo.SelectedValue = edituser.u_profile_my_comp_todos_collapse_pref;
                ddlCollapsedHarm.SelectedValue = edituser.u_profile_my_comp_harm_collapse_pref;
                ddlCollapsedGiris.SelectedValue = edituser.u_profile_my_comp_giris_collapse_pref;
                ddlCollapsedReport.SelectedValue = edituser.u_profile_my_comp_reports_collapse_pref;
                ddlNumberOfRecordMyTodo.SelectedValue = Convert.ToString(edituser.u_profile_my_comp_todos_display_pref);
                ddlNumberOfRecourdsHarm.SelectedValue = Convert.ToString(edituser.u_profile_my_comp_harm_display_pref);
                ddlNumberOfRecordsGiris.SelectedValue = Convert.ToString(edituser.u_profile_my_comp_giris_display_pref);
                ddlNumberOfRecordsReport.SelectedValue = Convert.ToString(edituser.u_profile_my_comp_reports_display_pref);

            }
            catch (Exception ex)
            {
                //TODO: Show user friendly error here
                //Log here
                if (ConfigurationWrapper.LogErrors == true)
                {
                    if (ex.InnerException != null)
                    {
                        Logger.WriteToErrorLog("tappp-01(admin)", ex.Message, ex.InnerException.Message);
                    }
                    else
                    {
                        Logger.WriteToErrorLog("tappp-01(admin)", ex.Message);
                    }
                }
            }

        }
        private void UpdateProfile()
        {
            User updateuser = new User();
            updateuser.Userid = SessionWrapper.u_userid;
            updateuser.Middlename = txtMiddleName.Text;
            updateuser.EmailId = txtEmailAddress.Text;
            updateuser.Mobiletype = ddlMobileType.SelectedValue;
            updateuser.MobileCarrier = ddlCarrier.SelectedValue;
            updateuser.MobileNumber = txtMobilenumber.Text;
            updateuser.WorkPhone = txtWorkPhone.Text;
            updateuser.Workextension = txtWorkExtension.Text;
            updateuser.Address1 = txtAddress1.Text;
            updateuser.Address2 = txtAddress2.Text;
            updateuser.Address3 = txtAddress3.Text;
            updateuser.City = txtCity.Text;
            updateuser.StateProvince = txtStateprovince.Text;
            updateuser.ZipPostalcode = txtzippostalcode.Text;
            updateuser.Country = ddlCountry.SelectedValue;
            updateuser.LocaleId = ddlLocale.SelectedValue;
            updateuser.TimezoneId = ddlTimezone.SelectedValue;
            updateuser.u_profile_my_comp_todos_collapse_pref = ddlCollapsedMyTodo.SelectedValue;
            updateuser.u_profile_my_comp_harm_collapse_pref = ddlCollapsedHarm.SelectedValue;
            updateuser.u_profile_my_comp_giris_collapse_pref = ddlCollapsedGiris.SelectedValue;
            updateuser.u_profile_my_comp_reports_collapse_pref = ddlCollapsedReport.SelectedValue;
            int tempNumberOfRecordstodo, tempNumberofRecordsHarm, tempNumberofRecordsGiris, tempNumberofRecordsReport;



            if (int.TryParse(ddlNumberOfRecordMyTodo.SelectedValue, out tempNumberOfRecordstodo))
            {
                updateuser.u_profile_my_comp_todos_display_pref = tempNumberOfRecordstodo;
            }
            else
            {
                updateuser.u_profile_my_comp_todos_display_pref = 0;
            }
            if (int.TryParse(ddlNumberOfRecourdsHarm.SelectedValue, out tempNumberofRecordsHarm))
            {
                updateuser.u_profile_my_comp_harm_display_pref = tempNumberofRecordsHarm;
            }
            else
            {
                updateuser.u_profile_my_comp_harm_display_pref = 0;
            }
            if (int.TryParse(ddlNumberOfRecordsGiris.SelectedValue, out tempNumberofRecordsGiris))
            {
                updateuser.u_profile_my_comp_giris_display_pref = tempNumberofRecordsGiris;
            }
            else
            {
                updateuser.u_profile_my_comp_giris_display_pref = 0;
            }

            if (int.TryParse(ddlNumberOfRecordsReport.SelectedValue, out tempNumberofRecordsReport))
            {
                updateuser.u_profile_my_comp_reports_display_pref = tempNumberofRecordsReport;
            }
            else
            {
                updateuser.u_profile_my_comp_reports_display_pref = 0;
            }
            updateuser.type = "Admin";
            updateuser.u_profile_my_todos_records_display_pref = 0;
            updateuser.u_profile_my_team_records_display_pref = 0;
            updateuser.u_profile_my_report_history_records_display_pref = 0;
            updateuser.u_profile_my_todos_collapse_pref = string.Empty;
            updateuser.u_profile_my_team_collapse_pref = string.Empty;
            updateuser.u_profile_my_report_history_collapse_pref = string.Empty;
            try
            {
                int result = ComplianceBLL.UpdateUserProfile_Compliance(updateuser);
                if (result != -1)
                {
                    SessionWrapper.u_profile_my_comp_todos_collapse_pref = updateuser.u_profile_my_comp_todos_collapse_pref;
                    SessionWrapper.u_profile_my_comp_harm_collapse_pref = updateuser.u_profile_my_comp_harm_collapse_pref;
                    SessionWrapper.u_profile_my_comp_giris_collapse_pref = updateuser.u_profile_my_comp_giris_collapse_pref;
                    SessionWrapper.u_profile_my_comp_reports_collapse_pref = updateuser.u_profile_my_comp_reports_collapse_pref;

                    SessionWrapper.u_profile_my_comp_todos_display_pref = updateuser.u_profile_my_comp_todos_display_pref;
                    SessionWrapper.u_profile_my_comp_harm_display_pref = updateuser.u_profile_my_comp_harm_display_pref;
                    SessionWrapper.u_profile_my_comp_giris_display_pref = updateuser.u_profile_my_comp_giris_display_pref;
                    SessionWrapper.u_profile_my_comp_reports_display_pref = updateuser.u_profile_my_comp_reports_display_pref;

                    HtmlGenericControl divSuccess = (HtmlGenericControl)Master.FindControl("success_login");
                    divSuccess.Style.Add("display", "none");
                    success_msg.Style.Add("display", "block");
                    success_msg.InnerText = LocalResources.GetText("app_succ_update_text");
                    error_msg.Style.Add("display", "none");
                }
                else
                {
                    HtmlGenericControl divSuccess = (HtmlGenericControl)Master.FindControl("success_login");
                    divSuccess.Style.Add("display", "none");
                    success_msg.Style.Add("display", "none");
                    error_msg.Style.Add("display", "block");
                    error_msg.InnerText = LocalResources.GetText("app_date_not_updated_error_wrong");

                }

            }
            catch (Exception ex)
            {
                //TODO: Show user friendly error here
                //Log here
                if (ConfigurationWrapper.LogErrors == true)
                {
                    if (ex.InnerException != null)
                    {
                        Logger.WriteToErrorLog("tappp-01(admin)", ex.Message, ex.InnerException.Message);
                    }
                    else
                    {
                        Logger.WriteToErrorLog("tappp-01(admin)", ex.Message);
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            UpdateProfile();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Compliance/cchp-01.aspx");
        }
    }
}