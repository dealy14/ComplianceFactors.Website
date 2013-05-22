﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="ccmtdp-01.aspx.cs" Inherits="ComplicanceFactor.Compliance.MyToDo.ccmtdp_01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Styles/Main.css" rel="stylesheet" type="text/css" />
    <script src="../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.tablesorter.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#app_nav_compliance').addClass('selected');
            // toggles the slickbox on clicking the noted link  
            $('.main_menu li a').hover(function () {

                $('.main_menu li a').removeClass('selected');
                $(this).addClass('active');

                return false;
            });
            $('.main_menu li a').mouseleave(function () {

                $('#app_nav_compliance').addClass('selected');
                return false;
            });


            $(function () {
                $('#<%=gvMyToDo.ClientID %>').tablesorter({ headers: { 4: { sorter: false }, 5: { sorter: false}} });

            });
        });
    </script>
        
 
    <div class="content_area">
        <%= LocalResources.GetText("app_welcome_content_comp_my_to_do_text")%><br />
        <br />
        <br />
    </div>
    <div>
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_my_to_dos_text")%>:
        </div>
        <div class="div_padding_10" id="div_MyToDo" runat="server">
            <asp:GridView ID="gvMyToDo" CellPadding="0" CellSpacing="0" CssClass="gridview_long_no_border tablesorter"
                runat="server" EmptyDataText="<%$ LabelResourceExpression: app_no_result_found_text %>"
                GridLines="None" DataKeyNames="id,enroll_system_id_pk,todo_system_id_pk,e_enroll_user_id_fk,delivery_id" AutoGenerateColumns="False" EmptyDataRowStyle-CssClass="empty_row"
                PagerSettings-Visible="false" AllowPaging="false" onrowcommand="gvMyToDo_RowCommand">
                <Columns>
                    <asp:BoundField HeaderStyle-CssClass="gridview_row_width_7" ItemStyle-CssClass="gridview_row_width_3"
                        HeaderText="<%$ LabelResourceExpression: app_course_name_with_id_text %>" DataField="title"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Left" />
                    <asp:BoundField HeaderStyle-CssClass="gridview_row_width_1" ItemStyle-CssClass="gridview_row_width_4"
                        HeaderText="<%$ LabelResourceExpression: app_employees_text %>" DataField="name"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField HeaderStyle-CssClass="gridview_row_width_4" ItemStyle-CssClass="gridview_row_width_2"
                        HeaderText="<%$ LabelResourceExpression: app_training_date_text %>" DataField="Coursedate"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField HeaderStyle-CssClass="gridview_row_width_1" ItemStyle-CssClass="gridview_row_width_2"
                        HeaderText="<%$ LabelResourceExpression: app_type_text %>" DataField="deliveryType" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-HorizontalAlign="Center" />
                    <asp:TemplateField HeaderStyle-CssClass="gridview_row_width_1" ItemStyle-CssClass="gridview_row_width_1"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Button ID="btnDeny" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                CommandName="Deny" runat="server" Text="<%$ LabelResourceExpression: app_deny_button_text %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-CssClass="gridview_row_width_1" ItemStyle-CssClass="gridview_row_width_1"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Button ID="btnApprove" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                CommandName="Approve" runat="server" Text="<%$ LabelResourceExpression: app_approve_button_text %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <br />
    <div class="div_header_long">
        <br />
    </div>
    <div class="content_area">
        <%= LocalResources.GetText("app_welcome_content_footer_comp_my_to_do_text")%>
        <br />
        <br />
    </div>
</asp:Content>