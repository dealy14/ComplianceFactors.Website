﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="saanfin-01.aspx.cs" Inherits="ComplicanceFactor.SystemHome.Catalog.Facilities.saanfin_01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery.fancybox.js" type="text/javascript"></script>
    <link href="../../../Scripts/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <link href="../../../Styles/Main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        $(document).ready(function () {
            $('#app_nav_system').addClass('selected');
            // toggles the slickbox on clicking the noted link  
            $('.main_menu li a').hover(function () {

                $('.main_menu li a').removeClass('selected');
                $(this).addClass('active');

                return false;
            });
            $('.main_menu li a').mouseleave(function () {

                $('#app_nav_system').addClass('selected');
                return false;
            });
        });
        // Add and view  locale
        $(document).ready(function () {

            $("#btnManageLocale").fancybox({
                'type': 'iframe',
                'titlePosition': 'over',
                'titleShow': true,
                'showCloseButton': true,
                'scrolling': 'yes',
                'autoScale': false,
                'autoDimensions': false,
                'helpers': { overlay: { closeClick: false} },
                'width': 783,
                'height': 250,
                'margin': 0,
                'padding': 0,
                'overlayColor': '#000',
                'overlayOpacity': 0.7,
                'hideOnOverlayClick': false,
                'href': '../Facilities/Locale/savloc-01.aspx?mode=create',
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

            $("#btnAddRoom").fancybox({
                'type': 'iframe',
                'titlePosition': 'over',
                'titleShow': true,
                'showCloseButton': true,
                'scrolling': 'yes',
                'autoScale': false,
                'autoDimensions': false,
                'helpers': { overlay: { closeClick: false} },
                'width': 820,
                'height': 200,
                'margin': 0,
                'padding': 0,
                'overlayColor': '#000',
                'overlayOpacity': 0.7,
                'hideOnOverlayClick': false,
                'href': '../Facilities/Room/saafrm-01.aspx?mode=create',
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
            $(".deleteRoom").click(function () {

                //Get the Id of the record to delete
                var record_id = $(this).attr("id");

                //Get the GridView Row reference
                var tr_id = $(this).parents("#.record");

                // Ask user's confirmation before delete records
                if (confirm("Do you want to delete this record?")) {

                    $.ajax({
                        type: "POST",

                        //saantc-01.aspx is the page name and DeleteUser is the server side method to delete records in saantc-01.aspx.cs
                        url: "saanfin-01.aspx/DeleteRoom",

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

            $(".editRoom").click(function () {

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
                    'width': 1040,
                    'height': 200,
                    'margin': 0,
                    'padding': 0,
                    'overlayColor': '#000',
                    'overlayOpacity': 0.7,
                    'hideOnOverlayClick': false,
                    'href': '../Facilities/Room/saefrm-01.aspx?mode=edit&editRoom=' + record_id,
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

        });
    </script>
    <br />
    <asp:ValidationSummary class="validation_summary_error" ID="vs_saanfin" runat="server"
        ValidationGroup="saanfin"></asp:ValidationSummary>
    <div class="content_area_long">
        <div>
            <table cellpadding="0" cellspacing="0" class="paging">
                <tr>
                    <td align="left">
                        <asp:Button ID="btnHeaderSaveNewFacility" ValidationGroup="saanfin" CssClass="cursor_hand"
                            runat="server" Text="<%$ LabelResourceExpression: app_save_new_facility_button_text %>" OnClick="btnHeaderSaveNewFacility_Click" />
                    </td>
                    <td align="left">
                        <asp:Button ID="btnHeaderReset" runat="server" CssClass="cursor_hand" Text="<%$ LabelResourceExpression: app_reset_button_text %>"
                            OnClick="btnHeaderReset_Click" />
                    </td>
                    <td align="right">
                        <asp:Button CssClass="cursor_hand" ID="btnHeaderCancel" runat="server" Text="<%$ LabelResourceExpression: app_cancel_button_text %>"
                            OnClick="btnHeaderCancel_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_facility_information_english_us_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvFacilitylId" runat="server" ValidationGroup="saanfin"
                            ControlToValidate="txtFacilityId" ErrorMessage="<%$ TextResourceExpression: app_facility_id_error_empty %>">&nbsp;
                        </asp:RequiredFieldValidator>
                        * <%=LocalResources.GetLabel("app_facility_id_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtFacilityId" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                    <td>
                        <asp:RequiredFieldValidator ID="rfvFacilityName" runat="server" ValidationGroup="saanfin"
                            ControlToValidate="txtFacilityName" ErrorMessage="<%$ TextResourceExpression: app_facility_name_error_empty %>">&nbsp;
                        </asp:RequiredFieldValidator>
                        * <%=LocalResources.GetLabel("app_facility_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtFacilityName" CssClass="textbox_long" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:RequiredFieldValidator ID="rfvFacilityDescription" runat="server" ValidationGroup="saanfin"
                            ControlToValidate="txtFacilityDescription" ErrorMessage="<%$ TextResourceExpression: app_description_error_empty %>">&nbsp;
                        </asp:RequiredFieldValidator>
                        * <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtFacilityDescription" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_status_text")%>:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlStatus" DataTextField="s_status_name" DataValueField="s_status_id_pk"
                            CssClass="ddl_user_advanced_search" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <%=LocalResources.GetLabel("app_facility_type_text")%>:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFacilityType" DataTextField="s_facility_type_name"
                            DataValueField="s_facility_type_system_id_pk" CssClass="ddl_user_advanced_search"
                            runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <input type="button" id="btnManageLocale" value='<asp:Literal ID="Literal1" runat="server" Text="<%$ LabelResourceExpression: app_manage_locales_button_text%>" />' />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_contact_information_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                       <%=LocalResources.GetLabel("app_contact_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtContact" CssClass="textbox_long" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <%=LocalResources.GetLabel("app_email_address_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmailAddress" CssClass="textbox_long" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <%=LocalResources.GetLabel("app_phone_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtPhone" CssClass="textbox_long" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" ValidationGroup="saanfin"
                            ControlToValidate="txtAddress1" ErrorMessage="<%$ TextResourceExpression: app_address_error_empty %>">&nbsp;
                        </asp:RequiredFieldValidator>&nbsp; * <%=LocalResources.GetLabel("app_address_1_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress1" CssClass="textbox_long" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <%=LocalResources.GetLabel("app_address_2_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress2" CssClass="textbox_long" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <%=LocalResources.GetLabel("app_address_3_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddress3" CssClass="textbox_long" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ValidationGroup="saanfin"
                            ControlToValidate="txtCity" ErrorMessage="<%$ TextResourceExpression: app_city_error_empty %>">&nbsp;
                        </asp:RequiredFieldValidator>&nbsp; *  <%=LocalResources.GetLabel("app_city_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity" CssClass="textbox_long" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvState" runat="server" ValidationGroup="saanfin"
                            ControlToValidate="txtState" ErrorMessage="<%$ TextResourceExpression: app_state_error_empty %>">&nbsp;
                        </asp:RequiredFieldValidator>&nbsp; * <%=LocalResources.GetLabel("app_state_province_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtState" CssClass="textbox_long" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" ValidationGroup="saanfin"
                            ControlToValidate="txtZipCode" ErrorMessage="<%$ TextResourceExpression: app_zipcode_error_empty %>">&nbsp;
                        </asp:RequiredFieldValidator>&nbsp; * <%=LocalResources.GetLabel("app_zip_postal_code_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtZipCode" CssClass="textbox_long" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_country_text")%>:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCountry" DataTextField="u_country_name" DataValueField="u_country_id_pk"
                            CssClass="ddl_user_advanced_search" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <%=LocalResources.GetLabel("app_locale_text")%>:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLocale" DataTextField="s_locale_description" DataValueField="s_locale_id_pk"
                            CssClass="ddl_user_advanced_search" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <%=LocalResources.GetLabel("app_timezone_text")%>:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTimezone" DataTextField="u_time_zone_description" DataValueField="u_time_zone_id_pk"
                            CssClass="ddl_user_advanced_search" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
        <br />
      <%--  <div class="div_header_long">
            Rooms:
        </div>--%>
        <br />
       <%-- <div class="div_controls_from_left">
            <div>
                <asp:GridView ID="gvRooms" RowStyle-CssClass="record" GridLines="None" CssClass="gridview_normal_800"
                    CellPadding="0" CellSpacing="0" ShowHeader="false" ShowFooter="false" runat="server"
                    AutoGenerateColumns="False">
                    <RowStyle CssClass="record"></RowStyle>
                    <Columns>
                        <asp:TemplateField ItemStyle-CssClass="gridview_row_width_5" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="horizontal_line" colspan="3">
                                            <hr>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="gridview_row_width_300">
                                            <%#Eval("s_room_name")%>
                                        </td>
                                        <td class="gridview_row_width_300" align="right">
                                            <table>
                                                <tr>
                                                    <td class="gridview_row_width_1" align="right">
                                                        <input type="button" id='<%# Eval("s_room_system_id_pk") %>' value='<asp:Literal ID="Literal6" runat="server" Text="Edit" />'
                                                            class="editRoom cursor_hand" />
                                                    </td>
                                                    <td class="gridview_row_width_1" align="right">
                                                        <input type="button" id='<%# Eval("s_room_system_id_pk") %>' value='<asp:Literal ID="Literal5" runat="server" Text="Remove" />'
                                                            class="deleteRoom cursor_hand" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <br />
        <div class="div_controls font_1">
            <input type="button" id="btnAddRoom" value="Add New Room" />
        </div>--%>
        <br />
        <div class="div_header_long">
            &nbsp;
        </div>
        <br />
        <div>
            <table cellpadding="0" cellspacing="0" class="paging">
                <tr>
                    <td align="left">
                        <asp:Button ID="btnFooterSaveNewFacility" ValidationGroup="saanfin" CssClass="cursor_hand"
                            runat="server" Text="<%$ LabelResourceExpression: app_save_new_facility_button_text %>" OnClick="btnFooterSaveNewFacility_Click" />
                    </td>
                    <td align="left">
                        <asp:Button ID="btnFooterReset" runat="server" CssClass="cursor_hand" Text="<%$ LabelResourceExpression: app_reset_button_text %>"
                            OnClick="btnFooterReset_Click" />
                    </td>
                    <td align="right">
                        <asp:Button CssClass="cursor_hand" ID="btnFooterCancel" runat="server" Text="<%$ LabelResourceExpression: app_cancel_button_text %>"
                            OnClick="btnFooterCancel_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
