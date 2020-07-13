output "test_ids" {
  description = "The ID of StatusCake Tests"
  value       = statuscake_test.this.*.test_id
}
