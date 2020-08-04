terraform {
  source = "../../..//modules/kubernetes/"
}

include {
  path = find_in_parent_folders()
}

dependency "gcp-k8s-cluster" {
  config_path = "../gcp/k8s-cluster"
}

# We use our argocd cluster also as a management cluster with ArgoCD
dependency "kubernetes-argocd" {
  config_path = "../../argocd/kubernetes"
}

inputs = {
  environment            = "dev"
  region                 = dependency.gcp-k8s-cluster.outputs.region
  zones                  = dependency.gcp-k8s-cluster.outputs.zones
  cluster                = dependency.gcp-k8s-cluster.outputs.cluster
  endpoint               = dependency.gcp-k8s-cluster.outputs.endpoint
  management_context     = dependency.kubernetes-argocd.outputs.context
  argo_rollouts_install  = true
  argocd_manager_install = true
}
