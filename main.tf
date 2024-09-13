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

#resource "tfe_organization" "example" {
#  name  = "TCS_BG"  # Replace with your organization name
#  email = "omkar.singh1@tcs.com"  # Replace with your organization email
#}

resource "tfe_workspace" "example" {
   name         = "example-workspace"
   organization = "TCS_BG"
  # execution_mode = "remote"
  # vcs_repo {
  #  identifier     = "your-vcs-repo/your-repo-name"  # Replace with your VCS repo path
  #  branch         = "main"  # Replace with the branch name
  #  oauth_token_id = var.oauth_token_id  # OAuth token for connecting VCS
  # }
 }

resource "tfe_policy_set" "example" {
  name         = "example-policy-set"
  # organization = tfe_organization.example.name
  
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
