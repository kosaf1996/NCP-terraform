resource "ncloud_route_table" "route_table" {
    for_each = var.route-table
        vpc_no = ncloud_vpc.vpc[each.value["vpc"]].id  
        name = each.value["name"]
        supported_subnet_type = each.value["supported_subnet_type"]
}