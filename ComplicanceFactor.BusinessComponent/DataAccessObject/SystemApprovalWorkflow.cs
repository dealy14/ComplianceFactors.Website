﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ComplicanceFactor.BusinessComponent.DataAccessObject
{
    public class SystemApprovalWorkflow
    {
        //EmployeeTypes

        public string s_approval_workflow_system_id_pk { get; set; }
        public string s_approval_workflow_id { get; set; }
        public string s_approval_workflow_status_id_fk { get; set; }
        public string s_first_level_approver_id_fk { get; set; }
        public string s_second_level_approver_id_fk { get; set; }
        public string s_third_level_approver_id_fk { get; set; }
        public string s_first_level_approver_user_id_fk { get; set; }
        public string s_second_level_approver_user_id_fk { get; set; }
        public string s_third_level_approver_user_id_fk { get; set; }
        public bool s_first_level_status { get; set; }
        public bool s_second_level_status { get; set; }
        public bool s_third_level_status { get; set; }

        public string first_level_user_name { get; set; }
        public string second_level_user_name { get; set; }
        public string third_level_user_name { get; set; }

        public string s_approval_workflow_name_us_english { get; set; }
        public string s_approval_workflow_desc_us_english { get; set; }
        public string s_approval_workflow_name_uk_english { get; set; }
        public string s_approval_workflow_desc_uk_english { get; set; }
        public string s_approval_workflow_name_ca_french { get; set; }
        public string s_approval_workflow_desc_ca_french { get; set; }
        public string s_approval_workflow_name_fr_french { get; set; }
        public string s_approval_workflow_desc_fr_french { get; set; }
        public string s_approval_workflow_name_mx_spanish { get; set; }
        public string s_approval_workflow_desc_mx_spanish { get; set; }
        public string s_approval_workflow_name_sp_spanish { get; set; }
        public string s_approval_workflow_desc_sp_spanish { get; set; }
        public string s_approval_workflow_name_portuguese { get; set; }
        public string s_approval_workflow_desc_portuguese { get; set; }
        public string s_approval_workflow_name_simp_chinese { get; set; }
        public string s_approval_workflow_desc_simp_chinese { get; set; }
        public string s_approval_workflow_name_german { get; set; }
        public string s_approval_workflow_desc_german { get; set; }
        public string s_approval_workflow_name_japanese { get; set; }
        public string s_approval_workflow_desc_japanese { get; set; }
        public string s_approval_workflow_name_russian { get; set; }
        public string s_approval_workflow_desc_russian { get; set; }
        public string s_approval_workflow_name_danish { get; set; }
        public string s_approval_workflow_desc_danish { get; set; }
        public string s_approval_workflow_name_polish { get; set; }
        public string s_approval_workflow_desc_polish { get; set; }
        public string s_approval_workflow_name_swedish { get; set; }
        public string s_approval_workflow_desc_swedish { get; set; }
        public string s_approval_workflow_name_finnish { get; set; }
        public string s_approval_workflow_desc_finnish { get; set; }
        public string s_approval_workflow_name_korean { get; set; }
        public string s_approval_workflow_desc_korean { get; set; }
        public string s_approval_workflow_name_italian { get; set; }
        public string s_approval_workflow_desc_italian { get; set; }
        public string s_approval_workflow_name_dutch { get; set; }
        public string s_approval_workflow_desc_dutch { get; set; }
        public string s_approval_workflow_name_indonesian { get; set; }
        public string s_approval_workflow_desc_indonesian { get; set; }
        public string s_approval_workflow_name_greek { get; set; }
        public string s_approval_workflow_desc_greek { get; set; }
        public string s_approval_workflow_name_hungarian { get; set; }
        public string s_approval_workflow_desc_hungarian { get; set; }
        public string s_approval_workflow_name_norwegian { get; set; }
        public string s_approval_workflow_desc_norwegian { get; set; }
        public string s_approval_workflow_name_turkish { get; set; }
        public string s_approval_workflow_desc_turkish { get; set; }
        public string s_approval_workflow_name_arabic_rtl { get; set; }
        public string s_approval_workflow_desc_arabic_rtl { get; set; }
        public string s_approval_workflow_name_custom_01 { get; set; }
        public string s_approval_workflow_desc_custom_01 { get; set; }
        public string s_approval_workflow_name_custom_02 { get; set; }
        public string s_approval_workflow_desc_custom_02 { get; set; }
        public string s_approval_workflow_name_custom_03 { get; set; }
        public string s_approval_workflow_desc_custom_03 { get; set; }
        public string s_approval_workflow_name_custom_04 { get; set; }
        public string s_approval_workflow_desc_custom_04 { get; set; }
        public string s_approval_workflow_name_custom_05 { get; set; }
        public string s_approval_workflow_desc_custom_05 { get; set; }
        public string s_approval_workflow_name_custom_06 { get; set; }
        public string s_approval_workflow_desc_custom_06 { get; set; }
        public string s_approval_workflow_name_custom_07 { get; set; }
        public string s_approval_workflow_desc_custom_07 { get; set; }
        public string s_approval_workflow_name_custom_08 { get; set; }
        public string s_approval_workflow_desc_custom_08 { get; set; }
        public string s_approval_workflow_name_custom_09 { get; set; }
        public string s_approval_workflow_desc_custom_09 { get; set; }
        public string s_approval_workflow_name_custom_10 { get; set; }
        public string s_approval_workflow_desc_custom_10 { get; set; }
        public string s_approval_workflow_name_custom_11 { get; set; }
        public string s_approval_workflow_desc_custom_11 { get; set; }
        public string s_approval_workflow_name_custom_12 { get; set; }
        public string s_approval_workflow_desc_custom_12 { get; set; }
        public string s_approval_workflow_name_custom_13 { get; set; }
        public string s_approval_workflow_desc_custom_13 { get; set; }
    }
}
