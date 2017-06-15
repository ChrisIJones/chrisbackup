view: fact_policy_transaction {
  sql_table_name: SHARED_MRT_UAT7.FACT_POLICY_TRANSACTION ;;

  dimension: addon_package_level_1_key {
    type: string
    sql: ${TABLE}.ADDON_PACKAGE_LEVEL_1_KEY ;;
  }

  dimension: annualisation_factor {
    type: string
    sql: ${TABLE}.ANNUALISATION_FACTOR ;;
  }

  dimension: annualised_product_addon_gcp {
    type: string
    sql: ${TABLE}.ANNUALISED_PRODUCT_ADDON_GCP ;;
  }

  dimension: contract_and_recurrence_key {
    type: string
    sql: ${TABLE}.CONTRACT_AND_RECURRENCE_KEY ;;
  }

  dimension: contract_duration_days {
    type: string
    sql: ${TABLE}.CONTRACT_DURATION_DAYS ;;
  }

  dimension: contract_type_level_2_key {
    type: string
    sql: ${TABLE}.CONTRACT_TYPE_LEVEL_2_KEY ;;
  }

  dimension: customer_type_key {
    type: string
    sql: ${TABLE}.CUSTOMER_TYPE_KEY ;;
  }

  dimension: device_type_key {
    type: string
    sql: ${TABLE}.DEVICE_TYPE_KEY ;;
  }

  dimension: effective_date_key {
    type: string
    sql: ${TABLE}.EFFECTIVE_DATE_KEY ;;
  }

  dimension: effective_time_key {
    type: string
    sql: ${TABLE}.EFFECTIVE_TIME_KEY ;;
  }

  dimension: inception_date_key {
    type: string
    sql: ${TABLE}.INCEPTION_DATE_KEY ;;
  }

  dimension: inception_time_key {
    type: string
    sql: ${TABLE}.INCEPTION_TIME_KEY ;;
  }

  dimension_group: interface_dttm {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.INTERFACE_DTTM ;;
  }

  dimension: is_will_join {
    type: string
    sql: ${TABLE}.IS_WILL_JOIN ;;
  }

  dimension: lead_source_code_key {
    type: string
    sql: ${TABLE}.LEAD_SOURCE_CODE_KEY ;;
  }

  dimension: membership_type_level_2_key {
    type: string
    sql: ${TABLE}.MEMBERSHIP_TYPE_LEVEL_2_KEY ;;
  }

  dimension: offer_code {
    type: string
    sql: ${TABLE}.OFFER_CODE ;;
  }

  dimension: payment_method_level_1_key {
    type: string
    sql: ${TABLE}.PAYMENT_METHOD_LEVEL_1_KEY ;;
  }

  dimension: policy_key {
    type: string
    sql: ${TABLE}.POLICY_KEY ;;
  }

  dimension: policy_type_level_2_key {
    type: string
    sql: ${TABLE}.POLICY_TYPE_LEVEL_2_KEY ;;
  }

  dimension_group: process_dttm {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.PROCESS_DTTM ;;
  }

  dimension: product_and_addon_gcp {
    type: string
    sql: ${TABLE}.PRODUCT_AND_ADDON_GCP ;;
  }

  dimension: product_package_level_2_key {
    type: string
    sql: ${TABLE}.PRODUCT_PACKAGE_LEVEL_2_KEY ;;
  }

  dimension: recurrence_pattern_key {
    type: string
    sql: ${TABLE}.RECURRENCE_PATTERN_KEY ;;
  }

  dimension: source_code_key {
    type: string
    sql: ${TABLE}.SOURCE_CODE_KEY ;;
  }

  dimension: staff_key {
    type: string
    sql: ${TABLE}.STAFF_KEY ;;
  }

  dimension: transaction_channel_level2_key {
    type: string
    sql: ${TABLE}.TRANSACTION_CHANNEL_LEVEL2_KEY ;;
  }

  dimension: transaction_date_key {
    type: string
    sql: ${TABLE}.TRANSACTION_DATE_KEY ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.TRANSACTION_ID ;;
  }

  dimension: transaction_key {
    type: string
    sql: ${TABLE}.TRANSACTION_KEY ;;
    primary_key: yes
  }

  dimension: transaction_time_key {
    type: string
    sql: ${TABLE}.TRANSACTION_TIME_KEY ;;
  }

  dimension: transaction_type_level_3_key {
    type: string
    sql: ${TABLE}.TRANSACTION_TYPE_LEVEL_3_KEY ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
