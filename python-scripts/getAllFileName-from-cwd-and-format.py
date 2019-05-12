#!/usr/bin/python
# -*- coding: UTF-8 -*-

# 专门用于配合 !app-idea-hotstring.ahk 使用
import os
import sys

def outputTxt(path,newline):
    file=open(path,"a+", encoding="utf-8")
    #转换格式 \转义符号，对"起作用
    file.writelines(newline+"\n") 
    file.close()
    
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
            print("扫描到的文件名: " + fileName)
            outputTxt(currentWorkingDirectory + resultFileName,str2)
    print("\n已生成格式:\n"+ str1 +"reseult-file-name\n"+ str2)
    print("输出文件为: "+os.getcwd() + "\\" +resultFileName)

def main():
    get_allFileName_byPrefix()

if __name__ == "__main__":
    main()