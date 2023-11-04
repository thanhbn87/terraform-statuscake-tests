terraform {
  required_version = ">= 1.3.0"

  required_providers {
    statuscake = {
      source  = "StatusCakeDev/statuscake"
      version = "~> 2.2.2"
    }
  }
}
