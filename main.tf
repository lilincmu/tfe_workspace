variable "organization" {} ## Your TFC Organization
variable "terraform_version" {} ## TFC version you would like to use(example: 0.12.26)
variable "vcs_oauth_token_id" {} ## Your VCS Oauth token
variable "vcs_repoorg" {}  ## Your VCS organization, where `different-repo` get forked
variable "hostname" {}  ## Your TFE host name

module "my_new_workspace" {

  source = "./modules/workspace"

  organization = var.organization
  
  vcs_repoorg = var.vcs_repoorg

  vcs_reponame = "different-repo"

  vcs_working_directory = "test"

  vcs_oauth_token_id = var.vcs_oauth_token_id

  terraform_version = var.terraform_version

  environments = ["dev", "test"]

  trigger_prefixes = ["./module"]

}

provider "tfe" {
  hostname = var.hostname # Optional, defaults to Terraform Cloud `app.terraform.io`
}
