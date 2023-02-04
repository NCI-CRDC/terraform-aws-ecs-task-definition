variable "app" {
  type        = string
  description = "the name of the application expressed as an acronym"
  sensitive   = false
}

variable "env" {
  type        = string
  description = "the target tier ('dev', 'qa', 'stage', or 'prod'.)"
  sensitive   = false

  validation {
    condition     = contains(["dev", "qa", "stage", "prod", "nonprod"], var.env)
    error_message = "valid values are 'dev', 'qa', 'stage', 'prod', and 'nonprod'"
  }
}

variable "program" {
  type        = string
  description = "the program associated with the application"
  sensitive   = false

  validation {
    condition     = contains(["crdc", "ccdi", "ctos"], var.program)
    error_message = "valid values for program are 'crdc', 'ccdi', and 'ctos'"
  }
}

variable "cpu" {
  type        = number
  description = ""
}

variable "execution_role_arn" {
  type        = string
  description = ""
}

variable "memory" {
  type        = number
  description = ""
}

variable "network_mode" {
  type        = string
  description = ""
  default     = "awsvpc"
}

variable "requires_compatibilities" {
  type        = set(string)
  description = ""
  default     = ["FARGATE"]
}

variable "resource_name_suffix" {
  type = string
}

variable "task_role_arn" {
  type        = string
  description = ""
}