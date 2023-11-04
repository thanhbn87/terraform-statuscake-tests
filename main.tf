provider "statuscake" {
  api_token = var.api_token
}

resource "statuscake_uptime_check" "this" {
  for_each = { for test in var.statuscake_tests : test["name"] => test }

  name           = each.value["name"]
  check_interval = try(each.value["check_interval"], 300)
  confirmation   = try(each.value["confirmation"], 1)
  trigger_rate   = try(each.value["trigger_rate"], 10)
  contact_groups = try(each.value["contact_groups"], [])
  paused         = try(each.value["paused"], false)
  regions        = try(each.value["regions"], [])
  tags           = try(each.value["tags"], [])

  monitored_resource {
    address = each.value["address"]
    host    = try(each.value["host"], null)
  }

  dynamic "http_check" {
    for_each = each.value["dns_check"] != null || each.value["tcp_check"] != null ? [] : try(each.value["http_check"] != null ? [1] : null, [])
    content {
      enable_cookies   = try(http_check.enable_cookies, false)
      final_endpoint   = try(http_check.final_endpoint, null)
      follow_redirects = try(http_check.follow_redirects, false)
      timeout          = try(http_check.timeout, 20)
      user_agent       = try(http_check.user_agent, "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/98 Safari/537.4 (StatusCake)")
      validate_ssl     = try(http_check.validate_ssl, true)


      dynamic "basic_authentication" {
        for_each = try(http_check.basic_user != null ? [1] : null, [])
        content {
          username = try(http_check.basic_user, "")
          password = try(http_check.basic_pass, "")
        }
      }

      dynamic "content_matchers" {
        for_each = try(http_check.content_matchers != null ? [1] : null, [])
        content {
          content         = try(http_check.content_matchers.content, "")
          include_headers = try(http_check.content_matchers.include_headers, false)
          matcher         = try(http_check.content_matchers.matcher, "CONTAINS_STRING")
        }
      }

      request_payload     = try(http_check.request_payload, null)
      request_payload_raw = try(http_check.request_payload_raw, null)
      request_method      = try(http_check.request_method, "HTTP")
      request_headers     = try(http_check.request_headers, {})
      status_codes        = try(http_check.status_codes, ["204", "205", "206", "303", "400", "401", "403", "404", "405", "406", "408", "410", "413", "444", "429", "494", "495", "496", "499", "500", "501", "502", "503", "504", "505", "506", "507", "508", "509", "510", "511", "521", "522", "523", "524", "520", "598", "599"])
    }
  }

  dynamic "dns_check" {
    for_each = try(each.value["dns_check"] != null ? [1] : null, [])
    content {
      dns_ips = try(dns_check.dns_ips, [])

      dns_server = try(dns_check.dns_server, "")
    }
  }

  dynamic "tcp_check" {
    for_each = try(each.value["tcp_check"] != null ? [1] : null, [])
    content {
      port = try(tcp_check.port, 80)

      dynamic "authentication" {
        for_each = try(tcp_check.authentication != null ? [1] : null, [])
        content {
          username = try(tcp_check.authentication.username, "")
          password = try(tcp_check.authentication.password, "")
        }
      }

      protocol = try(tcp_check.protocol, "TCP")
      timeout  = try(tcp_check.timeout, 10)
    }
  }

}
