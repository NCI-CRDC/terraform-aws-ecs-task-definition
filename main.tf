resource "aws_ecs_task_definition" "this" {
  for_each = var.task_definition_template

  family                   = "${local.stack}-${each.value.task_name}"
  requires_compatibilities = var.requires_compatibilities
  network_mode             = var.network_mode
  cpu                      = each.value.cpu
  memory                   = each.value.memory
  execution_role_arn       = each.value.execution_role_arn
  task_role_arn            = each.value.task_role_arn

  runtime_platform {
    operating_system_family = var.operating_system_family
  }

  container_definitions = jsonencode([
    {
      name      = "${local.stack}-${each.value.task_name}"
      image     = each.value.image
      essential = each.value.essential
      portMappings = [{
        protocol      = var.protocol
        containerPort = var.container_port
        hostPort      = var.container_port
      }]
    }
  ])
}
