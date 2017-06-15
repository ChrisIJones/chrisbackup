view: dim_transaction_type {
  derived_table: {
  sql:
    SELECT lvl3.*,lvl2.lvl2, lvl2.full_lvl2, lvl1.lvl1, lvl1.full_lvl1
    FROM (SELECT * FROM SHARED_MRT_UAT7.DIM_TRANSACTION_TYPE WHERE transaction_type_level = '3') lvl3
    LEFT JOIN
          (SELECT parent_transaction_type_key, transaction_type_key, transaction_type_desc as lvl2 , transaction_type_full_desc as full_lvl2 FROM SHARED_MRT_UAT7.DIM_TRANSACTION_TYPE WHERE transaction_type_level='2') lvl2
    ON lvl3.parent_transaction_type_key = lvl2.transaction_type_key
    LEFT JOIN
          (SELECT transaction_type_key, transaction_type_desc as lvl1 , transaction_type_full_desc as full_lvl1 FROM SHARED_MRT_UAT7.DIM_TRANSACTION_TYPE WHERE transaction_type_level='1') lvl1
    ON lvl2.parent_transaction_type_key = lvl1.transaction_type_key
  ;;
}
  dimension_group: interface_dttm {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.INTERFACE_DTTM ;;
  }

  dimension: parent_transaction_type_key {
    type: string
    sql: ${TABLE}.PARENT_TRANSACTION_TYPE_KEY ;;
  }

  dimension_group: process_dttm {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.PROCESS_DTTM ;;
  }

  dimension: transaction_type_desc_lvl3 {
    group_label: "Type Description"
    label: "Level 3 Type Description"
    type: string
    sql: ${TABLE}.TRANSACTION_TYPE_DESC ;;
  }

  dimension: transaction_type_desc_lvl2 {
    group_label: "Type Description"
    label: "Level 2 Type Description"
    type: string
    sql: ${TABLE}.lvl2 ;;
  }

  dimension: transaction_type_desc_lvl1 {
    group_label: "Type Description"
    label: "Level 1 Type Description"
    type: string
    sql: ${TABLE}.lvl1 ;;
  }

  dimension: transaction_type_full_desc {
    type: string
    sql: ${TABLE}.TRANSACTION_TYPE_FULL_DESC ;;
  }

  dimension: transaction_type_key {
    type: string
    primary_key: yes
    sql: ${TABLE}.TRANSACTION_TYPE_KEY ;;
  }

  dimension: transaction_type_level {
    type: string
    sql: ${TABLE}.TRANSACTION_TYPE_LEVEL ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_distinct {
    sql: ${transaction_type_level} ;;
  }
}
