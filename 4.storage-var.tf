

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
