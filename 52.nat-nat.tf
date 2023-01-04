resource "ncloud_nat_gateway" "nat_gateway" {
  for_each = var.nat
    vpc_no      = ncloud_vpc.vpc[each.value["vpc"]].id
    zone        = each.value["zone"]
    name        = each.value["name"]
}
