resource "ncloud_subnet" "subnet" {
    for_each = var.subnet
        vpc_no         = ncloud_vpc.vpc[each.value["vpc"]].vpc_no
        subnet         = each.value["subnet"]
        zone           = each.value["zone"]
        network_acl_no = ncloud_network_acl.nacl[each.value["nacl"]].id
        subnet_type    = each.value["subnet_type"]
        name           = each.value["name"]
        usage_type     = each.value["usage_type"]
}

