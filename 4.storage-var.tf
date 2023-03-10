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
##          NAS           ##
############################

#TODO 
#작성일 : 20221226
#nas target list 등록 기능 

variable nas { 
    type = map(any)
    default = {
        nas = { 
            name = "testnas" #NAS NAME
            nas-size = "500" #NAS SIZE
            nas-protocol = "NFS" #NAS PROTOCOL
        }
    }
}
