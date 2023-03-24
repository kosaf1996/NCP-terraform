

############################
##          ACG           ##
############################
variable acg {
    type = map(any)
    default = {
        vpc1-acg-pub = { #
            vpc = "gm-vpc1" #VPC NAME
            name = "vpc1-acg-pub" #ACG NAME
        }
        vpc1-acg-pri = { 
            vpc = "gm-vpc1"
            name = "vpc1-acg-pri"
        }
        vpc1-acg-db = { 
            vpc = "gm-vpc1" 
            name = "vpc1-acg-db"
        }
    }
}

############################
##       ACG-Rule         ##
############################
##################################################################
## - ACG-Rule은 다른 리소스와 다르게 3.server-acg-rule.tf 파일에서##
## - Subnet별로 리소스를 생성해야한다.                            ##
##################################################################
###CIDR 로 지정시 
locals {

    ############################
    ##         CIDR           ##
    ############################
    #ACG RULE 은 다른 리소스와 다르게 서브넷당 하나의 Resource를 만들어 야한다.
    #32.server-acg-rule.tf 에서 설정 진행 
    #protocol, cidr, port, description 순으로 작성 
    #Public
  vpc1-pub-subnet-inbound = [
    ["TCP", "0.0.0.0/0", "80", "80 ALLOW"], #ACG RULE 
    ["TCP", "0.0.0.0/0", "443", "443 ALLOW"],
    ["TCP", "14.63.64.0/24", "22", "SSH ALLOW"],
  ]
  vpc1-pub-subnet-outbound = [
    ["TCP", "0.0.0.0/0", "80", "80 ALLOW"],
    ["TCP", "0.0.0.0/0", "443", "443 ALLOW"],
    ["TCP", "14.63.64.0/24", "22", "SSH ALLOW"],
  ]
  
  #Private
  vpc1-pri-subnet-inbound = [
    ["TCP", "0.0.0.0/0", "80", "80 ALLOW"],
    ["TCP", "0.0.0.0/0", "443", "443 ALLOW"],
    ["TCP", "14.63.64.0/24", "22", "SSH ALLOW"],
  ]
    vpc1-pri-subnet-outbound = [
    ["TCP", "0.0.0.0/0", "80", "80 ALLOW"],
    ["TCP", "0.0.0.0/0", "443", "443 ALLOW"],
    ["TCP", "14.63.64.0/24", "22", "SSH ALLOW"],
  ]

  #DB
    vpc1-db-subnet-inbound = [
    ["TCP", "0.0.0.0/0", "80", "80 ALLOW"],
    ["TCP", "0.0.0.0/0", "443", "443 ALLOW"],
    ["TCP", "14.63.64.0/24", "22", "SSH ALLOW"],
  ]
    vpc1-db-subnet-outbound = [
    ["TCP", "0.0.0.0/0", "80", "80 ALLOW"],
    ["TCP", "0.0.0.0/0", "443", "443 ALLOW"],
    ["TCP", "14.63.64.0/24", "22", "SSH ALLOW"],
  ]

    ############################
    ##         ACG            ##
    ############################
  #Public
    #protocol, acg name, port, description 순으로 작성 
  vpc1-pub-subnet-inbound-acg = [
    ["TCP", "vpc1-acg-pri", "80", "80 ALLOW"],
  ]
  vpc1-pub-subnet-outbound-acg = [
    ["TCP", "vpc1-acg-pri", "80", "80 ALLOW"],
  ]

  #Private
  vpc1-pri-subnet-inbound-acg = [
    ["TCP", "vpc1-acg-pri", "80", "80 ALLOW"],
  ]
  vpc1-pri-subnet-outbound-acg = [
    ["TCP", "vpc1-acg-pri", "80", "80 ALLOW"],
  ]

  
}

