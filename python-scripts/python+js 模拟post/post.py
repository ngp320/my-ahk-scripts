#!/usr/bin/
# python3.7 python 
# -*- coding: utf-8 -*- 
import requests
import sys
import time

import execjs

def getMockDate():
    with open('./mockDemo.js', encoding="utf-8") as f:  # 执行 JS 文件
         ctx = execjs.compile(f.read())
         values = ctx.call('getMockDate')
    # 下面这种方式暂时用不了
    # ctx = execjs.compile(
    # """  # 执行 JS 语句
    # var Mock = require('mockjs')
    # var data = Mock.mock({
        # 'iotTempId'    : /\d\d/,
        # 'state'        : /1/,
        # 'temperature'  : /\d\d/,
        # 'location'     : /x:\d\d, y:\d\d/
    # })
    # function getMockDate() {return data;}
    # """)
    # values = ctx.call('getMockDate')
    return values

def postFeedBack(values111):
    url = "http://localhost:9000/api/saveIotTemp/temp"
    values={
        'iotTempId':      'iotTempId',
        'state':          'state',
        'temperature':    'temperature',
        'location':       'location'
    }
    # 之所以出问题是 长度变长了很多(在js里面处理了json再传到python的缘故)(... 字典可以自动转到json? 还是这压根不是用json传的?)
    # print(len(values))
    # print(len(values111))
    
    r = requests.post(url,values111)
    print(r.content.decode('utf-8'))

if __name__ == "__main__": 
    count = 0;
    while True: 
        count = count + 1

        values = getMockDate()

        print("count= "+str(count))
        # 模拟起火
        if(count%100 == 5):
            values['temperature'] = "1000"
            print("#####################")
            print("#####################")
            print("\t\t"+values['temperature']+"\t\t")
            print("#####################")
            print("#####################")
            print("#####################")
            
            
        # print(values)
        postFeedBack(values)

        sleepTime= 0.1
        print("sleepTime:",sleepTime) 
        time.sleep(sleepTime) 