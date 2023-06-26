resource "yandex_vpc_security_group" "sg" {
  name       = var.name
  network_id = var.network_id
  description = var.description

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      protocol           = lookup(ingress.value, "protocol", "ANY")
      v4_cidr_blocks     = lookup(ingress.value, "v4_cidr_blocks", null)
      port               = lookup(ingress.value, "port", null)
      from_port          = lookup(ingress.value, "from_port", null)
      to_port            = lookup(ingress.value, "to_port", null)
      labels             = lookup(ingress.value, "labels", null)
      description        = lookup(ingress.value, "description", null)
      security_group_id  = lookup(ingress.value, "security_group_id", null)
      predefined_target  = lookup(ingress.value, "predefined_target", null)
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      protocol           = lookup(egress.value, "protocol", "ANY")
      v4_cidr_blocks     = lookup(egress.value, "v4_cidr_blocks", null)
      port               = lookup(egress.value, "port", null)
      from_port          = lookup(egress.value, "from_port", null)
      to_port            = lookup(egress.value, "to_port", null)
      labels             = lookup(egress.value, "labels", null)
      description        = lookup(egress.value, "description", null)
      security_group_id  = lookup(egress.value, "security_group_id", null)
      predefined_target  = lookup(egress.value, "predefined_target", null)
    }
  }
}
