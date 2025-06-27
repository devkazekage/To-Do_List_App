resource "kubernetes_namespace" "flask" {
  metadata {
    name = "flask-app"
  }
}

resource "helm_release" "flask" {
  name             = "flask"
  chart            = "./helm-chart"
  namespace        = kubernetes_namespace.flask.metadata[0].name
  create_namespace = false
}