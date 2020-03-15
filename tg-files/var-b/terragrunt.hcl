terraform {
  source = "github.com/zelig81/terragrunt_issue_1087.git//tf-modules/ssm-test"
}

prevent_destroy = true

# locals {
#   env_vars    = jsondecode(file(find_in_parent_folders("environment.tfvars.json")))
#   common_vars = jsondecode(file(find_in_parent_folders("commons.tfvars.json")))
# }

dependency dep {
  config_path = "${get_terragrunt_dir()}/../dep/${path_relative_to_include()}-dep"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  var_name = path_relative_to_include()
  var_value = "${path_relative_to_include()}-${dependency.dep.outputs.var_value}"
}
