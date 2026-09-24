module "platform" {
  source = "../../modules/platform"

  namespace_name = var.namespace_name
  environment    = var.environment
}

moved {
  from = kubernetes_namespace_v1.platform
  to   = module.platform.kubernetes_namespace_v1.platform
}

moved {
  from = kubernetes_config_map_v1.platform_config
  to   = module.platform.kubernetes_config_map_v1.platform_config
}