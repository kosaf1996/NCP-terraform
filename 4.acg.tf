resource "ncloud_access_control_group" "acg" {
    for_each = var.acg
        name        = each.value["name"]
        vpc_no      = ncloud_vpc.vpc[each.value["vpc"]].vpc_no
}
