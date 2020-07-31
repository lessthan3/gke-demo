terraform {
  backend "gcs" {}
}

locals {
  cluster                       = "cluster-maestro-${var.environment}"
  net_name                      = "net-maestro-${var.environment}"
  subnet_name                   = "subnet-maestro-${var.environment}"
  subnet_pods_ip_range_name     = "ip-range-pods-${var.environment}"
  subnet_services_ip_range_name = "ip-range-services-${var.environment}"
}
