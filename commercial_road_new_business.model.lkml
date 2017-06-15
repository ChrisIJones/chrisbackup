connection: "tcid"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

# explore: dim_transaction_type {}

### Explore for 3 levels of granularity for the Fact table ####
explore: fact_policy_transaction {
  label: "Policy Transaction Fact"
  join: dim_transaction_type {
    type: left_outer
    sql_on: ${dim_transaction_type.transaction_type_key} = ${fact_policy_transaction.transaction_type_level_3_key} ;;
    relationship: many_to_one
  }
}

###

### Explore for Inbound interactions ###

### Explore for Actual and Forecast
explore: new_business_sale{
  label: "New Business Sale"
  join: policy_type {
    type: inner
    sql_on: ${new_business_sale.policy_type_level_2_key} = ${policy_type.policy_type_key} ;;
    relationship: many_to_one
  }
  join: dim_date {
    type: inner
    sql_on: ${new_business_sale.date_key} = ${dim_date.date_key} ;;
    relationship: many_to_one
  }

#   join: financial_date_filter {
#     type: inner
#     sql_on: ${financial_date_filter.date_key} = ${dim_date.date_key} ;;
#     relationship: one_to_one
#   }

}


# explore: policy_type{}

# explore:dim_transaction_type{}

# - explore: dim_call_type

# - explore: dim_channel

# - explore: dim_contract_and_recurrence

# - explore: dim_contract_type

# - explore: dim_customer_type

# - explore: dim_date

# - explore: dim_device_type

# - explore: dim_digital_visit_type

# - explore: dim_lead_source_code

# - explore: dim_lead_source_group

# - explore: dim_membership_type

# - explore: dim_package

# - explore: dim_payment_method

# - explore: dim_policy_line



# - explore: dim_recurrence_pattern

# - explore: dim_source_code

# - explore: dim_source_group

# - explore: dim_staff

# - explore: dim_time

# - explore: dim_transaction_type

# - explore: fact_interaction_digital_visit

# - explore: fact_interaction_inbound_call

# - explore: fact_interaction_inbound_dial

# - explore: fact_interaction_outbound_dial

# - explore: fact_policy_snp

# - explore: fact_policy_transaction_line

# - explore: fact_staffing
