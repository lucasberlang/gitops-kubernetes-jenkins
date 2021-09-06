
data "google_client_config" "default" {
  provider = google-beta
}

terraform {
  required_version = ">= 0.13"
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.2.0"
    }
    kubernetes = "~> 2.3.2"
  }
}

provider "kubernetes" {
  host                   = module.gke.endpoint
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = module.gke.endpoint
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(module.gke.ca_certificate)
  }
}