############################
##    Network-Interface   ##
############################
##private-ip
variable Network-Interface {
    type = map(any)
    default = {
        public-web = { 
            name = "public-web" #Interface NAME
            subnet = "vpc1-pub-subnet" #SUBNET NAME
            acg = "vpc1-acg-pub" #ACG NAME
        }
        private-was = { 
            name = "private-was"
            subnet = "vpc1-pri-subnet"
            acg = "vpc1-acg-pri"
        }
        private-db = { 
            name = "private-db"
            subnet = "vpc1-pri-subnet"
            acg = "vpc1-acg-db"
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
#연속된 서버 생성 Function 구현 

variable server {
    type = map(any)
    default = {
        web = { 
            subnet = "vpc1-pub-subnet" #SUBNET NAME
            name = "web" #SERVER NAME
            server-image = "SW.VSVR.OS.LNX64.CNTOS.0708.B050"      #Server Image
            server-spec = "SVR.VSVR.HICPU.C004.M008.NET.HDD.B050.G002" #Server Spec
            is_protect_server_termination = "false" #반납 보호  true or false
            fee_system_type_code = "MTRAT"  #시간요금 : MTRAT #월 요금 :FXSUM
            zone = "KR-2" # KR1, KR2
            network_interface_no = "public-web" #INTERFACE NAME
        }
        was = { 
            subnet = "vpc1-pri-subnet"    
            name = "was"
            server-image = "SW.VSVR.OS.LNX64.CNTOS.0708.B050"      #Server Image
            server-spec = "SVR.VSVR.HICPU.C004.M008.NET.HDD.B050.G002" #Server Spec
            is_protect_server_termination = "false" #반납 보호  true or false
            fee_system_type_code = "MTRAT"  #시간요금 : MTRAT #월 요금 :FXSUM
            zone = "KR-2" # KR1, KR2
            network_interface_no = "private-was"
        }
        db = { 
            subnet = "vpc1-db-subnet"    
            name = "db01"
            server-image = "SW.VSVR.OS.LNX64.CNTOS.0708.B050"      #Server Image
            server-spec = "SVR.VSVR.HICPU.C004.M008.NET.HDD.B050.G002" #Server Spec
            is_protect_server_termination = "false" #반납 보호  true or false
            fee_system_type_code = "MTRAT"  #시간요금 : MTRAT #월 요금 :FXSUM
            zone = "KR-2" # KR1, KR2
            network_interface_no = "private-db"
        }
    }
}

#동일 스펙 여러대 생성 
#사용안할시 resource 와 같이 주석 처리 
  # variable server-count {
  #     type = map(any)
  #     default = {
  #         server = { 
  #             count = "3" #3대 생성
  #             subnet = "vpc1-pub-subnet"    
  #             name = "server" #ex)  server-1, server-2, server-3 생성
  #             server-image = "SW.VSVR.OS.LNX64.CNTOS.0708.B050"      #Server Image
  #             server-spec = "SVR.VSVR.HICPU.C004.M008.NET.SSD.B050.G002" #Server Spec
  #             login_key_name = "test"
  #             is_protect_server_termination = "false" #반납 보호  true or false
  #             fee_system_type_code = "MTRAT"  #시간요금 : MTRAT #월 요금 :FXSUM
  #             zone = "KR-2" # KR1, KR2
  #             network_interface_no = "privateip1"
  #         }
  #     }
  # }


############################
##      Block Storage     ##
############################
# variable blockstorage {
#     type = map(any)
#     default = {
#         block1 = { 
#             size = "10" #Disk Size
#             server = "server1" #할당 서버 네임 
#             name = "block1" #Storage Name
#             disk_detail_type = "SSD" #Disk Type SSD, HDD
#         }
#     }
# }

############################
##       PublicIP         ##
############################
variable publicip {
    type = map(any)
    default = {
        publicip-web = { 
            server = "web" #server name 
        }

    }
}

# ############################
# ##     Init-Script        ##
# ############################
# variable publicip {
#     type = map(any)
#     default = {
#         web = { 
#             name = "web" 
#             content "
            
#             "
#         }

#     }
# }



