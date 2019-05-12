import re
import os
  


def missingNumber(nums):
    min_num = 1
    """
    :type nums: List[int]
    :rtype: int
    """
    missingNumber_list = []
    nums.sort()
    for item in nums:
        while(min_num < item):
            missingNumber_list.append(min_num)
            min_num += 1
        else:
            min_num += 1
            
    return missingNumber_list
    

def List_undownloaded_videos():
    prefix = input("请黏贴你视频系列的前缀(此程序当且仅当有[统一]前缀时有效):\n")
    old_names= os.listdir()

    num_list = []
    for old_name in old_names:
        if (old_name.startswith(prefix)):
            # 从开头开始切片,切分成两个,取后面那一个
            result = old_name.split(prefix,1)[-1]
            # 取出前缀中的数字,取第一个
            num = re.findall(r"\d+",result)[0]
            num_list.append(int(num))
            num_list.sort() #必须先排序
            



    # print(num_list)
    missingNumber_list = missingNumber(num_list)
    print(missingNumber_list)

def main():
    List_undownloaded_videos()

if __name__ == "__main__":
    main()
    