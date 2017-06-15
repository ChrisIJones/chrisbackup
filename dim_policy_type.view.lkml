view: policy_type {
  derived_table: {
    sql:
        SELECT lvl2.*,lvl1.lvl1, lvl1.full_lvl1, lvl0.lvl0, lvl0.full_lvl0
        FROM (SELECT * FROM SHARED_MRT_UAT7.DIM_POLICY_TYPE WHERE policy_type_level = '2') lvl2
        LEFT JOIN
              (SELECT parent_policy_type_key, policy_type_key, policy_type_desc as lvl1 , policy_type_full_desc as full_lvl1 FROM SHARED_MRT_UAT7.DIM_POLICY_TYPE WHERE policy_type_level='1') lvl1
        ON lvl2.parent_policy_type_key = lvl1.policy_type_key
        LEFT JOIN
              (SELECT policy_type_key, policy_type_desc as lvl0 , policy_type_full_desc as full_lvl0 FROM SHARED_MRT_UAT7.DIM_POLICY_TYPE WHERE policy_type_level='0') lvl0
        ON lvl1.parent_policy_type_key = lvl0.policy_type_key
      ;;
  }


  dimension_group: interface_dttm {
    type: time
    hidden:  yes
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.INTERFACE_DTTM ;;
  }

  dimension: parent_policy_type_key {
    type: string
    hidden:  yes
    sql: ${TABLE}.PARENT_POLICY_TYPE_KEY ;;
  }

  dimension: policy_type_desc_lvl2 {
    group_label: "Policy Description"
    label: "Level 2 Policy Description"
    type: string
    sql: ${TABLE}.POLICY_TYPE_DESC ;;
  }

  dimension: policy_type_desc_lvl1 {
    group_label: "Policy Description"
    label: "Level 1 Policy Description"
    type: string
    sql: ${TABLE}.lvl1 ;;
  }

  dimension: policy_type_desc_lvl0 {
    group_label: "Policy Description"
    label: "Level 0 Policy Description"
    type: string
    sql: ${TABLE}.lvl0 ;;
  }

  dimension: policy_type_full_desc_lvl2 {
    group_label: "Policy Full Description"
    label: "Level 2 Policy Full Description"
    type: string
    sql: ${TABLE}.policy_type_full_desc ;;
  }

  dimension: policy_type_full_desc_lvl1 {
    group_label: "Policy Full Description"
    label: "Level 1 Policy Full Description"
    type: string
    sql: ${TABLE}.full_lvl1 ;;
  }

  dimension: policy_type_full_desc_lvl0 {
    group_label: "Policy Full Description"
    label: "Level 0 Policy Full Description"
    type: string
    sql: ${TABLE}.full_lvl0 ;;
  }

  dimension: policy_type_key {
    primary_key: yes
    type: string
    hidden:  yes
    sql: ${TABLE}.POLICY_TYPE_KEY ;;
  }

  dimension: policy_type_level {
    type: string
    sql: ${TABLE}.POLICY_TYPE_LEVEL ;;
  }

  dimension_group: process_dttm {
    type: time
    hidden:  yes
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.PROCESS_DTTM ;;
  }


}
