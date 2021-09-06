
resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

data "local_file" "helm_chart_grafana" {
  filename = "${path.module}/templates/grafana.yaml"
}

data "template_file" "file" {
  template = "${file("${path.module}/templates/prometheus.yaml")}"
  vars = {
    slack_api_url = "${var.slack_api_url}"
    slack_channel = "${var.slack_channel}"
  }
}

resource "helm_release" "prometheus" {
  chart      = "prometheus"
  name       = "prometheus"
  namespace  = kubernetes_namespace.monitoring.metadata.0.name
  repository = "https://charts.helm.sh/stable"

  values = [data.template_file.file.rendered]
}

resource "helm_release" "grafana" {
  chart      = "grafana"
  name       = "grafana"
  namespace  = kubernetes_namespace.monitoring.metadata.0.name
  repository = "https://charts.helm.sh/stable"

  values = [data.local_file.helm_chart_grafana.content]
}

data "kubernetes_service" "grafana" {
  depends_on = [
    helm_release.grafana
  ]

  metadata {
    namespace = helm_release.grafana.namespace
    name      = "grafana"
  }
}

data "kubernetes_service" "prometheus" {
  depends_on = [
    helm_release.prometheus
  ]

  metadata {
    namespace = helm_release.prometheus.namespace
    name      = "prometheus-server"
  }
}