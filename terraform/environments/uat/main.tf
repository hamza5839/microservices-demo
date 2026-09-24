module "platform" {
  source = "../../modules/platform"

  namespace_name = var.namespace_name
  environment    = var.environment
}
