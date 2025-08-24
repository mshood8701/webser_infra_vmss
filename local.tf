locals {
  tags = {
    modified_on = formatdate("YYYY_MM_DD", timestamp())

  }

}

locals {
  dynamic_tags = merge(var.tags, {
    modified_on = formatdate("YYYY_MM_DD", timestamp())
  })
}


locals {
  vm_sizes = {
    dev     = "Standard_B1ms"
    staging = "Standard_B2s"
    prod    = "Standard_B2ms"
  }
  vm_size = local.vm_sizes[var.env]


  # NSG rules mapped with dynamic block in mind
  nsg_rules_map = { for r in var.nsg_rules : r.name => r }
}

locals {
  prefix      = lower("${var.env}-${var.resource_group_name}")
  subnet_cidr = "${element(var.network_config, 1)}/${element(var.network_config, 2)}"

}


