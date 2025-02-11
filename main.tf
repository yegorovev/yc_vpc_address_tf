terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

locals {
  ext_ip4 = var.external_ipv4_address == null ? [] : [var.external_ipv4_address] 
}

resource "yandex_vpc_address" "addr" {
  name  = var.name

  dynamic "external_ipv4_address" {
    for_each = local.ext_ip4
    content {
      zone_id = var.external_ipv4_address.zone_id 
    }
  }
}
