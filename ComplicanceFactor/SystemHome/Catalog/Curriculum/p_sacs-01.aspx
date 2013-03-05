﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Empty.Master" AutoEventWireup="true" CodeBehind="p_sacs-01.aspx.cs" Inherits="ComplicanceFactor.SystemHome.Catalog.Curriculum.p_sacs_01" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../../../Styles/Main.css" rel="stylesheet" type="text/css" />
 <script src="../../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
 <style type="text/css">
        body
        {
            /*width: 960px;*/
            width: 900px !important;
            margin: 0px 0 0 0;
            font-family: Arial, Sans-Serif;
            font-size: 14px;
            height: 150px;
        }
    </style>
    <script type="text/javascript">
        function resetall() {
            document.getElementById('<%=txtCurriculimId.ClientID %>').value = '';
            document.getElementById('<%=txtTitle.ClientID %>').value = '';

            return false;
        }
    </script>
    <script type="text/javascript">
        $(document).keypress(function (e) {
            if (e.which == 13) {
                document.getElementById('<%=btnGosearch.ClientID %>').click();
                return true;

            }
        });


    </script>
    <div>
        <asp:Panel ID="pnlDefault" runat="server" DefaultButton="btnGosearch">
            <div class="div_header_popup_1">
                Curriculum Advanced Search:
            </div>
            <br />
            <div class="div_controls font_1">
                <table>
                    <tr>
                        <td>
                            Curriculum Id:
                        </td>
                        <td>
                            <asp:TextBox ID="txtCurriculimId" CssClass="textbox_long" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            Title:
                        </td>
                        <td>
                            <asp:TextBox ID="txtTitle" CssClass="textbox_long" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="align_left">
                            <asp:Button ID="btnGosearch" CssClass="cursor_hand" Text="Go Search !" runat="server"
                                OnClick="btnGosearch_Click" />
                        </td>
                        <td class="align_left" >
                            <asp:Button ID="btnReset" CssClass="cursor_hand" Text="Reset" OnClientClick="return resetall();"
                                runat="server" />
                        </td>
                        <td class="align_right"  >
                            <asp:Button ID="btnCancel" CssClass="cursor_hand"  OnClientClick="javascript:document.forms[0].submit();parent.jQuery.fancybox.close();" runat="server" Text="Cancel" />
                        </td>
                    </tr>
                </table>
            </div>

        </asp:Panel>
    </div>
</asp:Content>
