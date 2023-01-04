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
    default = "access_key"
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
##          Key           ##
############################

##키 생성후 실행경로에 .pem 파일 생성됩니다. 
variable key-name { 
    default = "test-key"
}



