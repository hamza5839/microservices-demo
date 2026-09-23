output "name" {
  description = "Name of the created Kubernetes namespace"
  value       = kubernetes_namespace.this.metadata[0].name
}