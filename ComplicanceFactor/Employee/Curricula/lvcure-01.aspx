﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="lvcure-01.aspx.cs" Inherits="ComplicanceFactor.Employee.Curricula.lvcure_01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery.fancybox.js" type="text/javascript"></script>
    <link href="../../../Scripts/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

       //Select single enroll at a time
        function SelectSingleEnroll(rdbtnid) {
            var rdBtn = document.getElementById(rdbtnid);
            var rdBtnList = document.getElementsByTagName("input");
            for (i = 0; i < rdBtnList.length; i++) {
                if (rdBtnList[i].type == "radio" && rdBtnList[i].id != rdBtn.id) {
                    rdBtnList[i].checked = false;
                }
            }
        }

        $(document).ready(function () {
            $('#app_nav_employee').addClass('selected');
            // toggles the slickbox on clicking the noted link  
            $('.main_menu li a').hover(function () {

                $('.main_menu li a').removeClass('selected');
                $(this).addClass('active');

                return false;
            });
            $('.main_menu li a').mouseleave(function () {

                $('#app_nav_employee').addClass('selected');
                return false;
            });

            $(".viewdetails").click(function () {
                //Get the Id of the record to delete
                var record_id = $(this).attr("id");
                //Get the GridView Row reference
                var tr_id = $(this).parents("#.record");
                $.fancybox({

                    'type': 'iframe',
                    'titlePosition': 'over',
                    'titleShow': true,
                    'showCloseButton': true,
                    'scrolling': 'yes',
                    'autoScale': false,
                    'autoDimensions': false,
                    'helpers': { overlay: { closeClick: false} },
                    'width': 700,
                    'height': 200,
                    'margin': 0,
                    'padding': 0,
                    'overlayColor': '#000',
                    'overlayOpacity': 0.7,
                    'hideOnOverlayClick': false,
                    'href': '/Employee/Course/p-lvcd-01.aspx?id=' + record_id,
                    'onComplete': function () {
                        $.fancybox.showActivity();
                        $('#fancybox-frame').load(function () {
                            $.fancybox.hideActivity();
                            $('#fancybox-content').height($(this).contents().find('body').height() + 20);
                            var heightPane = $(this).contents().find('#content').height();
                            $(this).contents().find('#fancybox-frame').css({
                                'height': heightPane + 'px'

                            })
                        });

                    }

                });

            });

        });

    </script>
    <div class="content_area_long">
        <div class="div_header_long">
            Curriculum Information:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td class="text_font_normal">
                        * Curriculum Id
                    </td>
                    <td class="lable_td_width_1">
                        <asp:Label ID="lblCurriculumId" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td class="text_font_normal">
                        * Curriculum Title
                    </td>
                    <td class="align_left">
                        <asp:Label ID="lblCurriculumTitle" CssClass="lable_td_width" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text_font_normal" valign="top">
                        * Description
                    </td>
                    <td class="lable_td_width_1" colspan="6">
                        <asp:Label ID="lblDescription" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text_font_normal" valign="top">
                        Abstract:
                    </td>
                    <td class="lable_td_width_1" colspan="6">
                        <asp:Label ID="lblAbstract" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text_font_normal">
                        Version:
                    </td>
                    <td class="align_left">
                        <asp:Label ID="lblVersion" CssClass="lable_td_width" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td class="text_font_normal">
                        &nbsp;
                    </td>
                    <td class="lable_td_width_1">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="text_font_normal">
                        Owner:
                    </td>
                    <td class="lable_td_width_1">
                        <asp:Label ID="lblOwner" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td class="text_font_normal">
                        Coordinator:
                    </td>
                    <td class="lable_td_width_1">
                        <asp:Label ID="lblcoordinator" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text_font_normal">
                        Cost:
                    </td>
                    <td class="align_left">
                        <asp:Label ID="lblCost" CssClass="lable_td_width" runat="server"></asp:Label>
                    </td>
                    <td colspan="3">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="text_font_normal">
                                    Credit Hours
                                </td>
                                <td class="lable_td_width_1">
                                    <asp:Label ID="lblCreditHours" CssClass="lable_td_width" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="text_font_normal">
                        Credit Units:
                    </td>
                    <td class="lable_td_width_1">
                        <asp:Label ID="lblCreditUnits" CssClass="lable_td_width" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text_font_normal">
                        Status:
                    </td>
                    <td class="align_left">
                        <asp:Label ID="lblStatus" CssClass="lable_td_width" runat="server"></asp:Label>
                    </td>
                    <td colspan="2">
                        <table cellpadding="0" cellspacing="0" style="margin: 0 0 0 38px;">
                            <tr>
                                <td class="text_font_normal">
                                    Visible:
                                </td>
                                <td class="lable_td_width_1">
                                    <asp:Label ID="lblVisible" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td colspan="2" class="text_font_normal">
                        Approval Required:
                        <asp:Label ID="lblChkApprovalRequired" Font-Bold="true" CssClass="lable_td_width"
                            runat="server"></asp:Label>
                    </td>
                    <td class="lable_td_width_1">
                        <asp:Label ID="lblApprovalRequired" CssClass="lable_td_width" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <asp:DataList ID="dlPath" runat="server" ShowHeader="false" ShowFooter="true" CellPadding="0"
            CssClass="grid_870" CellSpacing="0" OnItemDataBound="dlPath_ItemDataBound" DataKeyField="c_curricula_path_system_id_pk">
            <ItemTemplate>
                <div class="div_header_long">
                    <%#Eval("c_curricula_path_name")%>
                </div>
                <br />
                <div class="div_controls font_1">
                    <asp:Label ID="lblCompleteSection" runat="server"></asp:Label>
                </div>
                <asp:GridView ID="gvSection" ShowHeader="false" CellPadding="0" CellSpacing="0" CssClass="gridview_long_no_border tablesorter"
                    runat="server" EmptyDataText="No result found." GridLines="None" DataKeyNames="c_curricula_path_id_fk,c_curricula_path_section_id_pk"
                    AutoGenerateColumns="False" OnRowDataBound="gvSection_RowDataBound" EmptyDataRowStyle-CssClass="empty_row"
                    PagerSettings-Visible="false">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <hr />
                                section:
                                <%#Eval("c_curricula_path_section_seq_number")%>
                                <asp:Label ID="lblComplete" runat="server"></asp:Label>
                                <asp:GridView ID="gvCourses" CellPadding="0" CellSpacing="0" CssClass="gridview_long_no_border tablesorter"
                                    runat="server" EmptyDataText="No result found." GridLines="None" ShowFooter="true"
                                    RowStyle-CssClass="record" DataKeyNames="c_curricula_path_course_id_fk" AutoGenerateColumns="False"
                                    EmptyDataRowStyle-CssClass="empty_row" OnRowCommand="gvCourses_RowCommand" OnRowDataBound="gvCourses_RowDataBound"
                                    PagerSettings-Visible="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Course Title (ID)" HeaderStyle-CssClass="gridview_row_width_7"
                                            HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="gridview_row_width_3 font_9"
                                            ItemStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <%#Eval("title")%>
                                                <asp:GridView ID="gvDeliveries" CellPadding="0" CellSpacing="0" ShowHeader="false"
                                                    runat="server" AutoGenerateColumns="false" GridLines="None" OnRowDataBound="gvDeliveries_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-CssClass="font_9">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDelivery" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <br />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="gridview_row_width_1" ItemStyle-CssClass="gridview_row_width_1 font_9"
                                            HeaderText="Required" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <%#Eval("required") %><br />
                                                <asp:GridView ID="gvLocation" CellPadding="0" CellSpacing="0" ShowHeader="false"
                                                    runat="server" AutoGenerateColumns="false" GridLines="None" OnRowDataBound="gvLocation_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-CssClass="font_9" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblLocation" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="gridview_row_width_1" ItemStyle-CssClass="gridview_row_width_1 font_9"
                                            HeaderText="Due Date" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <%#Eval("duedate") %>
                                                <br />
                                                <asp:GridView ID="gvRoom" CellPadding="0" CellSpacing="0" ShowHeader="false" runat="server"
                                                    AutoGenerateColumns="false" GridLines="None" OnRowDataBound="gvRoom_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-CssClass="font_9" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRoom" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="gridview_row_width_1" ItemStyle-CssClass="gridview_row_width_2 font_9"
                                            HeaderText="Status" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <%#Eval("status") %><br />
                                                <asp:GridView ID="gvFacility" CellPadding="0" CellSpacing="0" ShowHeader="false"
                                                    runat="server" AutoGenerateColumns="false" GridLines="None" OnRowDataBound="gvFacility_RowDataBound">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-CssClass="font_9" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFacility" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="gridview_row_width_1" ItemStyle-CssClass="gridview_row_width_1"
                                            HeaderStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <input type="button" id="<%#Eval("c_delivery_system_id_pk")%>" value='<asp:Literal ID="ltlViewDetails" runat="server" Text="View Details" />'
                                                    class="viewdetails cursor_hand" />
                                                <%--<asp:Button ID="btnViewDetail" CssClass="cursor_hand viewdetails" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                                    CommandName="View" runat="server" Text="View Details" />--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="gridview_row_width_1" ItemStyle-CssClass="gridview_row_width_2 font_9"
                                            HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMessage" runat="server"></asp:Label><br />
                                                <asp:GridView ID="gvEnroll" DataKeyNames="c_delivery_system_id_pk,c_course_id_fk"
                                                    CellPadding="0" CellSpacing="0" ShowHeader="false" runat="server" AutoGenerateColumns="false"
                                                    GridLines="None">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-CssClass="font_9" ItemStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <%--<asp:CheckBox ID="chkEnroll" runat="server" />--%>
                                                                <asp:RadioButton ID="rdbEnroll" runat="server" OnClick="javascript:SelectSingleEnroll(this.id)" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ItemTemplate>
        </asp:DataList>
        <br />
        <br />
        <br />
        <div class="div_padding_10">
            <div class="right">
                <asp:Button ID="btnEnrollInSelected" CssClass="cursor_hand" runat="server" Text="Enroll in Selected"
                    OnClick="btnEnrollInSelected_Click" />
            </div>
            <div class="clear">
            </div>
        </div>
        <br />
        <br />
    </div>
</asp:Content>
