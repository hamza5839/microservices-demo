output "namespace_name" {
  description = "Name of the platform namespace"
  value       = kubernetes_namespace_v1.platform.metadata[0].name
}