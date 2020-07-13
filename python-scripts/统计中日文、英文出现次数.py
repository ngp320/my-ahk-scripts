import re
from collections import Counter
fpath = r'F:\LIST-j.v.txt'

with open(fpath, 'r') as f:
    s = f.read()

    # 找出所有中日文字符串
    # 中 u"[\u4e00-\u9fa5]+"
    # 日 u"[\u30a0-\u30ff\u3040-\u309f]+"

    # 统计排序
    key = re.compile(u"[\u4e00-\u9fa5\u30a0-\u30ff\u3040-\u309f]+")
    res = re.findall(key, s)
    newRes=Counter(res)
    print(newRes)
    with open('F:/writeTest.txt', 'w') as writeFile:
        # writeFile.write("\n")
        writeFile.write(str(newRes))

    key = re.compile(u"[a-zA-Z]+")
    res = re.findall(key, s)
    newRes = Counter(res)
    print(newRes)
    with open('F:/writeTest.txt', 'a+') as writeFile:
        writeFile.write("\n")
        writeFile.write(str(newRes))

    # print(s.count('abc'))
    # for line in f:
    #     # if(line.count('abc')):
    #     #     print(line.count('abc'))
    #     txtList.append(line)



# print(txtList)