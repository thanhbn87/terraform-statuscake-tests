variable "statuscake_user" {
  description = "The StatusCake Username"
  type        = string
}

variable "statuscake_apikey" {
  description = "The StatusCake API Key"
  type        = string
}

variable "statuscake_contact_id" {
  description = "The contact ID of StatusCake account"
  type        = string
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
  description = "The list of test for the domain name"
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
