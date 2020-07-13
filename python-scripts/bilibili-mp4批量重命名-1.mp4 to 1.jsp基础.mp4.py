#使用说明 先去bilibili网页版, F12 , copyout Html, 再用notepad++ 把链接正则提取, 并重命名为newname.txt
import os
import time

path = "./JavaWeb"
newnameList = []


def get_newname_list():
    # 获取 新文件名目录

    with open('./newname.txt', 'r', encoding="utf-8") as f:
        for line in f.readlines():
            newnameList.append(line.strip())  # 把末尾的'\n'删掉
    print(newnameList)
    return newnameList


if __name__ == '__main__':
    # 获取 该目录下所有文件，存入列表中
    fileList = os.listdir(path)
    # 排序 排序前: 1.txt 10.txt 11.txt.... 2.txt 20.txt...  排序后 1.txt 2.txt ... 10.txt ...
    fileList.sort(key=lambda x: int(x[:-4]))
    # 获取 新文件名
    newnameList = get_newname_list()

    for i in range(len(fileList)):
        time.sleep(1)
        print(newnameList[i])
        # 设置旧文件名（就是路径+文件名）
        oldname = path + os.sep + fileList[i]  # os.sep添加系统分隔符

        # 设置新文件名
        newname = path + os.sep + "["+str(i+1)+"]" + str(newnameList[i]) + '.mp4'

        os.rename(oldname, newname)  # 用os模块中的rename方法对文件改名
        print(oldname, '======>', newname)


