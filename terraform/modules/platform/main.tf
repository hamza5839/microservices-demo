resource "kubernetes_namespace_v1" "platform" {
  metadata {
    name = var.namespace_name

    labels = {
      environment = var.environment
    }
  }
}

resource "kubernetes_config_map_v1" "platform_config" {
  metadata {
    name      = "platform-config"
    namespace = kubernetes_namespace_v1.platform.metadata[0].name
  }

  data = {
    environment = var.environment
    managed_by  = "terraform"
  }
}