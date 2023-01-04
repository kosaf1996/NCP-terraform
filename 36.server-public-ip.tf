resource "ncloud_public_ip" "public_ip" {
    for_each = var.publicip
        server_instance_no = ncloud_server.server[each.value["server"]].id
}
