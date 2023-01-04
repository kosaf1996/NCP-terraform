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
##          VPC           ##
############################

variable vpc {
    type = map(any)
    default = {
        gm-vpc1 = { #vpc1
            name = "gm-vpc1" #VPC NAME
            cidr = "10.0.0.0/16" #VPC CIDR
        }
    }
}
############################
##         NACL           ##
############################

variable nacl {
    type = map(any)
    default = {
        vpc1-nacl1 = { #nacl1
            vpc = "gm-vpc1" #VPC NAME
            name = "vpc1-nacl1" #NACL NAME
        }
        # vpc1-nacl2 = { #nacl1
        #     vpc = "gm-vpc1"
        #     name = "vpc1-nacl1"
        # }
    }
}

############################
##        Subnet          ##
############################

## Subnet Type
# PRIVATE
# PUBLIC

##usage_type
#GEN 일반
#LOADB 로드밸런서

variable subnet {
    type = map(any)
    default = {
        vpc1-lb-subnet = { 
            vpc = "gm-vpc1" #VPC NAME
            subnet = "10.0.250.0/24" #SUBNET CIDR
            zone = "KR-2" #ZONE
            nacl = "vpc1-nacl1" #NACL 
            subnet_type = "PRIVATE" #TYPE
            name = "vpc1-lb-subnet" #NAME
            usage_type = "LOADB" #사용 용도
        }
        vpc1-pub-subnet = { 
            vpc = "gm-vpc1"
            subnet = "10.0.1.0/24"
            zone = "KR-2"
            nacl = "vpc1-nacl1" 
            subnet_type = "PUBLIC"
            name = "vpc1-pub-subnet"
            usage_type = "GEN"
        }
        vpc1-pri-subnet = { 
            vpc = "gm-vpc1"
            subnet = "10.0.2.0/24"
            zone = "KR-2"
            nacl = "vpc1-nacl1" 
            subnet_type = "PRIVATE"
            name = "vpc1-pri-subnet"
            usage_type = "GEN"
        }
        vpc1-db-subnet = { 
            vpc = "gm-vpc1"
            subnet = "10.0.3.0/24"
            zone = "KR-2"
            nacl = "vpc1-nacl1" 
            subnet_type = "PRIVATE"
            name = "vpc1-db-subnet"
            usage_type = "GEN"
        }
    }
}
