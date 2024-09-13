terraform {
  cloud {
    organization = "TCS_BG"
    workspaces {
      name = "terraform_cloud_workspace_sentinel"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
  token    = var.tfe_token
}

data "tfe_organization" "example" {
    name = var.organization_name
  
}

# Project Creation via code
resource "tfe_project" "example" {
  name =  "TCS_Test"
  organization = var.organization_name
}

# Workspace Creation via code 
resource "tfe_workspace" "example" {
   name         = "example-workspace"
   organization = var.organization_name  
 }

resource "tfe_policy_set" "example" {
  name         = "example-policy-set"
  organization = var.organization_name
  
  # Associate the policy set with the workspace
  workspace_ids = [
    tfe_workspace.example.id
  ]
}
# resource "tfe_policy_set" "example" {
#  name         = "example-policy-set"
#  organization = tfe_organization.example.name

#  policies = [
#    {
#      name    = "enforce-workspace-name"
#      source  = file("${terraform_sentinel_repos}/enforce-workspace-name.sentinel")
#    }
#  ]

  # Link the policy set to the workspace created above
  #workspace_ids = [
  #  tfe_workspace.example.id
  #]
# }
