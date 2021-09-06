
provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source = "git@github.com:lucasberlang/gcp-network.git"

  project_id         = var.project_id
  description        = var.description
  enable_nat_gateway = true

  intra_subnets = [
    {
      subnet_name           = "private-subnet01"
      subnet_ip_cidr        = "10.0.0.0/16"
      subnet_private_access = false
      subnet_region         = var.region
    }
  ]

  secondary_ranges = {
    private-subnet01 = [
      {
        range_name    = "private-subnet01-01"
        ip_cidr_range = var.ip_range_pods
      },
      {
        range_name    = "private-subnet01-02"
        ip_cidr_range = var.ip_range_services
      },
    ]
  }

  labels = var.labels
}

module "gke" {
  source = "git@github.com:lucasberlang/gcp-gke.git"

  project_id              = var.project_id
  name                    = "gitops"
  regional                = true
  region                  = var.region
  network                 = module.network.network_name
  subnetwork              = module.network.intra_subnet_names.0
  ip_range_pods           = "private-subnet01-01"
  ip_range_services       = "private-subnet01-02"
  enable_private_endpoint = false
  enable_private_nodes    = false
  master_ipv4_cidr_block  = "172.16.0.0/28"
  kubernetes_version      = "latest"

  master_authorized_networks = [
    {
      cidr_block   = module.network.intra_subnet_ips.0
      display_name = "VPC"
    },
    {
      cidr_block   = "0.0.0.0/0"
      display_name = "shell"
    }
  ]

  node_pools = [
    {
      name         = "default-node-pool"
      machine_type = "n1-standard-4"
    },
  ]

  istio     = var.istio
  dns_cache = var.dns_cache
  labels    = var.labels
}