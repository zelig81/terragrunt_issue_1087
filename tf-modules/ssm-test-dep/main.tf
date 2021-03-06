terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "local" {}
  required_version = ">= 0.12.23"
}

provider "aws" {
  version = "~> 2.53.0"
  region = "us-east-1"
}

variable var_name {}

resource "aws_ssm_parameter" "this" {
  name        = "/test/terragrunt_issue_1087/${var.var_name}"
  type        = "SecureString"
  value       = uuid()
}

output var_value {
  value = aws_ssm_parameter.this.value
}
