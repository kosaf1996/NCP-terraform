resource "ncloud_network_interface" "nic" {
    for_each = var.privateip
        name                  = each.value["name"]
        subnet_no             = ncloud_subnet.subnet[each.value["subnet"]].id
        private_ip            = each.value["private_ip"]
        access_control_groups = [ncloud_access_control_group.acg[each.value["acg"]].id]
        
}
