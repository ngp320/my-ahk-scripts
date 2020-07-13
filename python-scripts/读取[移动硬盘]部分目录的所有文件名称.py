#coding=utf-8
import os

def editTxt(path,fileName):
    file=open(str(path) + str(fileName) + ".txt","a+", encoding="utf-8")
    file.writelines(newline+"\\n") 
    file.close()

def GetFileList(dir, fileList):
    if os.path.isfile(dir):
        fileList.append(dir)
    elif os.path.isdir(dir):  
        for s in os.listdir(dir):
            #如果需要忽略某些文件夹，使用以下代码
            if("files" in s):   #UCWeb里有一些html和图片分开的网页
                continue
            newDir=os.path.join(dir,s)
            GetFileList(newDir, fileList)  
    return fileList
    
dir_list = ['av[放假有空可以整理一次全换为超清画质]','manhua[]','UCWeb[漫画+小说(网页)]','动漫[zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz]']
for x in range(0,len(dir_list)):
    dir = "F:\\0D castle\\neal\\"+dir_list[x] #文件夹目录
    fileList = GetFileList(dir,[])
    fileObject = open("D:\\pythonDemo\\几乎所有已有的资源.txt", 'a+',encoding="utf-8")
    for fileName in fileList:
        print(fileName.split("\\")[-1])
        fileObject.write(fileName.split("\\")[-1])
        fileObject.write('\n')








