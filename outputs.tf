output "ids" {
  description = "The ID of StatusCake Tests"
  value       = try(statuscake_uptime_check.this[*].id, [])
}
