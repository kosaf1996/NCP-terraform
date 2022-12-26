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
##          Main          ##
############################

##access_Key
variable access_key { 
    default = "access_key "
}

##secret_key
variable secret_key {
    default = "secret_key"
}

##regin
## NCP Type
# KR 일반
# KR 공공
# FKR 금융 
variable region {
    default = "KR"
}

##NCP 
## NCP Type
# pub 일반
# gov 공공
# fin 금융 

variable site {
    default = "pub"
}

##platform 
variable support_vpc {
    default = "true" #VPC
    #default = "false" #Classic
}

############################
##          VPC           ##
############################

variable vpc {
    type = map(any)
    default = {
        gm-vpc1 = { #vpc1
            name = "gm-vpc1"
            cidr = "10.0.0.0/16"
        }
        gm-vpc2 = { #vpc2
            name = "gm-vpc2"
            cidr = "10.0.0.0/16"
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
            vpc = "gm-vpc1"   #vpc의 키값을 입력 
            name = "vpc1-nacl1"
        }
        vpc2-nacl2 = { #nacl2
            vpc = "gm-vpc2"
            name = "vpc2-nacl2"
        }
    }
}

############################
##          ACG           ##
############################
variable acg {
    type = map(any)
    default = {
        vpc1-acg-pub = { #
            vpc = "gm-vpc1"   #vpc의 키값을 입력 
            name = "vpc1-acg-pub"
        }
        vpc1-acg-pri = { 
            vpc = "gm-vpc1"   #vpc의 키값을 입력 
            name = "vpc1-acg-pri"
        }
        vpc1-acg-db = { 
            vpc = "gm-vpc1"   #vpc의 키값을 입력 
            name = "vpc1-acg-db"
        }




        vpc2-acg-pub = { 
            vpc = "gm-vpc2"   #vpc의 키값을 입력 
            name = "vpc2-acg-pub"
        }
        vpc2-acg-pri = { 
            vpc = "gm-vpc2"   #vpc의 키값을 입력 
            name = "vpc2-acg-pri"
        }
        vpc2-acg-db = { 
            vpc = "gm-vpc2"   #vpc의 키값을 입력 
            name = "vpc2-acg-db"
        }
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



        vpc2-pub-subnet = { 
            vpc = "gm-vpc2"
            subnet = "10.0.1.0/24"
            zone = "KR-2"
            nacl = "vpc2-nacl2" 
            subnet_type = "PUBLIC"
            name = "vpc2-pub-subnet"
            usage_type = "GEN"
        }
        vpc2-pri-subnet = { 
            vpc = "gm-vpc2"
            subnet = "10.0.2.0/24"
            zone = "KR-2"
            nacl = "vpc2-nacl2" 
            subnet_type = "PRIVATE"
            name = "vpc2-pri-subnet"
            usage_type = "GEN"
        }
        vpc2-db-subnet = { 
            vpc = "gm-vpc2"
            subnet = "10.0.3.0/24"
            zone = "KR-2"
            nacl = "vpc2-nacl2" 
            subnet_type = "PRIVATE"
            name = "vpc2-db-subnet"
            usage_type = "GEN"
        }
    }
}
############################
##          Key           ##
############################

##키 생성후 실행경로에 .pem 파일 생성됩니다. 
variable key-name { 
    default = "test-key"
}
############################
##    Network-Interface   ##
############################
##private-ip
variable privateip {
    type = map(any)
    default = {
        privateip1 = { 
            name = "privateip1"
            subnet = "vpc1-pub-subnet"
            private_ip = "10.0.1.6"
            acg = "vpc1-acg-pub"
        }
        privateip2 = { 
            name = "privateip2"
            subnet = "vpc2-pub-subnet"
            private_ip = "10.0.1.6"
            acg = "vpc2-acg-pub"
        }
    }
}
############################
##        Server          ##
############################
## 서버이미지 코드 확인경로
# https://github.com/NaverCloudPlatform/terraform-ncloud-docs/blob/main/docs/server_image_product.md

#TODO 
#작성일 : 20221226
#network_interface 3개 까지 등록가능하도록 수정 필요

variable server {
    type = map(any)
    default = {
        server1 = { 
            subnet = "vpc1-pub-subnet"    
            name = "server1"
            server-image = "SW.VSVR.OS.LNX64.CNTOS.0708.B050"      #Server Image
            server-spec = "SVR.VSVR.HICPU.C004.M008.NET.SSD.B050.G002" #Server Spec
            login_key_name = "test"
            is_protect_server_termination = "false" #반납 보호  true or false
            fee_system_type_code = "MTRAT"  #시간요금 : MTRAT #월 요금 :FXSUM
            zone = "KR-2" # KR1, KR2
            network_interface_no = "privateip1"
        }
        server2 = { 
            subnet = "vpc2-pub-subnet"   #
            name = "server2"
            server-image = "SW.VSVR.OS.LNX64.CNTOS.0708.B050"
            server-spec = "SVR.VSVR.HICPU.C004.M008.NET.SSD.B050.G002"
            login_key_name = "test"
            is_protect_server_termination = "false" #반납 보호 
            fee_system_type_code = "MTRAT"  #시간요금 : MTRAT #월 요금 :FXSUM
            zone = "KR-2" # KR-1, KR-2
            network_interface_no = "privateip2"
        }
    }
}

############################
##      Block Storage     ##
############################
variable blockstorage {
    type = map(any)
    default = {
        block1 = { 
            size = "10" #Disk Size
            server = "server1" #할당 서버 네임 
            name = "block1" #Storage Name
            disk_detail_type = "SSD" #Disk Type SSD, HDD
        }
        block2 = { 
            size = "10" #Disk Size
            server = "server2" #할당 서버 네임 
            name = "block2" #Storage Name
            disk_detail_type = "HDD" #Disk Type SSD, HDD
        }
    }
}

############################
##       PublicIP         ##
############################
variable publicip {
    type = map(any)
    default = {
        server1 = { 
            server = "server1"
        }
        server2 = { 
            server = "server2"
        }
    }
}