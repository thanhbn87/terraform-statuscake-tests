provider "statuscake" {
  username = var.statuscake_user
  apikey   = var.statuscake_apikey
}

resource "statuscake_test" "this" {
  count         = length(var.statuscake_tests)
  website_name  = "${var.domain_name} ${lookup(var.statuscake_tests[count.index], "name")}"
  website_url   = "${lookup(var.statuscake_tests[count.index], "url", "https://${var.domain_name}/${lookup(var.statuscake_tests[count.index], "uri")}")}"
  test_type     = lookup(var.statuscake_tests[count.index], "type", "HTTP")
  check_rate    = var.check_rate
  contact_group = var.contact_group
  trigger_rate  = var.trigger_rate
  basic_user    = lookup(var.statuscake_tests[count.index], "basic_user", "")
  basic_pass    = lookup(var.statuscake_tests[count.index], "basic_pass", "")
  confirmations = var.confirmations
  status_codes  = var.status_codes
  paused        = var.paused
  timeout       = var.timeout

  port             = var.port
  custom_header    = var.custom_header
  user_agent       = var.user_agent
  node_locations   = var.node_locations
  test_tags        = var.test_tags
  use_jar          = var.use_jar
  final_endpoint   = var.final_endpoint
  enable_ssl_alert = var.enable_ssl_alert
  follow_redirect  = var.follow_redirect
  virus            = var.virus
}