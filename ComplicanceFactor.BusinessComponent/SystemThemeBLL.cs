﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using ComplicanceFactor.DataAccessLayer;
using ComplicanceFactor.BusinessComponent.DataAccessObject;
using System.Collections;

namespace ComplicanceFactor.BusinessComponent
{
    public class SystemThemeBLL
    {
        public static DataSet GetDefaultTheme()
        {
            try
            {
                return DataProxy.FetchDataSet("s_sp_get_default_theme");
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static int InsertTheme(SystemThemes theme)
        {
            Hashtable htTheme = new Hashtable();
            htTheme.Add("@s_theme_system_id_pk", theme.s_theme_system_id_pk);
            htTheme.Add("@s_theme_id_pk", theme.s_theme_id_pk);
            htTheme.Add("@s_theme_name", theme.s_theme_name);
            htTheme.Add("@s_theme_description", theme.s_theme_description);
            htTheme.Add("@s_theme_status_id_fk", theme.s_theme_status_id_fk);
            if (!string.IsNullOrEmpty(theme.s_theme_owner_id_fk))
            {
                htTheme.Add("@s_theme_owner_id_fk", theme.s_theme_owner_id_fk);
            }
            else
            {
                htTheme.Add("@s_theme_owner_id_fk", DBNull.Value);
            }
            if (!string.IsNullOrEmpty(theme.s_theme_coordinator_id_fk))
            {
                htTheme.Add("@s_theme_coordinator_id_fk", theme.s_theme_coordinator_id_fk);
            }
            else
            {
                htTheme.Add("@s_theme_coordinator_id_fk", DBNull.Value);
            }
            htTheme.Add("@s_theme_head_logo_file_name", theme.s_theme_head_logo_file_name);
            htTheme.Add("@s_theme_report_logo_file_name", theme.s_theme_report_logo_file_name);
            htTheme.Add("@s_theme_notification_logo_file_name", theme.s_theme_notification_logo_file_name);
            htTheme.Add("@s_theme_css_tag_main_background_hex_value", theme.s_theme_css_tag_main_background_hex_value);
            htTheme.Add("@s_theme_css_tag_login_background_hex_value", theme.s_theme_css_tag_login_background_hex_value);
            htTheme.Add("@s_theme_css_tag_login_button_hex_value", theme.s_theme_css_tag_login_button_hex_value);
            htTheme.Add("@s_theme_css_tag_login_text_hex_value", theme.s_theme_css_tag_login_text_hex_value);
            htTheme.Add("@s_theme_css_tag_login_link_hex_value", theme.s_theme_css_tag_login_link_hex_value);
            htTheme.Add("@s_theme_css_tag_nav_top_line_hex_value", theme.s_theme_css_tag_nav_top_line_hex_value);
            htTheme.Add("@s_theme_css_tag_nav_bar_hex_value", theme.s_theme_css_tag_nav_bar_hex_value);
            htTheme.Add("@s_theme_css_tag_nav_bar_text_hex_value", theme.s_theme_css_tag_nav_bar_text_hex_value);
            htTheme.Add("@s_theme_css_tag_nav_bot_line_hex_value", theme.s_theme_css_tag_nav_bot_line_hex_value);
            htTheme.Add("@s_theme_css_tag_nav_active_hex_value", theme.s_theme_css_tag_nav_active_hex_value);
            htTheme.Add("@s_theme_css_tag_nav_active_text_hex_value", theme.s_theme_css_tag_nav_active_text_hex_value);
            htTheme.Add("@s_theme_css_tag_foot_top_line_hex_value", theme.s_theme_css_tag_foot_top_line_hex_value);
            htTheme.Add("@s_theme_css_tag_foot_bot_line_hex_value", theme.s_theme_css_tag_foot_bot_line_hex_value);
            htTheme.Add("@s_theme_css_tag_section_head_hex_value", theme.s_theme_css_tag_section_head_hex_value);
            htTheme.Add("@s_theme_css_tag_section_head_text_hex_value", theme.s_theme_css_tag_section_head_text_hex_value);
            htTheme.Add("@s_theme_css_tag_section_head_border_hex_value", theme.s_theme_css_tag_section_head_border_hex_value);
            htTheme.Add("@s_theme_css_tag_table_head_hex_value", theme.s_theme_css_tag_table_head_hex_value);
            htTheme.Add("@s_theme_css_tag_table_head_text_hex_value", theme.s_theme_css_tag_table_head_text_hex_value);
            htTheme.Add("@s_theme_css_tag_table_border_hex_value", theme.s_theme_css_tag_table_border_hex_value);
            htTheme.Add("@s_theme_css_tag_bread_link_hex_value", theme.s_theme_css_tag_bread_link_hex_value);
            htTheme.Add("@s_theme_css_tag_bread_text_hex_value", theme.s_theme_css_tag_bread_text_hex_value);
            htTheme.Add("@s_theme_css_tag_body_text_hex_value", theme.s_theme_css_tag_body_text_hex_value);
            htTheme.Add("@s_theme_css_tag_body_link_hex_value", theme.s_theme_css_tag_body_link_hex_value);

            try
            {
                return DataProxy.FetchSPOutput("s_sp_insert_theme", htTheme);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static DataTable SearchTheme(SystemThemes theme)
        {
            Hashtable htSearchTheme = new Hashtable();
            htSearchTheme.Add("@s_theme_id_pk", theme.s_theme_id_pk);
            htSearchTheme.Add("@s_theme_name", theme.s_theme_name);
            htSearchTheme.Add("@s_theme_owner_name", theme.s_theme_owner_name);
            htSearchTheme.Add("@s_theme_coordinator_name", theme.s_theme_coordinator_name);

            try
            {
                return DataProxy.FetchDataTable("s_sp_search_theme", htSearchTheme);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static SystemThemes GetThemeById(string themeId)
        {
            SystemThemes theme = new SystemThemes();
            DataTable dtTheme = new DataTable();
            Hashtable htGetTheme = new Hashtable();
            htGetTheme.Add("@s_theme_system_id_pk", themeId);

            try
            {
                dtTheme = DataProxy.FetchDataTable("s_sp_get_theme_by_id", htGetTheme);
                if (dtTheme.Rows.Count > 0)
                {
                    theme.s_theme_id_pk = dtTheme.Rows[0]["s_theme_id_pk"].ToString();
                    theme.s_theme_name = dtTheme.Rows[0]["s_theme_name"].ToString();
                    theme.s_theme_description = dtTheme.Rows[0]["s_theme_description"].ToString();
                    theme.s_theme_status_id_fk = dtTheme.Rows[0]["s_theme_status_id_fk"].ToString();
                    theme.s_theme_owner_name = dtTheme.Rows[0]["ownername"].ToString();
                    theme.s_theme_coordinator_name = dtTheme.Rows[0]["coordinatorname"].ToString();
                    theme.s_theme_owner_id_fk = dtTheme.Rows[0]["s_theme_owner_id_fk"].ToString();
                    theme.s_theme_coordinator_id_fk = dtTheme.Rows[0]["s_theme_coordinator_id_fk"].ToString();
                    theme.s_theme_head_logo_file_name = dtTheme.Rows[0]["s_theme_head_logo_file_name"].ToString();
                    theme.s_theme_report_logo_file_name = dtTheme.Rows[0]["s_theme_report_logo_file_name"].ToString();
                    theme.s_theme_notification_logo_file_name = dtTheme.Rows[0]["s_theme_notification_logo_file_name"].ToString();
                    theme.s_theme_css_tag_main_background_hex_value = dtTheme.Rows[0]["s_theme_css_tag_main_background_hex_value"].ToString();
                    theme.s_theme_css_tag_login_background_hex_value = dtTheme.Rows[0]["s_theme_css_tag_login_background_hex_value"].ToString();
                    theme.s_theme_css_tag_login_button_hex_value = dtTheme.Rows[0]["s_theme_css_tag_login_button_hex_value"].ToString();
                    theme.s_theme_css_tag_login_text_hex_value = dtTheme.Rows[0]["s_theme_css_tag_login_text_hex_value"].ToString();
                    theme.s_theme_css_tag_login_link_hex_value = dtTheme.Rows[0]["s_theme_css_tag_login_link_hex_value"].ToString();
                    theme.s_theme_css_tag_nav_top_line_hex_value = dtTheme.Rows[0]["s_theme_css_tag_nav_top_line_hex_value"].ToString();
                    theme.s_theme_css_tag_nav_bar_hex_value = dtTheme.Rows[0]["s_theme_css_tag_nav_bar_hex_value"].ToString();
                    theme.s_theme_css_tag_nav_bar_text_hex_value = dtTheme.Rows[0]["s_theme_css_tag_nav_bar_text_hex_value"].ToString();
                    theme.s_theme_css_tag_nav_bot_line_hex_value = dtTheme.Rows[0]["s_theme_css_tag_nav_bot_line_hex_value"].ToString();
                    theme.s_theme_css_tag_nav_active_hex_value = dtTheme.Rows[0]["s_theme_css_tag_nav_active_hex_value"].ToString();
                    theme.s_theme_css_tag_nav_active_text_hex_value = dtTheme.Rows[0]["s_theme_css_tag_nav_active_text_hex_value"].ToString();
                    theme.s_theme_css_tag_foot_top_line_hex_value = dtTheme.Rows[0]["s_theme_css_tag_foot_top_line_hex_value"].ToString();
                    theme.s_theme_css_tag_foot_bot_line_hex_value = dtTheme.Rows[0]["s_theme_css_tag_foot_bot_line_hex_value"].ToString();
                    theme.s_theme_css_tag_section_head_hex_value = dtTheme.Rows[0]["s_theme_css_tag_section_head_hex_value"].ToString();
                    theme.s_theme_css_tag_section_head_text_hex_value = dtTheme.Rows[0]["s_theme_css_tag_section_head_text_hex_value"].ToString();
                    theme.s_theme_css_tag_section_head_border_hex_value = dtTheme.Rows[0]["s_theme_css_tag_section_head_border_hex_value"].ToString();
                    theme.s_theme_css_tag_table_head_hex_value = dtTheme.Rows[0]["s_theme_css_tag_table_head_hex_value"].ToString();
                    theme.s_theme_css_tag_table_head_text_hex_value = dtTheme.Rows[0]["s_theme_css_tag_table_head_text_hex_value"].ToString();
                    theme.s_theme_css_tag_table_border_hex_value = dtTheme.Rows[0]["s_theme_css_tag_table_border_hex_value"].ToString();
                    theme.s_theme_css_tag_bread_link_hex_value = dtTheme.Rows[0]["s_theme_css_tag_bread_link_hex_value"].ToString();
                    theme.s_theme_css_tag_bread_text_hex_value = dtTheme.Rows[0]["s_theme_css_tag_bread_text_hex_value"].ToString();
                    theme.s_theme_css_tag_body_text_hex_value = dtTheme.Rows[0]["s_theme_css_tag_body_text_hex_value"].ToString();
                    theme.s_theme_css_tag_body_link_hex_value = dtTheme.Rows[0]["s_theme_css_tag_body_link_hex_value"].ToString();
                }
                return theme;
            }
            catch (Exception)
            {
                throw;
            }

        }

        public static DataSet GetLogoandColors(string themeId)
        {
            Hashtable htGetLogoandColors = new Hashtable();
            htGetLogoandColors.Add("@s_theme_system_id_pk", themeId);

            try
            {
                return DataProxy.FetchDataSet("s_sp_get_logo_and_color_by_id", htGetLogoandColors);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public static int UpdateLogo(string columnName, string themeid, string filename)
        {
            Hashtable htUpdateLogo = new Hashtable();
            htUpdateLogo.Add("@columnName", columnName);
            htUpdateLogo.Add("@s_theme_system_id_pk", themeid);
            htUpdateLogo.Add("@logofilename", filename);

            try
            {
                return DataProxy.FetchSPOutput("s_sp_update_logo_file", htUpdateLogo);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static int UpdateTheme(SystemThemes theme)
        {
            Hashtable htUpdateTheme = new Hashtable();
            htUpdateTheme.Add("@s_theme_system_id_pk", theme.s_theme_system_id_pk);
            htUpdateTheme.Add("@s_theme_id_pk", theme.s_theme_id_pk);
            htUpdateTheme.Add("@s_theme_name", theme.s_theme_name);
            htUpdateTheme.Add("@s_theme_description", theme.s_theme_description);
            htUpdateTheme.Add("@s_theme_status_id_fk", theme.s_theme_status_id_fk);
            if (!string.IsNullOrEmpty(theme.s_theme_owner_id_fk))
            {
                htUpdateTheme.Add("@s_theme_owner_id_fk", theme.s_theme_owner_id_fk);
            }
            else
            {
                htUpdateTheme.Add("@s_theme_owner_id_fk", DBNull.Value);
            }
            if (!string.IsNullOrEmpty(theme.s_theme_coordinator_id_fk))
            {
                htUpdateTheme.Add("@s_theme_coordinator_id_fk", theme.s_theme_coordinator_id_fk);
            }
            else
            {
                htUpdateTheme.Add("@s_theme_coordinator_id_fk", DBNull.Value);

            }
            htUpdateTheme.Add("@s_theme_css_tag_main_background_hex_value", theme.s_theme_css_tag_main_background_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_login_background_hex_value", theme.s_theme_css_tag_login_background_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_login_button_hex_value", theme.s_theme_css_tag_login_button_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_login_text_hex_value", theme.s_theme_css_tag_login_text_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_login_link_hex_value", theme.s_theme_css_tag_login_link_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_nav_top_line_hex_value", theme.s_theme_css_tag_nav_top_line_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_nav_bar_hex_value", theme.s_theme_css_tag_nav_bar_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_nav_bar_text_hex_value", theme.s_theme_css_tag_nav_bar_text_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_nav_bot_line_hex_value", theme.s_theme_css_tag_nav_bot_line_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_nav_active_hex_value", theme.s_theme_css_tag_nav_active_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_nav_active_text_hex_value", theme.s_theme_css_tag_nav_active_text_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_foot_top_line_hex_value", theme.s_theme_css_tag_foot_top_line_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_foot_bot_line_hex_value", theme.s_theme_css_tag_foot_bot_line_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_section_head_hex_value", theme.s_theme_css_tag_section_head_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_section_head_text_hex_value", theme.s_theme_css_tag_section_head_text_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_section_head_border_hex_value", theme.s_theme_css_tag_section_head_border_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_table_head_hex_value", theme.s_theme_css_tag_table_head_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_table_head_text_hex_value", theme.s_theme_css_tag_table_head_text_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_table_border_hex_value", theme.s_theme_css_tag_table_border_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_bread_link_hex_value", theme.s_theme_css_tag_bread_link_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_bread_text_hex_value", theme.s_theme_css_tag_bread_text_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_body_text_hex_value", theme.s_theme_css_tag_body_text_hex_value);
            htUpdateTheme.Add("@s_theme_css_tag_body_link_hex_value", theme.s_theme_css_tag_body_link_hex_value);

            try
            {
                return DataProxy.FetchSPOutput("s_sp_update_theme", htUpdateTheme);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static string GetDefaultColorById(string colorId)
        {
            Hashtable htGetColor = new Hashtable();
            htGetColor.Add("@colorId", colorId);
            string color = string.Empty;
            DataTable dt = new DataTable();
            try
            {
                dt = DataProxy.FetchDataTable("s_sp_get_default_single_color", htGetColor);
                if (dt.Rows.Count > 0)
                {
                    color = dt.Rows[0]["colorValue"].ToString();
                }
                return color;
            }

            catch (Exception)
            {
                throw;
            }
        }

        public static string GetColorNameById(string colorId, string s_theme_system_id_pk)
        {
            Hashtable htGetColor = new Hashtable();
            htGetColor.Add("@colorId", colorId);
            htGetColor.Add("@s_theme_system_id_pk", s_theme_system_id_pk);
            string color = string.Empty;
            DataTable dt = new DataTable();
            try
            {
                dt = DataProxy.FetchDataTable("s_sp_get_single_color", htGetColor);
                if (dt.Rows.Count > 0)
                {
                    color = dt.Rows[0]["colorValue"].ToString();
                }
                return color;
            }

            catch (Exception)
            {
                throw;
            }
        }
    }
}
