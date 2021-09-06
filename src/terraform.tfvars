
description = "GKE Test Network"

ip_range_pods = "192.168.0.0/18"

ip_range_services = "192.168.64.0/18"

istio = false

dns_cache = false

location = "global"

labels = {
  "region"             = "euw2",
  "company"            = "bk",
  "account"            = "sca",
  "project_or_service" = "terraform",
  "application"        = "",
  "resource_type"      = "",
  "resource_name"      = "",
  "environment"        = "pocs",
  "responsible"        = "",
  "confidentiality"    = "false",
  "encryption"         = "false",
  "os"                 = "",
  "role"               = "",
  "cmdb_id"            = "",
  "cmdb_name"          = "",
}
