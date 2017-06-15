# view:  financial_date_filter {
#   extends: [dim_date]
# }

view: dim_date {
  sql_table_name: SHARED_MRT_UAT7.DIM_DATE ;;

#   dimension: calendar_day_duration {
#     type: string
#     sql: ${TABLE}.CALENDAR_DAY_DURATION ;;
#   }
#
#   dimension: calendar_day_full_name {
#     type: string
#     sql: ${TABLE}.CALENDAR_DAY_FULL_NAME ;;
#   }
#
#   dimension: calendar_day_name {
#     type: string
#     sql: ${TABLE}.CALENDAR_DAY_NAME ;;
#   }
#
#   dimension: calendar_day_number_of_month {
#     type: string
#     sql: ${TABLE}.CALENDAR_DAY_NUMBER_OF_MONTH ;;
#   }
#
#   dimension: calendar_day_number_of_week {
#     type: string
#     sql: ${TABLE}.CALENDAR_DAY_NUMBER_OF_WEEK ;;
#   }
#
#   dimension: calendar_day_number_of_year {
#     type: string
#     sql: ${TABLE}.CALENDAR_DAY_NUMBER_OF_YEAR ;;
#   }
#
#   dimension: calendar_day_short_name {
#     type: string
#     sql: ${TABLE}.CALENDAR_DAY_SHORT_NAME ;;
#   }
#
#   dimension: calendar_half_year_duration {
#     type: string
#     sql: ${TABLE}.CALENDAR_HALF_YEAR_DURATION ;;
#   }
#
#   dimension_group: calendar_half_year_end {
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: no
#     sql: ${TABLE}.CALENDAR_HALF_YEAR_END_DATE ;;
#   }
#
#   dimension: calendar_half_year_full_name {
#     type: string
#     sql: ${TABLE}.CALENDAR_HALF_YEAR_FULL_NAME ;;
#   }
#
#   dimension: calendar_half_year_name {
#     type: string
#     sql: ${TABLE}.CALENDAR_HALF_YEAR_NAME ;;
#   }
#
#   dimension: calendar_half_year_number {
#     type: string
#     sql: ${TABLE}.CALENDAR_HALF_YEAR_NUMBER ;;
#   }
#
#   dimension: calendar_half_year_yyyyh {
#     type: string
#     sql: ${TABLE}.CALENDAR_HALF_YEAR_YYYYH ;;
#   }
#
#   dimension: calendar_month_duration {
#     type: string
#     sql: ${TABLE}.CALENDAR_MONTH_DURATION ;;
#   }
#
#   dimension_group: calendar_month_end {
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: no
#     sql: ${TABLE}.CALENDAR_MONTH_END_DATE ;;
#   }
#
#   dimension: calendar_month_full_name {
#     type: string
#     sql: ${TABLE}.CALENDAR_MONTH_FULL_NAME ;;
#   }
#
#   dimension: calendar_month_name {
#     type: string
#     sql: ${TABLE}.CALENDAR_MONTH_NAME ;;
#   }
#
#   dimension: calendar_month_number {
#     type: string
#     sql: ${TABLE}.CALENDAR_MONTH_NUMBER ;;
#   }
#
#   dimension: calendar_month_short_name {
#     type: string
#     sql: ${TABLE}.CALENDAR_MONTH_SHORT_NAME ;;
#   }
#
#   dimension: calendar_month_yyyymm {
#     type: string
#     sql: ${TABLE}.CALENDAR_MONTH_YYYYMM ;;
#   }
#
#   dimension: calendar_quarter_duration {
#     type: string
#     sql: ${TABLE}.CALENDAR_QUARTER_DURATION ;;
#   }
#
#   dimension_group: calendar_quarter_end {
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: no
#     sql: ${TABLE}.CALENDAR_QUARTER_END_DATE ;;
#   }
#
#   dimension: calendar_quarter_full_name {
#     type: string
#     sql: ${TABLE}.CALENDAR_QUARTER_FULL_NAME ;;
#   }
#
#   dimension: calendar_quarter_name {
#     type: string
#     sql: ${TABLE}.CALENDAR_QUARTER_NAME ;;
#   }
#
#   dimension: calendar_quarter_number {
#     type: string
#     sql: ${TABLE}.CALENDAR_QUARTER_NUMBER ;;
#   }
#
#   dimension: calendar_quarter_yyyyq {
#     type: string
#     sql: ${TABLE}.CALENDAR_QUARTER_YYYYQ ;;
#   }
#
#   dimension: calendar_week_duration {
#     type: string
#     sql: ${TABLE}.CALENDAR_WEEK_DURATION ;;
#   }
#
#   dimension_group: calendar_week_end {
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: no
#     sql: ${TABLE}.CALENDAR_WEEK_END_DATE ;;
#   }
#
#   dimension: calendar_week_full_name {
#     type: string
#     sql: ${TABLE}.CALENDAR_WEEK_FULL_NAME ;;
#   }
#
#   dimension: calendar_week_number {
#     type: string
#     sql: ${TABLE}.CALENDAR_WEEK_NUMBER ;;
#   }
#
#   dimension: calendar_week_short_name {
#     type: string
#     sql: ${TABLE}.CALENDAR_WEEK_SHORT_NAME ;;
#   }
#
#   dimension: calendar_year {
#     type: string
#     sql: ${TABLE}.CALENDAR_YEAR ;;
#   }
#
#   dimension: calendar_year_duration {
#     type: string
#     sql: ${TABLE}.CALENDAR_YEAR_DURATION ;;
#   }
#
#   dimension_group: calendar_year_end {
#     type: time
#     timeframes: [date, week, month]
#     convert_tz: no
#     sql: ${TABLE}.CALENDAR_YEAR_END_DATE ;;
#   }


  dimension_group: date_dttm {
    type: time
    timeframes: [date, week, month, raw, time]
    convert_tz: no
    sql: ${TABLE}.DATE_DTTM ;;
  }

  dimension: date_key {
    primary_key: yes
    type: string
    sql: ${TABLE}.DATE_KEY ;;
  }

  dimension: date_yyyymmdd {
    type: string
    sql: ${TABLE}.DATE_YYYYMMDD ;;
  }

  dimension: financial_day_number_of_week {
    type: string
    sql: ${TABLE}.FINANCIAL_DAY_NUMBER_OF_WEEK ;;
  }

  dimension: financial_week_name {
    type: string
    sql: ${TABLE}.FINANCIAL_WEEK_NAME ;;
  }

  dimension: financial_week_number {
    type: string
    sql: ${TABLE}.FINANCIAL_WEEK_NUMBER ;;
  }

  dimension: financial_week_yyyyww {
    type: string
    sql: ${TABLE}.FINANCIAL_WEEK_YYYYWW ;;
  }

  dimension: financial_year {
    type: string
    sql: ${TABLE}.FINANCIAL_YEAR ;;
  }

  dimension: financial_year_name {
    type: string
    sql: ${TABLE}.FINANCIAL_YEAR_NAME ;;
  }

  dimension_group: interface_dttm {
    type: time
    hidden:  yes
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.INTERFACE_DTTM ;;
  }

#   dimension: is_bank_holiday {
#     type: string
#     sql: ${TABLE}.IS_BANK_HOLIDAY ;;
#   }

#   dimension: is_weekday {
#         type: string
#     sql: ${TABLE}.IS_WEEKDAY ;;
#   }

#   dimension: is_weekend {
#     type: string
#     sql: ${TABLE}.IS_WEEKEND ;;
#   }

  dimension_group: process_dttm {
    hidden:  yes
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.PROCESS_DTTM ;;
  }

#   dimension_group: date_filter {
#     type: time
#     timeframes: [raw]
#     convert_tz: no
#     sql: ${TABLE}.DATE_DTTM ;;
#   }

#   dimension: is_current_month {
#     type: yesno
#     sql: CONCAT(EXTRACT(YEAR FROM ${date_dttm_raw}), EXTRACT(MONTH FROM ${date_dttm_raw})) = CONCAT(EXTRACT(YEAR FROM TO_DATE('15-MAY-17')), EXTRACT(MONTH FROM TO_DATE('15-MAY-17'))) ;;
#   }

#   dimension: is_before_mtd {
#     type: yesno
#     sql: EXTRACT(DAY FROM ${date_dttm_raw}) <= EXTRACT(DAY FROM TO_DATE('15-MAY-17')) ;;
#   }


}
