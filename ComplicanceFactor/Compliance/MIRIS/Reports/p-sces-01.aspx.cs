﻿using System;
using ComplicanceFactor.Common;

namespace ComplicanceFactor.Compliance.MIRIS.Reports
{
    public partial class p_sces_01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGoSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Compliance/MIRIS/Reports/p-scesr-01.aspx?eno=" + SecurityCenter.EncryptText(txtEmployeeNumber.Text) + "&ename=" + SecurityCenter.EncryptText(txtEmployeeName.Text) + "&editDeliveryId=" + SecurityCenter.EncryptText(Request.QueryString["editDeliveryId"].ToString()), false);
        }
        
    }
}