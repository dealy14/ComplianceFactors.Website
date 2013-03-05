﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ComplicanceFactor.BusinessComponent.DataAccessObject;
using ComplicanceFactor.Common.Languages;
using ComplicanceFactor.BusinessComponent;
using ComplicanceFactor.Common;

namespace ComplicanceFactor.SystemHome.Catalog.Course.Locale
{
    public partial class saaloc_01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["localeText"]))
                {
                    lblLocaleHeading.Text = LocalResources.GetLabel("app_course_information_text") + " (" + Request.QueryString["localeText"] + ")";
                }
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
                ManageCourse InsertLocale = new ManageCourse();
                InsertLocale.s_course_locale_name = txtTitle.Text;
                InsertLocale.s_course_locale_description = txtDescriptoin.Value;
                InsertLocale.s_locale_id_fk = Request.QueryString["localeid"];
                InsertLocale.s_course_system_id_fk =Request.QueryString["editCourseId"];
                InsertLocale.s_course_locale_abstract = txtAbstract.Value;
                try
                {
                    ManageCourseBLL.InsertCourseLocale(InsertLocale);
                }
                catch (Exception ex)
                {
                    //Log here
                    if (ConfigurationWrapper.LogErrors == true)
                    {
                        if (ex.InnerException != null)
                        {
                            Logger.WriteToErrorLog("saaloc-01.aspx", ex.Message, ex.InnerException.Message);
                        }
                        else
                        {
                            Logger.WriteToErrorLog("saaloc-01.aspx", ex.Message);
                        }
                    }
                }

            //Close fancybox
            Page.ClientScript.RegisterStartupScript(this.GetType(), "fancyboxclose", "javascript:parent.document.forms[0].submit();parent.jQuery.fancybox.close();", true);
        }
       

    }
}