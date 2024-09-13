variable "tfe_token" {
    description = "Terraform Cloud API Token"
    type        = string
    sensitive   = true 
}

variable "organization_name" {
    description = "Existing TFC Organization name"
    type        = string
  
}

variable "project_name" {
    description = "The name of the new Project"
    type        = string  
}