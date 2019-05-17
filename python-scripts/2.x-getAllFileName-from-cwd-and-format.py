#!/usr/bin/python
# -*- coding: UTF-8 -*-

# 专门用于配合 !app-idea-hotstring.ahk 使用
import os
import sys

def outputTxt(path,newline):
    file=open(path,"a+")  #2.7 版本好像不能用这个 encoding="utf-8"
    #转换格式 \转义符号，对"起作用
    file.writelines(newline+"\n") 
    file.close()
    
#python 2.7 才需要这个函数
def UTF8ToGBK(str):
    return str.decode("utf-8").encode("gbk")

def get_allFileName_byPrefix():
    currentWorkingDirectory = os.getcwd() + "\\"
    print(currentWorkingDirectory)
    fileNames = os.listdir(currentWorkingDirectory)
    str1 = "cd  "
    str2 = "mvn clean install  "
    resultFileName = "result.txt"
    prefix = "myweb"
    for fileName in fileNames:
        if(fileName.startswith(prefix)):
            outputTxt(currentWorkingDirectory + resultFileName,str1 + os.getcwd() + "\\"  +fileName)
            print(UTF8ToGBK("扫描到的文件名: ") + fileName)
            outputTxt(currentWorkingDirectory + resultFileName,str2)
    print(UTF8ToGBK("\n已生成格式:\n")+ str1 +"reseult-file-name\n"+ str2)
    print(UTF8ToGBK("输出文件为: ")+os.getcwd() + "\\" +resultFileName)

def main():
    #兼容中文字符打印
    reload(sys)
    sys.setdefaultencoding("utf-8")
    
    get_allFileName_byPrefix()

if __name__ == "__main__":
    main()