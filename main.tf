provider "statuscake" {
  username = var.statuscake_user
  apikey   = var.statuscake_apikey
}

resource "statuscake_test" "this" {
  count         = length(var.statuscake_tests)
  website_name  = "${var.domain_name} ${lookup(var.statuscake_tests[count.index], "name")}"
  website_url   = "https://${var.domain_name}/${lookup(var.statuscake_tests[count.index], "uri")}"
  test_type     = lookup(var.statuscake_tests[count.index], "type", "HTTP")
  check_rate    = var.check_rate
  contact_group = [var.statuscake_contact_id]
  trigger_rate  = var.trigger_rate
  basic_user    = lookup(var.statuscake_tests[count.index], "basic_user", "")
  basic_pass    = lookup(var.statuscake_tests[count.index], "basic_pass", "")
  confirmations = var.confirmations
  status_codes  = var.status_codes
}
