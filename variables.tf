variable "api_token" {
  description = "The API token for operations."
  type        = string
}

variable "statuscake_tests" {
  description = "The list of tests for the domain name"
  type        = any
  default     = []
}

variable "contact_groups" {
  description = "The list of contact groups."
  type        = list(string)
  default     = null
}
