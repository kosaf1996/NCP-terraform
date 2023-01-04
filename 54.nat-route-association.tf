resource "ncloud_route_table_association" "route_table_subnet" {
    for_each = var.nat-association
        route_table_no        = ncloud_route_table.route_table[each.value["name"]].id
        subnet_no             = ncloud_subnet.subnet[each.value["subnet"]].id
}
