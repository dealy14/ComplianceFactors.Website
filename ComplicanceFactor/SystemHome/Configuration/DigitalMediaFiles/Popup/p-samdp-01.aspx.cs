﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ComplicanceFactor.SystemHome.Configuration.DigitalMediaFiles.Popup
{
    public partial class p_samdp_01 : System.Web.UI.Page
    {
        protected string file_url = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            //string filename = Request.QueryString["fname"].ToString();
            //string type = Request.QueryString["ftype"].ToString();

            //if ((type == "JPEG") || (type == "GIF") || (type == "PNG"))
            //{
            //    ltlPreview.Text = "<object data=../Images/" + filename + " width='722' height='500'/>";
            //}
            //else if ((type == "PDF") || (type == "DOC") || (type == "XLS") || (type == "PPT") || (type == "Other"))
            //{
            //    ltlPreview.Text = "<iframe id='documentLoader' src=https://docs.google.com/viewer?url=" + Request.Url.Host.ToLower() + "/SystemHome/Configuration/DigitalMediaFiles/Images/" + filename + "&embedded=true width='722' height='500';/>";
            //}
            //else if ((type == "SWF") || (type == "MPEG") || (type == "MOV") || (type == "AVI") || (type == "WMA") || (type == "MP3"))
            //{
            //    ltlPreview.Text = "<object classid='clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921' codebase='http://download.videolan.org/pub/videolan/vlc/last/win32/axvlc.cab' width='722' height='500'> <param name='quality' value='high' /> <embed type='application/x-vlc-plugin' pluginspage='http://www.videolan.org' autoplay='yes' lop='no' width='722' height='500'   ID='Video1' src='../Images/ " + filename + "' value='../Images/ " + filename + "' /></object>";
            //}
            file_url = "http://download.microsoft.com/download/5/5/A/55AA7482-CB4F-45BB-A280-8B8D2D9E6EDA/Winvideo-VWD-06-Controls101l.wmv";
        }

    }
}