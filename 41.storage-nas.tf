# resource "ncloud_nas_volume" "nas" {
#     for_each = var.nas
#         volume_name_postfix            = each.value["name"]
#         volume_size                    = each.value["nas-size"]
#         volume_allotment_protocol_type = each.value["nas-protocol"]
# }