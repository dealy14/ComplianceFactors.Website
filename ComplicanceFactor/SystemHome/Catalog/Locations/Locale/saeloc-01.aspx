﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Empty.Master" AutoEventWireup="true"
    CodeBehind="saeloc-01.aspx.cs" Inherits="ComplicanceFactor.SystemHome.Catalog.Locations.Locale.saeloc_01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../../Styles/Main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            width: 650px !important;
            margin: 0;
            font-family: Arial, Sans-Serif;
            font-size: 14px;
            height: 250px;
        }
    </style>
    <div>
        <%--Heading--%>
        <div class="div_header_650" id="divLocaleHeader" runat="server">
            <asp:Label ID="lblLocaleHeading" runat="server"></asp:Label>
        </div>
        <div>
            <br />
            <asp:ValidationSummary class="validation_summary_error" ID="vssacataml" runat="server"
                ValidationGroup="saeresloc" />
            <div class="div_controls font_1">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ValidationGroup="saeresloc"
                                ControlToValidate="txtName" ErrorMessage="<%$ LocalizationResourceExpression: app_validation_name_msg_text %>">&nbsp;
                            </asp:RequiredFieldValidator>
                            * <%=LocalResources.GetLocalizationResourceLabelText("app_location_name_text")%>:
                        </td>
                        <td class="align_left">
                            <asp:TextBox ID="txtName" runat="server" CssClass="textbox_width"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <%=LocalResources.GetLocalizationResourceLabelText("app_description_text")%>:
                        </td>
                        <td>
                            <textarea id="txtDescriptoin" runat="server" rows="3" cols="53"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <%=LocalResources.GetLocalizationResourceLabelText("app_airport_code_text")%>:
                        </td>
                        <td class="align_left">
                            <asp:TextBox ID="txtAirPortCode" runat="server" CssClass="textbox_width"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <div class="div_padding_10">
                <div class="left">
                    <asp:Button ID="btnSave" ValidationGroup="saeresloc" runat="server" Text="<%$ LocalizationResourceExpression: app_save_button_text %>" OnClick="btnSave_Click" />
                </div>
                <div class="right">
                    <asp:Button ID="btnCancel" runat="server" OnClientClick="javascript:document.forms[0].submit();parent.jQuery.fancybox.close()"
                        Text="<%$ LocalizationResourceExpression: app_cancel_button_text %>" />
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
