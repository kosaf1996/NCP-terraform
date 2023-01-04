# resource "ncloud_block_storage" "storage" {
#     for_each = var.blockstorage
#         server_instance_no = ncloud_server.server[each.value["server"]].id
#         name = each.value["name"]
#         size = each.value["size"]
#         disk_detail_type = each.value["disk_detail_type"]
# }
