############################################################
## 주의 사항                                              ##
## - 현재의 코드는 VPC 환경을 지원하고 있습니다.           ##
## - 변수값 외 다른 코드는 수정하지 마시길 바랍니다.        ##
## - 변수값으로 모든 리소스 배포 가능하도록 구성하였습니다. ##
## - 제작자 : 구경민                                      ##
## - 제작일 : 2022-12-24                                  ##
## - 무단 배포 금지                                       ##
## - Version : 1.0.0                                     ##
############################################################
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