#批量移动文件（双层文件）
import os
import shutil
 
floderaddress = r'E:\44230028'
file_all = os.listdir(floderaddress) #路径下所有文件名
filenum= 0
for dirName in file_all:
    try:
        secondfile_all = os.listdir(floderaddress + '\\' + dirName)
    except Exception as msg:
        print(msg)
    for nextname in secondfile_all:
        if nextname[-3:] == 'xml':   #移动后缀为mp4的文件
            print("正在移动" + nextname +"...");
            output_path = 'E:\\bilibili_vue1'
            if(os.path.exists(output_path) == 0): #如果目录不存在
                os.makedirs(output_path)    #创建多层创建目录
            shutil.move(floderaddress + '\\' + dirName + '\\' + nextname,output_path)
            filenum += 1
            print("移动完成, " + "已成功移动 " + str(filenum) + "个")


# #复制单个文件
# shutil.copy("C:\\a\\1.txt","C:\\b")
# #复制并重命名新文件
# shutil.copy("C:\\a\\2.txt","C:\\b\\121.txt")
# #复制整个目录(备份)
# shutil.copytree("C:\\a","C:\\b\\new_a")
 
# #删除文件
# os.unlink("C:\\b\\1.txt")
# os.unlink("C:\\b\\121.txt")
# #删除空文件夹
# try:
    # os.rmdir("C:\\b\\new_a")
# except Exception as ex:
    # print("错误信息："+str(ex))#提示：错误信息，目录不是空的
# #删除文件夹及内容
# shutil.rmtree("C:\\b\\new_a")
 
# #移动文件
# shutil.move("C:\\a\\1.txt","C:\\b")
# #移动文件夹
# shutil.move("C:\\a\\c","C:\\b")
 
# #重命名文件
# shutil.move("C:\\a\\2.txt","C:\\a\\new2.txt")
# #重命名文件夹
# shutil.move("C:\\a\\d","C:\\a\\new_d")