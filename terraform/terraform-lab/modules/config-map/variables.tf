variable "name" {
  description = "Name of the Kubernetes ConfigMap"
  type        = string
}

variable "namespace" {
  description = "Namespace where the ConfigMap will be created"
  type        = string
}

variable "data" {
  description = "Key-value data stored in the ConfigMap"
  type        = map(string)
}