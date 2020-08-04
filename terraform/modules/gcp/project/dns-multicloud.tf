module "dns-multicloud" {
  source = "../../../third-party/modules/dns_multicloud"
  namespace = var.environment
  hosted-zone = var.dns_hosted_zone
  cf_zoneid = var.dns_cf_zoneid
  create_gcp_dns_zone = true
  gcp_project = var.project_id
  gcp_region = var.region
}
