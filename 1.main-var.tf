
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



