resource "ncloud_server" "server" {
    for_each = var.server
        subnet_no                 = ncloud_subnet.subnet[each.value["subnet"]].id
        name                      = each.value["name"]
        server_image_product_code = each.value["server-image"]
        server_product_code = each.value["server-spec"]
        login_key_name            = var.key-name
        is_protect_server_termination = each.value["is_protect_server_termination"]
        fee_system_type_code = each.value["fee_system_type_code"] #시간요금 
        zone = each.value["zone"]
        network_interface {
            order =  0
            network_interface_no = ncloud_network_interface.nic[each.value["network_interface_no"]].id
        }

}