provider "aws" {
  region = "us-east-1" # Change as needed
}

resource "aws_ecs_cluster" "example" {
  name = "my-ecs-cluster"
}
