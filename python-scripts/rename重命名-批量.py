import os
import re


#先把 新的文件名读入 list
newNameList = []    #list定义
with open("E:\\name.txt", 'r',encoding='UTF-8') as f:
    for line in f.readlines():
        line = line.strip() # 把末尾的'\n'删掉
        # print(line)
        newNameList.append(line)
    # print(newNameList)
    # index1 = 0
    # for name in newNameList:
        # index1 += 1
        # print(str(index1) +".  "+name)



floderaddress = r'E:\bilibili_springcloud'
file_all = os.listdir(floderaddress)
for path in file_all:
    result = re.findall(r"_(.+?)_",path)    #找到序号
    findNameID = ''.join(result)              #list to string
    if(findNameID != ''):                   #如果找到了序号(没找到对应格式视为找到)
        # print(findNameID)   
        oldNameID = int(findNameID)
        oldName = floderaddress+"\\"+path
        # print(floderaddress+"\\"+path)
        # print(oldName)
        #用os模块中的rename方法对文件改名
        try:
            newName = floderaddress+"\\"+newNameList[oldNameID-1]+".flv"   #list的序号从0开始
        except Exception as e:
            print(findNameID)
            print(findNameID)
            print(findNameID)
        
        os.rename(oldName,newName)
        
        print(oldName+" -> "+newName)
        
        