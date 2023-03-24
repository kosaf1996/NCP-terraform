
############################
##      Route-Table       ##
############################

variable route-table {
    type = map(any)
    default = {
        gm-private-route-table = { 
            name = "gm-private-route-table" #ROUTE TABLE NAME
            vpc = "gm-vpc1" #VPC NAME
            supported_subnet_type = "PRIVATE"  #허용 값 : PUBLIC(공개) | PRIVATE
        }
        gm-public-route-table = { 
            name = "gm-public-route-table"
            vpc = "gm-vpc1"
            supported_subnet_type = "PUBLIC"  #허용 값 : PUBLIC(공개) | PRIVATE

        }
    }
}
############################
##          NAT           ##
############################

variable nat {
    type = map(any)
    default = {
        nat-gw = { 
            vpc = "gm-vpc1" #VPC NAME
            zone = "KR-2" #ZONE NAME
            name = "nat-gw" #NAT NAME
        }
    }
}
############################
##       NAT-Route        ##
############################
variable nat-route {
    type = map(any)
    default = {
        nat-gw = { 
            route_table = "gm-private-route-table" #ROUTE TABLE NAME
            nat-route-des = "0.0.0.0/0" #NAT CIDR
            nat-target_type = "NATGW" #NATGW (NAT Gateway) | VPCPEERING (VPC Peering) | VGW (Virtual Private Gateway).
            name = "nat-gw" #NAT NAME  
        }
    }
}

############################
##     NAT-association    ##
############################
variable nat-association {
    type = map(any)
    default = {
        subnet1 = { 
            name = "gm-private-route-table" 
            subnet = "vpc1-pri-subnet"
        }
        subnet2 = { 
            name = "gm-private-route-table" 
            subnet = "vpc1-db-subnet"
        }
    }
}
