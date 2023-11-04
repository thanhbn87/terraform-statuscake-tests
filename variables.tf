variable "api_token" {
  description = "The API token for operations."
  type        = string
}

variable "statuscake_tests" {
  description = "The list of tests for the domain name"
  type        = list(any)
  default     = []
}
