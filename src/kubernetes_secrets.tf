
resource "kubernetes_secret" "jenkins-secrets" {
  metadata {
    name      = "jenkins-k8s-config"
    namespace = kubernetes_namespace.jenkins.metadata.0.name
  }
  data = {
    kubernetes_endpoint = module.gke.endpoint
  }
}

resource "kubernetes_secret" "gitlab-secrets" {
  metadata {
    name      = "gitlab-credentials"
    namespace = kubernetes_namespace.jenkins.metadata.0.name
  }
  data = {
    gitlab_username = var.ssh_username
    gitlab_ssh_key  = var.ssh_private_key
  }
}

resource "kubernetes_secret" "vault-secrets" {
  metadata {
    name      = "vault-credentials"
    namespace = kubernetes_namespace.jenkins.metadata.0.name
  }
  data = {
    vault_token = var.vault_token
    vault_addr  = var.vault_addr
  }
}

resource "kubernetes_secret" "azure-secrets" {
  metadata {
    name      = "azure-credentials"
    namespace = kubernetes_namespace.jenkins.metadata.0.name
  }
  data = {
    arm_access_key = var.arm_acces_key
  }
}

resource "kubernetes_secret" "slack-secrets" {
  metadata {
    name      = "slack-credentials"
    namespace = kubernetes_namespace.jenkins.metadata.0.name
  }
  data = {
    slack_token = var.slack_token
    team_domain = var.team_domain
  }
}

resource "kubernetes_secret" "grafana-secrets" {
  metadata {
    name      = "grafana-credentials"
    namespace = kubernetes_namespace.monitoring.metadata.0.name
  }
  data = {
    adminUser     = var.user_grafana
    adminPassword = var.password_grafana
  }
}