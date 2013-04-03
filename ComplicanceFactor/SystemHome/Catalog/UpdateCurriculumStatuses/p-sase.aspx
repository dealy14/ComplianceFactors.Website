﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Empty.Master" AutoEventWireup="true"
    CodeBehind="p-sase.aspx.cs" Inherits="ComplicanceFactor.SystemHome.Catalog.UpdateCurriculumStatuses.p_sase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../Styles/Main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            /*width: 960px;*/
            width: 700px !important;
            margin: 0px 0 0 0;
            font-family: Arial, Sans-Serif;
            font-size: 14px;
            height: 200px;
            overflow: hidden;
        }
    </style>
    <div>
        <asp:Panel ID="pnlDefault" runat="server">
            <div class="div_header_700">
                Employee Search::
            </div>
            <br />
            <div class="div_controls font_1">
                <table>
                    <tr>
                        <td>
                            Emplopyee Name:
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmployeeName" CssClass="textbox_long" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            Employee Number:
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmployeeNumber" CssClass="textbox_long" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="align_left">
                            <asp:Button ID="btnGoSearch" CssClass="cursor_hand" Text="Go Search !" runat="server"
                                OnClick="btnGoSearch_Click" />
                        </td>
                        <td class="align_left">
                            <asp:Button ID="btnReset" CssClass="cursor_hand" Text="Reset" OnClientClick="return resetall();"
                                runat="server" />
                        </td>
                        <td class="align_right">
                            <asp:Button ID="btnCancel" CssClass="cursor_hand" OnClientClick="javascript:document.forms[0].submit();parent.jQuery.fancybox.close();"
                                runat="server" Text="Cancel" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    </div>
</asp:Content>