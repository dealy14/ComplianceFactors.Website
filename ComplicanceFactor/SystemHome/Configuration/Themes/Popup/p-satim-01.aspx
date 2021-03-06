﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Empty.Master" AutoEventWireup="true"
    CodeBehind="p-satim-01.aspx.cs" Inherits="ComplicanceFactor.SystemHome.Configuration.Themes.Popup.p_satim_01" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../../Styles/Main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            width: 640px !important;
            margin: 0px 0 0 0;
            font-family: Arial, Sans-Serif;
            font-size: 14px;
            height: 200px;
        }
    </style>
    <script type="text/javascript">
    function ValidateFileUpload(source, args) {
        var fuData = document.getElementById('<%= fupFiles.ClientID %>');
        var FileUploadPath = fuData.value;
        if (FileUploadPath == '') {
                // There is no file selected
                window.scrollTo = function () { }
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }

        function HideFileValidationSummary() {
            $("#<%=vsFileUpload.ClientID%>").hide();
        }
    </script>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" ScriptMode="Release">
    </asp:ToolkitScriptManager>
    <div id="content">
    <div>
        <div class="uploadpopup_header">
            <div class="left">
                <%=LocalResources.GetLabel("app_add_digital_media_file_text")%>:
                <%--<asp:Label ID="lblHeading" Text="Add Digital Media File" runat="server"></asp:Label>--%>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <div>
        <br />
        <div class="uploadpanel font_normal">
            <asp:ValidationSummary class="validation_summary_error_popup" ID="vsFileUpload" runat="server"
                ValidationGroup="themeUpload" />
            <asp:CustomValidator ValidationGroup="themeUpload" ID="cvFileUpload" runat="server"
                EnableClientScript="true" ErrorMessage="<%$ TextResourceExpression: app_select_file_error_empty%>" ClientValidationFunction="ValidateFileUpload">&nbsp;</asp:CustomValidator>
            <div class="div_controls">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top">
                            <%=LocalResources.GetLabel("app_select_file_text")%>:
                        </td>
                        <td>
                            <asp:FileUpload ID="fupFiles" runat="server" Width="460" size="60" />
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <br />
            <br />
            <div class="multiple_button">
                <asp:Button ID="btnUploadAttachment" ValidationGroup="themeUpload" runat="server"
                    Text="<%$ LabelResourceExpression:app_upload_button_text %>" CssClass="cursor_hand" OnClick="btnUploadAttachment_Click" />
            </div>
            <asp:Button ID="btnCancel" CssClass="cursor_hand" runat="server" Text="<%$ LabelResourceExpression: app_cancel_button_text %>" />
        </div>
        <br />
    </div>
    </div>
</asp:Content>
