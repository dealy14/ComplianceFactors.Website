﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true"
    CodeBehind="saerotn-01.aspx.cs" Inherits="ComplicanceFactor.SystemHome.Configuration.RoomTypes.saerotn_01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
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

    </script>
    <br />
    <asp:ValidationSummary class="validation_summary_error" ID="vs_saerotn" runat="server"
        ValidationGroup="saerotn"></asp:ValidationSummary>
    <div id="divSuccess" runat="server" class="msgarea_success" style="display: none;">
    </div>
    <div id="divError" runat="server" class="msgarea_error" style="display: none;">
    </div>
    <div class="content_area_long">
        <div>
            <table cellpadding="0" cellspacing="0" class="paging">
                <tr>
                    <td align="left">
                        <asp:Button ID="btnHeaderSaveNewRoomType" CssClass="cursor_hand" runat="server" Text="<%$ LabelResourceExpression: app_save_new_Room_type_button_text %>"
                            OnClick="btnHeaderSaveNewRoomType_Click" ValidationGroup="saerotn" />
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
            <%=LocalResources.GetLabel("app_room_type_information_english_us_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvRoomTypelId" runat="server" ValidationGroup="saerotn"
                            ControlToValidate="txtRoomTypeId" ErrorMessage="<%$ TextResourceExpression: app_room_type_id_error_empty %>">&nbsp;
                        </asp:RequiredFieldValidator>
                        * <%=LocalResources.GetLabel("app_room_type_id_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeId" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        <asp:RequiredFieldValidator ID="rfvRoomTypeName" runat="server" ValidationGroup="saerotn"
                            ControlToValidate="txtRoomTypeName" ErrorMessage="<%$ TextResourceExpression: app_room_type_name_error_empty %>">&nbsp;
                        </asp:RequiredFieldValidator>
                        * <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeName" CssClass="textbox_long" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ValidationGroup="saerotn"
                            ControlToValidate="txtDescriptionUS" ErrorMessage="<%$ TextResourceExpression: app_description_error_empty %>">&nbsp;
                        </asp:RequiredFieldValidator>
                        * <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionUS" runat="server" class="txtInput_long" rows="3" cols="100"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_status_text")%>:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlStatus" DataTextField="s_status_name" DataValueField="s_status_id_pk" CssClass="ddl_user_advanced_search" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_english_uk_text")%>: 
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameUK" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionUK" runat="server" class="txtInput_long" rows="3" cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_french_ca_text")%>: 
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameCA" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionCA" runat="server" class="txtInput_long" rows="3" cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_french_fr_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameFR" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionFR" runat="server" class="txtInput_long" rows="3" cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_spanish_mx_text")%>: 
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameMX" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionMX" runat="server" class="txtInput_long" rows="3" cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_spanish_sp_text")%>:  
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameSP" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionSP" runat="server" class="txtInput_long" rows="3" cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_portuguese_text")%>: 
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNamePortuguse" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionPortuguese" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_chinese_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameChinese" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionChinese" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_german_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameGerman" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionGerman" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_japanese_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                         <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameJapanese" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionJapanese" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_russian_text")%>: 
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameRussian" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionRussian" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_danish_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameDanish" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionDanish" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_polish_text")%>: 
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNamePolish" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionPolish" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_swedish_text")%>: 
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameSwedish" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionSwedish" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_finnish_text")%>: 
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameFinnish" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionFinnish" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_korean_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameKorean" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionKorean" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_italian_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameItalian" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionItalian" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_dutch_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameDutch" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionDutch" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_indonesian_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameIndonesian" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionIndonesian" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_greek_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameGreek" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionGreek" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_hungarian_text")%>: 
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameHungarian" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionHungarian" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_norwegian_text")%>: 
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameNorwegian" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionNorwegian" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_turkish_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameTurkish" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionTurkish" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
            <%=LocalResources.GetLabel("app_room_type_information_arabic_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameArabic" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionArabic" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_custom_01_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameCustom01" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionCustom01" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_custom_02_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameCustom02" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionCustom02" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_custom_03_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameCustom03" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionCustom03" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_custom_04_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameCustom04" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionCustom04" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_custom_05_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameCustom05" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionCustom05" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_custom_06_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameCustom06" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionCustom06" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_custom_07_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameCustom07" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionCustom07" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_custom_08_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameCustom08" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionCustom08" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_custom_09_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameCustom09" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionCustom09" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_custom_10_text")%>: 
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameCustom10" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionCustom10" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_custom_11_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                         <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameCustom11" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionCustom11" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_custom_12_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameCustom12" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionCustom12" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="div_header_long">
           <%=LocalResources.GetLabel("app_room_type_information_custom_13_text")%>:
        </div>
        <br />
        <div class="div_controls font_1">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                         <%=LocalResources.GetLabel("app_room_type_name_text")%>:
                    </td>
                    <td>
                        <asp:TextBox ID="txtRoomTypeNameCustom13" CssClass="textbox_long" runat="server"></asp:TextBox>
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
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=LocalResources.GetLabel("app_description_text")%>:
                    </td>
                    <td class="align_left" colspan="6">
                        <textarea id="txtDescriptionCustom13" runat="server" class="txtInput_long" rows="3"
                            cols="100"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table cellpadding="0" cellspacing="0" class="paging">
                <tr>
                    <td align="left">
                        <asp:Button ID="btnFooterSaveNewRoomType" CssClass="cursor_hand" runat="server" Text="<%$ LabelResourceExpression: app_save_new_Room_type_button_text %>"
                            ValidationGroup="saerotn" OnClick="btnFooterSaveNewRoomType_Click" />
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
