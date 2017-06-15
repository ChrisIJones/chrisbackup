view: new_business_sale {
  derived_table: {
    sql: SELECT
              ACCOUNTING_TREATMENT,
              DATE_KEY,
              TIME_KEY,
              TRANSACTION_KEY,
              TRANSACTION_ID,
              POLICY_KEY,
              TRANSACTION_TYPE_LEVEL_3_KEY,
              TRANSACTION_CHANNEL_LEVEL2_KEY,
              CUSTOMER_TYPE_KEY,
              POLICY_TYPE_LEVEL_2_KEY,
              CONTRACT_TYPE_LEVEL_2_KEY,
              RECURRENCE_PATTERN_KEY,
              PAYMENT_METHOD_LEVEL_1_KEY
              CONTRACT_AND_RECURRENCE_KEY,
              PRODUCT_PACKAGE_LEVEL_2_KEY,
              ADDON_PACKAGE_LEVEL_1_KEY,
              DEVICE_TYPE_KEY,
              SOURCE_CODE_KEY,
              STAFF_KEY,
              LEAD_SOURCE_CODE_KEY,
              MEMBERSHIP_TYPE_LEVEL_2_KEY,
              OFFER_CODE,
              IS_WILL_JOIN,
              ANNUALISATION_FACTOR,
              PRODUCT_AND_ADDON_GCP,
              ANNUALISED_PRODUCT_ADDON_GCP,
              TRANSACTION_COUNT,
              SERIES_IDENTIFIER,
              ROW_NUMBER() OVER (ORDER BY DATE_KEY) as ROW_ID,
              DIM_DATE_REFERENCE.DATE_DTTM,
              DIM_DATE_REFERENCE.financial_week_yyyyww,
              DIM_DATE_REFERENCE.FINANCIAL_WEEK_NAME,
              DIM_DATE_REFERENCE.financial_year,
              DIM_DATE_REFERENCE.financial_year_name
              FROM SHARED_MRT_UAT7.FACT_NEW_BUSINESS_SALE
              INNER JOIN
              (SELECT DATE_KEY as DIM_DATE_KEY, DATE_DTTM, financial_week_yyyyww, FINANCIAL_WEEK_NAME, financial_year, financial_year_name FROM SHARED_MRT_UAT7.DIM_DATE) DIM_DATE_REFERENCE
              ON DIM_DATE_REFERENCE.DIM_DATE_KEY = SHARED_MRT_UAT7.FACT_NEW_BUSINESS_SALE.DATE_KEY
            ;;
    }

  dimension: ROW_ID {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.ROW_ID ;;
  }

  dimension: series_identifier {
    type: string
    sql: ${TABLE}.SERIES_IDENTIFIER ;;
  }

  dimension: accounting_treatment {
    type: string
    sql: ${TABLE}.ACCOUNTING_TREATMENT ;;
  }

  dimension: date_key {
    type: string
    sql: ${TABLE}.DATE_KEY ;;
  }

  dimension: time_key {
    type: string
    sql: ${TABLE}.TIME_KEY ;;
  }

  dimension: transaction_key {
    type: string
    sql: ${TABLE}.TRANSACTION_KEY ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.TRANSACTION_ID ;;
  }

  dimension: policy_key {
    type: string
    sql: ${TABLE}.POLICY_KEY ;;
  }

  dimension: transaction_type_level_3_key {
    type: string
    sql: ${TABLE}.TRANSACTION_TYPE_LEVEL_3_KEY ;;
  }

  dimension: transaction_channel_level2_key {
    type: string
    sql: ${TABLE}.TRANSACTION_CHANNEL_LEVEL2_KEY ;;
  }

  dimension: customer_type_key {
    type: string
    sql: ${TABLE}.CUSTOMER_TYPE_KEY ;;
  }

  dimension: policy_type_level_2_key {
    type: string
    sql: ${TABLE}.POLICY_TYPE_LEVEL_2_KEY ;;
  }

  dimension: contract_type_level_2_key {
    type: string
    sql: ${TABLE}.CONTRACT_TYPE_LEVEL_2_KEY ;;
  }

  dimension: recurrence_pattern_key {
    type: string
    sql: ${TABLE}.RECURRENCE_PATTERN_KEY ;;
  }

  dimension: payment_method_level_1_key {
    type: string
    sql: ${TABLE}.PAYMENT_METHOD_LEVEL_1_KEY ;;
  }

  dimension: contract_and_recurrence_key {
    type: string
    sql: ${TABLE}.CONTRACT_AND_RECURRENCE_KEY ;;
  }

  dimension: product_package_level_2_key {
    type: string
    sql: ${TABLE}.PRODUCT_PACKAGE_LEVEL_2_KEY ;;
  }

  dimension: addon_package_level_1_key {
    type: string
    sql: ${TABLE}.ADDON_PACKAGE_LEVEL_1_KEY ;;
  }

  dimension: device_type_key {
    type: string
    sql: ${TABLE}.DEVICE_TYPE_KEY ;;
  }

  dimension: source_code_key {
    type: string
    sql: ${TABLE}.SOURCE_CODE_KEY ;;
  }

  dimension: staff_key {
    type: string
    sql: ${TABLE}.STAFF_KEY ;;
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

  dimension: is_will_join {
    type: string
    sql: ${TABLE}.IS_WILL_JOIN ;;
  }

  dimension: annualisation_factor {
    type: string
    sql: ${TABLE}.ANNUALISATION_FACTOR ;;
  }

  dimension: product_and_addon_gcp {
    type: string
    sql: ${TABLE}.PRODUCT_AND_ADDON_GCP ;;
  }

  dimension: annualised_product_addon_gcp {
    type: string
    sql: ${TABLE}.ANNUALISED_PRODUCT_ADDON_GCP ;;
  }

  dimension: transaction_count {
    type: string
    sql: ${TABLE}.TRANSACTION_COUNT ;;
  }
  # Volume based dimensions for purposes of filtering the volume measures

  dimension: last_date {
    type: date
    sql:  CURRENT_DATE ;;
  }

    dimension_group: new_business_sale_date {
    type: time
    timeframes: [raw, date]
    convert_tz: no
    sql: ${TABLE}.DATE_DTTM ;;
  }

  filter: date_filter_parameter {
    suggest_dimension: dim_date.date_dttm
  }

  dimension: financial_week_yyyyww {
    type: string
    sql: ${TABLE}.financial_week_yyyyww ;;
  }

  dimension: FINANCIAL_WEEK_NAME {
    type: string
    sql: ${TABLE}.FINANCIAL_WEEK_NAME ;;
  }

  dimension: financial_year {
    type: number
    sql: ${TABLE}.financial_year ;;
  }

  dimension: financial_year_name {
    type: string
    sql: ${TABLE}.financial_year_name ;;
  }

  dimension: is_today {
    type: yesno
    sql: ${new_business_sale_date_raw} = {% parameter date_filter_parameter %} ;;
  }


  dimension: is_before_mtd {
    type: yesno
    sql: EXTRACT(DAY FROM ${new_business_sale_date_raw}) <= EXTRACT(DAY FROM TO_DATE({% parameter date_filter_parameter %})) ;;
  }

  dimension: is_current_month {
     type: yesno
     sql: CONCAT(EXTRACT(YEAR FROM ${new_business_sale_date_raw}), EXTRACT(MONTH FROM ${new_business_sale_date_raw})) = CONCAT(EXTRACT(YEAR FROM TO_DATE({% parameter date_filter_parameter %})), EXTRACT(MONTH FROM TO_DATE({% parameter date_filter_parameter %}))) ;;
   }

  dimension: financial_week_filter {
    sql:  CASE WHEN {% condition date_filter_parameter %} ${dim_date.date_dttm_raw} {% endcondition %} THEN ${dim_date.financial_week_yyyyww} END ;;
  }

  dimension: financial_year_filter {
    sql:  CASE WHEN {% condition date_filter_parameter %} ${dim_date.date_dttm_raw} {% endcondition %} THEN ${dim_date.financial_year} END ;;
  }
  dimension: is_this_financial_week {
    type: yesno
    sql: ${financial_week_yyyyww} = ${financial_week_filter} ;;
  }

  measure: volume {
    group_label: "Volume"
    type: sum
    sql: ${TABLE}.TRANSACTION_COUNT;;
  }

  measure: volume_today {
    type: sum
    group_label: "Volume"
    sql: ${TABLE}.TRANSACTION_COUNT;;
    filters: {
      field: is_today
      value: "yes"
    }
  }

#   This measure needs to be adjusted. The filter doesn't have a GROUP BY, meaning if there are no Dimensions in your query, you'll receive an Oracle error with a missing GROUP BY clause.
  measure: volume_this_financial_week {
    type: number
    group_label: "Volume"
    sql: (SELECT SUM(${TABLE}.TRANSACTION_COUNT) FROM ${TABLE} WHERE ${financial_week_yyyyww} = ${financial_week_filter} ) ;;
#     filters: {
#       field: financial_week_yyyyww
#       value: "201815"
#     }
  }

  measure: volume_mtd {
    type: sum
    group_label: "Volume"
    sql: ${TABLE}.TRANSACTION_COUNT;;
    filters: {
      field: is_before_mtd
      value: "yes"
    }
    filters: {
      field: is_current_month
      value: "yes"
    }
  }

  # GCP measures
  measure: annualised_p_a_gcp {
    group_label: "GCP"
    label: "Annualised Product and Add-on GCP"
    type: sum
    sql:  ${annualised_product_addon_gcp};;
    value_format_name: gbp_0
  }

  measure: annualised_p_a_gcp_mtd {
    type: sum
    group_label: "GCP"
    label: "Annualised Product and Add-on GCP MTD"
    sql: ${annualised_product_addon_gcp};;
    value_format_name: gbp_0
    filters: {
      field: is_before_mtd
      value: "yes"
    }
    filters: {
      field: is_current_month
      value: "yes"
    }
  }

  measure: annualised_p_a_gcp_today {
    type: sum
    group_label: "GCP"
    sql: ${annualised_product_addon_gcp};;
    value_format_name: gbp_0
    filters: {
      field: is_today
      value: "yes"
    }
  }

  measure: annualised_p_a_gcp_this_financial_week {
    type: number
    group_label: "GCP"
    label: "Annualised Product and Add-on GCP This Week"

    sql: (SELECT SUM(${annualised_product_addon_gcp}) FROM ${TABLE} WHERE ${financial_week_yyyyww} = ${financial_week_filter} ) ;;
#     filters: {
#       field: financial_week_yyyyww
#       value: "201815"
#     }
  }
  # AATV measures
  measure: annualised_aatv {
    group_label: "AATV"
    label: "Annualised Average Product and Add-on Transaction Value"
    type: number
    sql: ${annualised_p_a_gcp}/NULLIF(${volume},0)  ;;
    value_format_name: gbp
  }

  measure: annualised_aatv_mtd {
    group_label: "AATV"
    label: "Annualised Average Product and Add-on Transaction Value MTD"
    type: number
    sql: ${annualised_p_a_gcp_mtd}/NULLIF(${volume},0)  ;;
    value_format_name: gbp
  }

  measure: annualised_aatv_today {
    group_label: "AATV"
    label: "Annualised Average Product and Add-on Transaction Value Today"
    type: number
    sql: ${annualised_p_a_gcp_today}/NULLIF(${volume},0)  ;;
    value_format_name: gbp
  }




  set: detail {
    fields: [series_identifier, accounting_treatment, date_key, time_key, transaction_key, transaction_id, policy_key, transaction_type_level_3_key, transaction_channel_level2_key, customer_type_key, policy_type_level_2_key, contract_type_level_2_key, recurrence_pattern_key, payment_method_level_1_key, contract_and_recurrence_key, product_package_level_2_key, addon_package_level_1_key, device_type_key, source_code_key, staff_key, lead_source_code_key, membership_type_level_2_key, offer_code, is_will_join, annualisation_factor, product_and_addon_gcp, annualised_product_addon_gcp, transaction_count]
  }
}
