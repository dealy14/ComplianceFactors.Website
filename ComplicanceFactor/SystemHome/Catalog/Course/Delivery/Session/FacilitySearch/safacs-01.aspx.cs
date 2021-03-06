﻿using System;
using ComplicanceFactor.Common;

namespace ComplicanceFactor.SystemHome.Catalog.DeliveryPopup
{
    public partial class safacs_01 : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGosearch_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["page"]) && Request.QueryString["page"] == "sand")
            {
                Response.Redirect("~/SystemHome/Catalog/Course/Delivery/Session/FacilitySearch/safacsr-01.aspx?page=sand&id=" + SecurityCenter.EncryptText(txtFacilityId.Text) + "&name=" + SecurityCenter.EncryptText(txtFacilityName.Text));
            }
            else if (!string.IsNullOrEmpty(Request.QueryString["page"]) && Request.QueryString["page"] == "saed")
            {
                Response.Redirect("~/SystemHome/Catalog/Course/Delivery/Session/FacilitySearch/safacsr-01.aspx?page=saed&id=" + SecurityCenter.EncryptText(txtFacilityId.Text) + "&name=" + SecurityCenter.EncryptText(txtFacilityName.Text));
            }
        }
    }
}