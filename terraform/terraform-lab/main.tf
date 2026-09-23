module "namespace" {
  source = "./modules/namespace"

  name = var.namespace_name
}

module "monitoring_namespace" {
  source = "./modules/namespace"

  name = "terraform-monitoring"
}

module "app_config" {
  source = "./modules/config-map"

  name      = "app-config"
  namespace = module.namespace.name

  data = {
    environment = "lab"
    managed_by  = "terraform"
  }
}

moved {
  from = kubernetes_namespace.terraform_lab
  to   = module.namespace.kubernetes_namespace.this
}

moved {
  from = kubernetes_config_map.app_config
  to   = module.app_config.kubernetes_config_map.this
}

resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  namespace  = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.15.1"

  values = [
    yamlencode({
      controller = {
        metrics = {
          enabled = true

          service = {
            enabled     = true
            servicePort = 10254
          }

          serviceMonitor = {
            enabled   = true
            namespace = "monitoring"

            additionalLabels = {
              release = "monitoring"
            }
          }
        }
      }
    })
  ]
}