resource "ncloud_route" "nat-route" {
  for_each = var.nat-route
    route_table_no         = ncloud_route_table.route_table[each.value["route_table"]].id
    destination_cidr_block = each.value["nat-route-des"]
    target_type            = each.value["nat-target_type"]
    target_name            = ncloud_nat_gateway.nat_gateway[each.value["name"]].name
    target_no              = ncloud_nat_gateway.nat_gateway[each.value["name"]].id
}
