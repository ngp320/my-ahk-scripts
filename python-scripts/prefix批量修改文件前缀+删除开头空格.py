import os
import re
import sys

def add_mark():
    add_prefix = input("请输入需要添加的前缀:")
    mark = add_prefix
    old_names= os.listdir()
    for old_name in old_names:
        if old_name != sys.argv[0]:#跳过本脚本语言
            print(old_name + "  --->  " +mark+old_name)
            os.rename(old_name, mark+old_name)

def remove_mark(delete_prefix):
    old_names= os.listdir()
    for old_name in old_names:
        if (old_name.startswith(delete_prefix)):
            try:
                #从开头开始切片,切分成两个,取后面那一个
                result = old_name.split(delete_prefix,1)[-1]
                if result:
                    print(old_name + "  --->  " +result)
                    os.rename(old_name, result)
                
            except Exception as e:
                print("error" + result)
                pass

def main():
    while True:
        option = int(input("请选择功能数值:\n1.添加前缀\n2.删除前缀\n3.退出程序\n"))
        if option == 1:
            add_mark()
        elif option == 2:
            delete_prefix = str(input("请黏贴你想删除的前缀:\n"))
            remove_mark(delete_prefix)
            remove_mark(" ")
        else:
            exit()

if __name__ == "__main__":
    main()