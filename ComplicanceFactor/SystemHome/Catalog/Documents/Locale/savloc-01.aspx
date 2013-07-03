﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Empty.Master" AutoEventWireup="true"
    CodeBehind="savloc-01.aspx.cs" Inherits="ComplicanceFactor.SystemHome.Catalog.Documents.document_locales_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <link href="../../../../Scripts/jquery.fancybox.css" rel="stylesheet" type="text/css" />
    <script src="../../../../Scripts/jquery.fancybox.js" type="text/javascript"></script>
    <script src="../../../../Scripts/querystring-0.9.0-min.js" type="text/javascript"></script>
    <script src="../../../../Scripts/querystring-0.9.0.js" type="text/javascript"></script>
    <link href="../../../../Styles/Main.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        input[type=button], input[type=submit]
        {
            cursor: pointer;
        }
    </style>
    <style type="text/css">
        body
        {
            width: 700px !important;
            margin: 0;
            font-family: Arial, Sans-Serif;
            font-size: 14px;
            height: 400px;
        }
    </style>
    <script type="text/javascript">


        function RemoveLocale(value) {

            var exists = false;
            $('#<%=ddlLocale.ClientID %>  option').each(function () {
                if (this.value == value) {
                    exists = true;
                    $('#<%=ddlLocale.ClientID %> option[value=' + value + ']').remove();
                }
            });
        }
        // Add locale
        $(document).ready(function () {

            var message = $.QueryString("mode"),
            message = (!message) ? "null" : message; // Passing the value null to string

            var editDocumentId = $.QueryString("documentid"),
            editDocumentId = (!editDocumentId) ? "null" : editDocumentId; // Passing the value null to string

            $("#btnCreateNewLocale").click(function (e) {

                var localeid = $("#<%=ddlLocale.ClientID %>").val();
                var localeText = $("#<%=ddlLocale.ClientID %> option:selected").text();

                $.fancybox({
                    'type': 'iframe',
                    'titlePosition': 'over',
                    'titleShow': true,
                    'showCloseButton': true,
                    'scrolling': 'yes',
                    'autoScale': false,
                    'autoDimensions': false,
                    'helpers': { overlay: { closeClick: false} },
                    'width': 600,
                    'height': 350,
                    'margin': 0,
                    'padding': 0,
                    'overlayColor': '#000',
                    'overlayOpacity': 0.7,
                    'hideOnOverlayClick': false,
                    'href': '../Locale/saaloc-01.aspx?mode=' + message + '&localeid=' + localeid + "&localeText=" + localeText + "&editDocumentId=" + editDocumentId,
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
    <script type="text/javascript">
        //edit locale
        $(document).ready(function () {
            var message = $.QueryString("mode"),
            message = (!message) ? "null" : message; // Passing the value null to string

            var editDocumentId = $.QueryString("documentid"),
            editDocumentId = (!editDocumentId) ? "null" : editDocumentId; // Passing the value null to string
            $(".editlocale").click(function () {


                var localeid = $("#<%=ddlLocale.ClientID %>").val();
                var localeText = $("#<%=ddlLocale.ClientID %> option:selected").text();

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
                    'width': 600,
                    'height': 350,
                    'margin': 0,
                    'padding': 0,
                    'overlayColor': '#000',
                    'overlayOpacity': 0.7,
                    'hideOnOverlayClick': false,
                    'href': '../Locale/saeloc-01.aspx?mode=' + message + '&localeid=' + localeid + "&localeText=" + localeText + "&id=" + record_id,
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
            $(".deletelocale").click(function () {

                //Get the Id of the record to delete
                var record_id = $(this).attr("id");

                //Get the GridView Row reference
                var tr_id = $(this).parents("#.record");
                var element = $(this).attr("id").split(",");
                // Ask user's confirmation before delete records
                if (confirm("Are you sure?")) {


                    $.ajax({
                        type: "POST",

                        //savloc-01.aspx is the page name and delete locale is the server side method to delete records in sacatvml-01.aspx.cs
                        url: "savloc-01.aspx/DeleteLocale",

                        //Pass the selected record id
                        data: "{'args': '" + element[0] + "','args1': '" + element[1] + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function () {

                            // Do some animation effect
                            tr_id.fadeOut(500, function () {

                                $("#<%= ddlLocale.ClientID %>").append("<option value=" + element[1] + ">" + element[2] + " </option>");
                                $("#<%= ddlLocale.ClientID %>").val(element[1]);
                                //Remove GridView row
                                tr_id.remove();


                            });
                        },
                        error: function () {
                            alert("error");
                        }
                    });

                }
                return false;
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div id="content">
        <div class="div_header_800">
            <%=LocalResources.GetLabel("app_all_locale_text")%>:
        </div>
        <br />
        <div class="div_padding_40">
            <asp:GridView ID="gvLocale" AutoGenerateColumns="false" RowStyle-CssClass="record"
                CssClass="grid_700" GridLines="None" ShowHeader="false" ShowFooter="false" runat="server">
                <Columns>
                    <asp:TemplateField ItemStyle-CssClass="width_300">
                        <ItemTemplate>
                            <%#Eval("s_locale_text")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="width_35">
                        <ItemTemplate>
                            <input type="button" id='<%# Eval("s_locale_system_id_pk") %>' value='<asp:Literal ID="Literal6" runat="server" Text="<%$ LabelResourceExpression: app_edit_button_text %>" />'
                                class="editlocale cursor_hand" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="width_35" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <input type="button" id='<%# Eval("s_locale_system_id_pk").ToString() + "," +  Eval("s_locale_id_fk").ToString() + "," +  Eval("s_locale_text").ToString()%>'
                                value='<asp:Literal ID="Literal6" runat="server" Text="<%$ LabelResourceExpression: app_remove_button_text %>" />'
                                onclick="DoPostBack()" class="deletelocale cursor_hand" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <table class="grid_700" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="width_300">
                        <asp:DropDownList ID="ddlLocale" CssClass="dropdown_width_300" runat="server" DataTextField="s_locale_description"
                            DataValueField="s_locale_id_pk">
                        </asp:DropDownList>
                    </td>
                    <td>
                    </td>
                    <td class="align_right">
                        <input type="button" id="btnCreateNewLocale" value='<asp:Literal ID="Literal3" runat="server" Text="<%$ LabelResourceExpression: app_create_new_locale_button_text%>" />' />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnClosePopup" runat="server" Text="<%$ LabelResourceExpression: app_close_window_text %>"
                            OnClientClick="javascript:document.forms[0].submit();parent.jQuery.fancybox.close()" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
