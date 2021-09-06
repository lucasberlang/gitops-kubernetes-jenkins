
resource "kubernetes_namespace" "jenkins" {
  metadata {
    name = "gitops"
  }
}

data "local_file" "helm_chart_values" {
  filename = "${path.module}/templates/jenkins.yaml"
}

resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"
  version    = "3.5.3"
  namespace  = kubernetes_namespace.jenkins.metadata.0.name
  timeout    = 180

  values = [data.local_file.helm_chart_values.content]

}