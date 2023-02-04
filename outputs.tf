output "arn" {
  value = aws_ecs_task_definition.this.arn
}

output "family" {
  value = aws_ecs_task_definition.this.family
}

output "id" {
  value = aws_ecs_task_definition.this.id
}

output "revision" {
  value = aws_ecs_task_definition.this.revision
}
