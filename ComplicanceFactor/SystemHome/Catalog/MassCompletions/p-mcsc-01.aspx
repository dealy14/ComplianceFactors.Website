﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Empty.Master" AutoEventWireup="true"
    CodeBehind="p-mcsc-01.aspx.cs" Inherits="ComplicanceFactor.SystemHome.Catalog.MassCompletions.p_mcsc_01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../Styles/Main.css" rel="stylesheet" type="text/css" />
    <script src="../../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <style type="text/css">
        body
        {
            width: 700px !important;
            margin: 0;
            font-family: Arial, Sans-Serif;
            font-size: 14px;
            height: 150px;
        }
    </style>
    <script type="text/javascript">
        function resetall() {
            document.getElementById('<%=txtCatalogName.ClientID %>').value = '';
            document.getElementById('<%=txtCatalogId.ClientID %>').value = '';
            return false;
        }
    </script>
    <asp:Panel ID="pnlDefault" runat="server" DefaultButton="btnGosearch">
       <div id="content">
            <div class=" div_header_700">
                <%=LocalResources.GetLabel("app_catalog_item_search_text")%>:
            </div>
            <br />
            <div class="div_controls font_1">
                <table>
                    <tr>
                        <td>
                            <%=LocalResources.GetLabel("app_catalog_item_name_text")%>:
                        </td>
                        <td>
                            <asp:TextBox ID="txtCatalogName" CssClass="textbox_long" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <%=LocalResources.GetLabel("app_catalog_item_id_text")%>:
                        </td>
                        <td>
                            <asp:TextBox ID="txtCatalogId" CssClass="textbox_long" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <table class="table_td_300">
                    <tr>
                        <td>
                            <asp:Button ID="btnGoSearch" runat="server" Text="<%$ LabelResourceExpression: app_go_search_button_text %>"
                                OnClick="btnGoSearch_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnReset" OnClientClick="return resetall();" runat="server" Text="<%$ LabelResourceExpression: app_reset_button_text %>" />
                        </td>
                        <td>
                            <asp:Button ID="btnCancel" OnClientClick="javascript:document.forms[0].submit();parent.jQuery.fancybox.close();"
                                runat="server" Text="<%$ LabelResourceExpression: app_cancel_button_text %>" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
