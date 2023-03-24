############################
##         CIDR           ##
############################

#Public Subnet  
resource "ncloud_access_control_group_rule" "cidr-pub" {
    access_control_group_no = ncloud_access_control_group.acg["vpc1-acg-pub"].id    

    dynamic "inbound" {
        for_each = local.vpc1-pub-subnet-inbound
            content {
                protocol    = inbound.value[0]
                ip_block    = inbound.value[1]
                port_range  = inbound.value[2]
                description = inbound.value[3]
            }
     }

    dynamic "outbound" {
        for_each = local.vpc1-pub-subnet-outbound 
            content {
                protocol    = outbound.value[0]
                ip_block    = outbound.value[1]
                port_range  = outbound.value[2]
                description = outbound.value[3]
            }
     }
}

#Private Subnet  
resource "ncloud_access_control_group_rule" "cidr-pri" {
    access_control_group_no = ncloud_access_control_group.acg["vpc1-acg-pri"].id
    
    dynamic "inbound" {
        for_each = local.vpc1-pri-subnet-inbound 
            content {
                protocol    = inbound.value[0]
                ip_block    = inbound.value[1]
                port_range  = inbound.value[2]
                description = inbound.value[3]
            }
     }

    dynamic "outbound" {
        for_each = local.vpc1-pri-subnet-outbound 
            content {
                protocol    = outbound.value[0]
                ip_block    = outbound.value[1]
                port_range  = outbound.value[2]
                description = outbound.value[3]
            }
     }
}


#DB Subnet  
resource "ncloud_access_control_group_rule" "cidr-db" {
    access_control_group_no = ncloud_access_control_group.acg["vpc1-acg-db"].id
    
    dynamic "inbound" {
        for_each = local.vpc1-db-subnet-inbound 
            content {
                protocol    = inbound.value[0]
                ip_block    = inbound.value[1]
                port_range  = inbound.value[2]
                description = inbound.value[3]
            }
     }

    dynamic "outbound" {
        for_each = local.vpc1-db-subnet-outbound 
            content {
                protocol    = outbound.value[0]
                ip_block    = outbound.value[1]
                port_range  = outbound.value[2]
                description = outbound.value[3]
            }
     }
}




# ############################
# ##         ACG           ##
# ############################

# #Public Subnet  
# resource "ncloud_access_control_group_rule" "acg-pub" {
#     access_control_group_no = ncloud_access_control_group.acg["vpc1-acg-pub"].id    

#     dynamic "inbound" {
#         for_each = local.vpc1-pub-subnet-inbound-acg
#             content {
#                 protocol    = inbound.value[0]
#                 source_access_control_group_no = ncloud_access_control_group.acg[inbound.value["1"]].id 
#                 port_range  = inbound.value[2]
#                 description = inbound.value[3]
#             }
#      }

#     dynamic "outbound" {
#         for_each = local.vpc1-pub-subnet-outbound-acg 
#             content {
#                 protocol    = outbound.value[0]
#                 source_access_control_group_no = ncloud_access_control_group.acg[outbound.value["1"]].id 
#                 port_range  = outbound.value[2]
#                 description = outbound.value[3]
#             }
#      }
# }

# #Private Subnet  
# resource "ncloud_access_control_group_rule" "acg-pri" {
#     access_control_group_no = ncloud_access_control_group.acg["vpc1-acg-pri"].id    

#     dynamic "inbound" {
#         for_each = local.vpc1-pri-subnet-inbound-acg
#             content {
#                 protocol    = inbound.value[0]
#                 source_access_control_group_no = ncloud_access_control_group.acg[inbound.value["1"]].id 
#                 port_range  = inbound.value[2]
#                 description = inbound.value[3]
#             }
#      }

#     dynamic "outbound" {
#         for_each = local.vpc1-pri-subnet-outbound-acg 
#             content {
#                 protocol    = outbound.value[0]
#                 source_access_control_group_no = ncloud_access_control_group.acg[outbound.value["1"]].id 
#                 port_range  = outbound.value[2]
#                 description = outbound.value[3]
#             }
#      }
# }
