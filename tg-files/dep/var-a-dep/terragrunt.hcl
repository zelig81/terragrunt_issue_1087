terraform {
  source = "github.com/zelig81/terragrunt_issue_1087.git//tf-modules/ssm-test-dep"
}

prevent_destroy = true

# locals {
#   env_vars    = jsondecode(file(find_in_parent_folders("environment.tfvars.json")))
#   common_vars = jsondecode(file(find_in_parent_folders("commons.tfvars.json")))
# }

include {
  path = find_in_parent_folders()
}

inputs = {
  var_name = path_relative_to_include()
}
