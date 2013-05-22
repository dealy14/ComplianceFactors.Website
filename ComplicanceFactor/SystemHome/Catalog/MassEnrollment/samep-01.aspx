﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="samep-01.aspx.cs" Inherits="ComplicanceFactor.SystemHome.Catalog.MassEnrollment.samep_01" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery.fancybox.js" type="text/javascript"></script>
    <link href="../../../Scripts/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <link href="../../../Styles/Main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        $(document).ready(function () {

            //Get the Id 
            $(".addcourse").click(function () {
                $.fancybox({
                    'type': 'iframe',
                    'titlePosition': 'over',
                    'titleShow': true,
                    'showCloseButton': true,
                    'scrolling': 'yes',
                    'autoScale': false,
                    'autoDimensions': false,
                    'helpers': { overlay: { closeClick: false} },
                    'width': 733,
                    'height': 200,
                    'margin': 0,
                    'padding': 0,
                    'overlayColor': '#000',
                    'overlayOpacity': 0.7,
                    'hideOnOverlayClick': false,
                    'href': '/SystemHome/Catalog/MassEnrollment/Popup/p-mcsc-01.aspx',
                    'onComplete': function () {
                        $('#fancybox-frame').load(function () {
                            $('#fancybox-content').height($(this).contents().find('body').height() + 20);
                            var heightPane = $(this).contents().find('#content').height();
                            $(this).contents().find('#fancybox-frame').css({
                                'height': heightPane + 'px'

                            })
                        });

                    }

                });
            });




            $(".addemployee").click(function () {
                $.fancybox({
                    'type': 'iframe',
                    'titlePosition': 'over',
                    'titleShow': true,
                    'showCloseButton': true,
                    'scrolling': 'yes',
                    'autoScale': false,
                    'autoDimensions': false,
                    'helpers': { overlay: { closeClick: false} },
                    'width': 733,
                    'height': 200,
                    'margin': 0,
                    'padding': 0,
                    'overlayColor': '#000',
                    'overlayOpacity': 0.7,
                    'hideOnOverlayClick': false,
                    'href': '/SystemHome/Catalog/MassEnrollment/Popup/sasumsm-01.aspx',
                    'onComplete': function () {
                        $('#fancybox-frame').load(function () {
                            $('#fancybox-content').height($(this).contents().find('body').height() + 20);
                            var heightPane = $(this).contents().find('#content').height();
                            $(this).contents().find('#fancybox-frame').css({
                                'height': heightPane + 'px'

                            })
                        });

                    }

                });
            });

            $(".deletecoursecurriculum").click(function () {

                //Get the Id of the record to delete
                var record_id = $(this).attr("id");
                //Get the GridView Row reference
                var tr_id = $(this).parents("#.record");
                // Ask user's confirmation before delete records
                if (confirm("Are you sure?")) {

                    $.ajax({
                        type: "POST",
                        //sasw-01.aspx is the page name and delete locale is the server side method to delete records in sacatvml-01.aspx.cs
                        url: "samep-01.aspx/DeleteCourseCurriculum",
                        //Pass the selected record id
                        data: "{'args': '" + record_id + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            // Do some animation effect
                            tr_id.fadeOut(500, function () {
                                //Remove GridView row
                                tr_id.remove();

                            });
                        }
                    });

                }
                return false;
            });


            $(".deleteemployee").click(function () {

                //Get the Id of the record to delete
                var record_id = $(this).attr("id");
                //Get the GridView Row reference
                var tr_id = $(this).parents("#.record");
                // Ask user's confirmation before delete records
                if (confirm("Are you sure?")) {

                    $.ajax({
                        type: "POST",
                        //sasw-01.aspx is the page name and delete locale is the server side method to delete records in sacatvml-01.aspx.cs
                        url: "samep-01.aspx/DeleteEmployee",
                        //Pass the selected record id
                        data: "{'args': '" + record_id + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {
                            // Do some animation effect
                            tr_id.fadeOut(500, function () {
                                //Remove GridView row
                                tr_id.remove();

                            });
                        }
                    });

                }
                return false;
            });
        });

    </script>
    <script type="text/javascript">
        function check_hdCheckDelivery(id) {
            if (id == "ContentPlaceHolder1_btnProcessMassEnrollment") {
                document.getElementById('<%=hdCheckdelivery.ClientID %>').value = "1";
            }
            //confirmremove();
        }
    </script>
    <script type="text/javascript" language="javascript">
        function validateCheckBoxes(sender, args) {
            var gridView = document.getElementById('<%= gvCatalog.ClientID %>');
            for (var i = 0; i < gridView.rows.length; i++) {
                var inputs = gridView.rows[i].getElementsByTagName('input');
                var dropdowns = gridView.getElementsByTagName('select');
                if (inputs != null) {
                    if (inputs[0].type == "checkbox") {
                        if (inputs[0].checked) {
                            if (dropdowns.item(i).value == 'Select a Delivery') {
                                args.IsValid = false;
                                break; //break the loop as there is no need to check further.
                            }
                        }
                    }
                }
            }

        }
    </script>
    <script type="text/javascript" language="javascript">
        function getEmployeeCount(sender, args) {
            var gvRows = $("#<%=gvEmployee.ClientID %> tr").length;
            if (gvRows == 0) {
                args.IsValid = false;
            }
        }
    </script>
    <script type="text/javascript">
        function confirmremove() {
            if (confirm('Are you sure') == true)
                return true;
            else
                return false;

        }
    </script>
    <div class="content_area_long">
        <div id="divSuccess" runat="server" class="msgarea_success" style="display: none;">
        </div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <asp:ValidationSummary class="validation_summary_error" ID="vs_samep" runat="server"
            ValidationGroup="samep"></asp:ValidationSummary>
        <asp:CustomValidator ID="cvValidateCheckboxes" EnableClientScript="true" ClientValidationFunction="validateCheckBoxes"
            ValidationGroup="samep" runat="server" ErrorMessage="Please select a delivery.">&nbsp;</asp:CustomValidator>
        <asp:CustomValidator ID="cvValidateEmployee" EnableClientScript="true" ClientValidationFunction="getEmployeeCount"
            ValidationGroup="samep" runat="server" ErrorMessage="Please select atleast one employee.">&nbsp;</asp:CustomValidator>
        <asp:HiddenField ID="hdCheckdelivery" runat="server" />
        <div class="div_header_long">
            Catalog Item(s):
        </div>
        <br />
        <div>
            <asp:GridView ID="gvCatalog" AutoGenerateColumns="false" CssClass="grid_870" ShowHeader="false"
                ShowFooter="false" GridLines="None" runat="server" DataKeyNames="sysId" OnRowDataBound="gvCatalog_RowDataBound">
                <RowStyle CssClass="record"></RowStyle>
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lblType" Style="text-align: left;" runat="server" Text='<%# Eval("type")+":" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="gridview_row_width_4_1" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label ID="lblCourseCurriculumName" Style="text-align: left;" runat="server"
                                Text='<%#Eval("Id")  + "(" + Eval("title") +")"%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="chkSelectDelivery" runat="server" Style="display: none; padding-right: 5px;" />
                            <%--<asp:DropDownList ID="ddlDelivery" CssClass="ddl_user_advanced_search" Style="display: none;"
                                DataTextField="deliveryname" DataValueField="c_delivery_system_id_pk" runat="server">--%>
                            <%--</asp:DropDownList>--%>
                            <%--<asp:Button ID="btnViewDetails" CssClass="align_right" runat="server" Text="View Details" Style="display: none"/>--%>
                            <asp:Literal ID="ltlViewDetails" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlDelivery" CssClass="ddl_user_advanced_search" Style="display: none;"
                                DataTextField="deliveryname" DataValueField="c_delivery_system_id_pk" runat="server">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <input type="button" id='<%# Eval("sysId") %>' value='<asp:Literal ID="Literal1" runat="server" Text="Remove" />'
                                class="deletecoursecurriculum cursor_hand" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <input type="button" class="addcourse cursor_hand" value="Add Catalog Item(s)" />
            <br />
            <br />
        </div>
        <div class="div_header_long">
            Employee(s):
        </div>
        <div>
            <br />
            <asp:GridView ID="gvEmployee" AutoGenerateColumns="false" CssClass="grid_870" ShowHeader="false"
                ShowFooter="false" GridLines="None" DataKeyNames="u_user_id_pk" runat="server">
                <RowStyle CssClass="record"></RowStyle>
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lblEmployeeName" runat="server" Text='<%#Eval("u_username")  + "(" + Eval("u_hris_employee_id") +")"%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lblEmployeeId" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <input type="button" id='<%# Eval("u_user_id_pk") %>' value='<asp:Literal ID="Literal2" runat="server" Text="Remove" />'
                                class="deleteemployee cursor_hand" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <br />
            <input type="button" class="addemployee cursor_hand" value="Add Employee(s)" />
            <br />
            <br />
        </div>
        <div class="div_header_long">
            <br />
        </div>
        <br />
        <div class="div_controls font_1">
            <table class="">
                <tr>
                    <td colspan="2">
                        &nbsp;
                    </td>
                    <td>
                        Required&nbsp;<asp:CheckBox ID="chkRequired" runat="server" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        Target Due Date:
                    </td>
                    <td>
                        <asp:TextBox ID="txtTargetDueDate" CssClass="textbox_long" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="ceTargetDueDate" runat="server" Format="MM/dd/yyyy" TargetControlID="txtTargetDueDate">
                        </asp:CalendarExtender>
                    </td>
                    <td colspan="3">
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                       
                        <asp:Button ID="btnProcessMassEnrollment" runat="server" Text="Process Mass Enrollment"
                            OnClientClick="javascript:check_hdCheckDelivery(this.id)" OnClick="btnProcessMassEnrollment_Click"
                            ValidationGroup="samep" />
                    </td>
                    <td colspan="4">
                    </td>
                    <td class="align_right">
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
