output "namespace_name" {
  description = "Name of the Kubernetes namespace managed by Terraform"
  value       = module.namespace.name
}