provider "statuscake" {
  username = var.statuscake_user
  apikey   = var.statuscake_apikey
}

resource "statuscake_test" "this" {
  for_each      = { for sc in var.statuscake_tests: sc.name => sc }
  website_name  = var.domain_name == "" ? lookup(each.value, "name") : "${var.domain_name} ${lookup(each.value, "name")}"
  website_url   = var.domain_name == "" ? lookup(each.value, "url") : lookup(each.value, "url", "https://${var.domain_name}/${lookup(each.value, "uri")}")
  test_type     = lookup(each.value, "type", "HTTP")
  check_rate    = lookup(each.value, "check_rate", var.check_rate)
  contact_group = split(",", lookup(each.value, "contact_group", var.contact_group))
  trigger_rate  = lookup(each.value, "trigger_rate", var.trigger_rate)
  basic_user    = lookup(each.value, "basic_user", "")
  basic_pass    = lookup(each.value, "basic_pass", "")
  confirmations = lookup(each.value, "confirmations", var.confirmations)
  status_codes  = lookup(each.value, "status_codes", var.status_codes)
  paused        = lookup(each.value, "paused", false)
  timeout       = lookup(each.value, "timeout", var.timeout)

  port             = lookup(each.value, "port", null)
  custom_header    = lookup(each.value, "custom_header", null)
  user_agent       = lookup(each.value, "user_agent", null)
  node_locations   = lookup(each.value, "node_locations", null) == null ? null : split(",", lookup(each.value, "node_locations"))
  test_tags        = lookup(each.value, "test_tags", null) == null ? null : split(",", lookup(each.value, "test_tags"))
  final_endpoint   = lookup(each.value, "final_endpoint", null)
  enable_ssl_alert = lookup(each.value, "enable_ssl_alert", false)
  follow_redirect  = lookup(each.value, "follow_redirect", false)
  virus            = lookup(each.value, "virus", 0)
}