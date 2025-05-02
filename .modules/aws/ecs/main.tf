provider "aws" {
  region = var.aws_region
}

resource "aws_ecs_cluster" "this" {
  name = var.ecs_cluster_name

  capacity_providers = var.capacity_providers

  default_capacity_provider_strategy {
    capacity_provider = var.default_capacity_provider
    weight            = 1
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
