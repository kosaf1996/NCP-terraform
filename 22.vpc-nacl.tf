resource "ncloud_network_acl" "nacl" {
    for_each = var.nacl
        vpc_no      = ncloud_vpc.vpc[each.value["vpc"]].id
        name        = each.value["name"]
 }