connection: "snowflake_test"

# include all the views
include: "/views/**/*.view"

datagroup: apna_analytics_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: apna_analytics_default_datagroup

explore: all_types {}

explore: billion_orders {
  join: orders {
    type: left_outer
    sql_on: ${billion_orders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: hundred_million_orders {
  join: orders {
    type: left_outer
    sql_on: ${hundred_million_orders.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: linna2 {}

explore: linna3 {}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders_view {
  join: users {
    type: left_outer
    sql_on: ${orders_view.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {}
