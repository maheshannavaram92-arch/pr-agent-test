provider "atlassian-operations" {
  cloud_id      = var.site_id
  domain_name   = var.domain_name
  email_address = var.atlassian_email
  token         = var.atlassian_token
}

module "jsm_team" {
  source = "git@github.com:elsevier-centraltechnology/sre-techx-golden-signals-jsm-poc.git//modules/jsm-team"

  organization_id = var.organization_id
  site_id         = var.site_id
  display_name    = var.display_name
  description     = var.description
  team_type       = var.team_type
  members         = var.members
  member_emails   = var.member_emails
  domain_name     = var.domain_name
  atlassian_email = var.atlassian_email
  atlassian_token = var.atlassian_token
}
