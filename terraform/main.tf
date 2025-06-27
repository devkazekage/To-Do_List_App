resource "kubernetes_namespace" "todo-app" {
  metadata {
    name = "todo-app"
  }
}

resource "helm_release" "flask" {
  name             = "flask"
  chart            = "../helm-chart"
  namespace        = kubernetes_namespace.todo-app.metadata[0].name
  create_namespace = false
}