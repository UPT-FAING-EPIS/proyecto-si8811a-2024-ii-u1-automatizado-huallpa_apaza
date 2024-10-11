terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 1.28.0"
    }
  }
}

resource "grafana_cloud_stack" "my_stack" {
  name        = "hc2020067571"
  slug        = "hc2020067571"
  region_slug = "us"
}