﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="saucsp-01.aspx.cs" Inherits="ComplicanceFactor.SystemHome.Catalog.UpdateCurriculumStatuses.saucsp_01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../Styles/Main.css" rel="stylesheet" type="text/css" />
    <div class="content_area_long">
        <div class="div_header_long">
            Curricula Search:
        </div>
        <br />
        <br />
        <div class="div_controls font_1">
            <table>
                <tr>
                    <td>
                        Curriculum Id:
                    </td>
                    <td>
                        <asp:TextBox ID="txtCurriculumId" CssClass="textbox_long" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        Curriculum Title:
                    </td>
                    <td>
                        <asp:TextBox ID="txtCurriculumTitle" CssClass="textbox_long" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        Curriculum Type:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCurriculumType" DataTextField="c_curriculum_type_name" DataValueField="c_curriculum_type_system_id_pk"
                            CssClass="ddl_user_advanced_search" runat="server">
                            <%-- DataTextField="s_curriculum_type_name" DataValueField="s_curriculum_type_system_id_pk"--%>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                    </td>
                </tr>
                <tr>
                    <td>
                        Status:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlStatus" DataTextField="c_curriculum_status_name" DataValueField="c_curriculum_status_id_pk"
                            CssClass="ddl_user_advanced_search" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        Owner:
                    </td>
                    <td>
                        <asp:TextBox ID="txtOwner" CssClass="textbox_long" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        Coordinator:
                    </td>
                    <td>
                        <asp:TextBox ID="txtCoordinator" CssClass="textbox_long" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <br />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <br />
        </div>
        <br />
        <div class="div_controls font_1">
            <table>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="btnReset" runat="server" Text="Reset" />
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td align="right">
                        <asp:Button ID="btnSearch" runat="server" Text="Go Search!" OnClick="btnSearch_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>