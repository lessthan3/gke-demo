terraform {
  source = "../../../..//modules/gcp/k8s-cluster/"
}

include {
  path = find_in_parent_folders()
}

dependency "gcp-project" {
  config_path = "../../../common/gcp/project"
}

inputs = {
  environment              = "staging"
  master_cidr              = "172.16.0.16/28"
  subnet_primary_ip_range  = "172.21.0.0/20"
  subnet_services_ip_range = "172.21.16.0/20"
  subnet_pods_ip_range     = "10.12.0.0/14"
  region                   = "us-central1"
  zones                    = ["us-central1-a"]
  machine_type             = "n1-standard-2"
  max_nodes                = 3
  terraform_sa_fqdn        = dependency.gcp-project.outputs.terraform_sa_fqdn
  dns_hosted_zone          = "maestro.io"
  dns_cf_zoneid            = "XXXX"
}
