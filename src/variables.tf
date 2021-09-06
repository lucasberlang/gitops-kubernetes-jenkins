
variable "region" {
  description = "fixture"
  type        = string
  default     = "europe-west1"
}

######
# Vars
######

variable "description" {
  description = "fixture"
  type        = string
}

variable "ip_range_pods" {
  description = "fixture"
  type        = string
}

variable "ip_range_services" {
  description = "fixture"
  type        = string
}

variable "istio" {
  description = "fixture"
  type        = bool
}

variable "dns_cache" {
  description = "fixture"
  type        = bool
}

variable "location" {
  description = "fixture"
  type        = string
}

######
# VAR_ENV
######

variable "project_id" {
  description = "fixture"
  type        = string
}

variable "ssh_username" {
  description = "fixture"
  type        = string
}

variable "ssh_private_key" {
  description = "fixture"
  type        = string
}

variable "vault_addr" {
  description = "fixture"
  type        = string
}

variable "vault_token" {
  description = "fixture"
  type        = string
}

variable "arm_acces_key" {
  description = "fixture"
  type        = string
}

variable "slack_api_url" {
  description = "fixture"
  type        = string
}

variable "slack_channel" {
  description = "fixture"
  type        = string
}

variable "slack_token" {
  description = "fixture"
  type        = string
}

variable "team_domain" {
  description = "fixture"
  type        = string
}

variable "user_grafana" {
  description = "fixture"
  type        = string
}

variable "password_grafana" {
  description = "fixture"
  type        = string
}

######
# Tags
######

variable "labels" {
  description = "fixture"
  type        = map(string)
}
