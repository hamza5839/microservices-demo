provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-online-boutique"
}

provider "helm" {
  kubernetes = {
    config_path    = "~/.kube/config"
    config_context = "kind-online-boutique"
  }
}