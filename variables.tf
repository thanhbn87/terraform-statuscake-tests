variable "statuscake_user" {
  description = "The StatusCake Username"
  type        = string
}

variable "statuscake_apikey" {
  description = "The StatusCake API Key"
  type        = string
}

variable "contact_group" {
  description = "The contact group IDs of StatusCake account"
  type        = list(string)
  default     = []
}

variable "status_codes" {
  description = "The Status Codes are needed to alert"
  type        = string
  default     = "204, 205, 206, 303, 400, 401, 403, 404, 405, 406, 408, 410, 413, 444, 429, 494, 495, 496, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 521, 522, 523, 524, 520, 598, 599"
}

variable "domain_name" {
  description = "The Domain name of the test"
  type        = string
}

variable "statuscake_tests" {
  description = "The list of tests for the domain name"
  type        = list
  default     = []
}

variable "check_rate" {
  description = "Test check rate in seconds"
  type        = string
  default     = "300"
}

variable "trigger_rate" {
  description = "The number of minutes to wait before sending an alert"
  type        = string
  default     = "5"
}

variable "confirmations" {
  description = "The number of confirmation servers to use in order to detect downtime. Defaults to 0"
  type        = string
  default     = "0"
}

variable "paused" {
  description = "Whether or not the test is paused. Defaults to false"
  type        = bool
  default     = false
}

variable "timeout" {
  description = "The timeout of the test in seconds"
  type        = string
  default     = "10"
}

variable "node_locations" {
  description = "Set test node locations, must be array of strings."
  type        = list(string)
  default     = null
}

variable "port" {
  description = "The port to use when specifying a TCP test."
  type        = number
  default     = null
}

variable "custom_header" {
  description = "Custom HTTP header, must be supplied as JSON."
  type        = string
  default     = null
}

variable "user_agent" {
  description = "Test with a custom user agent set."
  type        = string
  default     = null
}

variable "test_tags" {
  description = "Set test tags, must be array of strings."
  type        = list(string)
  default     = []
}

variable "final_endpoint" {
  description = "Use to specify the expected Final URL in the testing process."
  type        = string
  default     = null
}

variable "enable_ssl_alert" {
  description = "HTTP Tests only. If enabled, tests will send warnings if the SSL certificate is about to expire. Paid users only. Default is false"
  type        = bool
  default     = false
}

variable "follow_redirect" {
  description = "Use to specify whether redirects should be followed, set to true to enable. Default is false."
  type        = bool
  default     = false
}

variable "virus" {
  description = "Enable virus checking or not. 1 to enable."
  type        = number
  default     = 0
}