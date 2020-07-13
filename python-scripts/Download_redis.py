# coding:utf-8
import requests
import random
import time
import logging
import sys
logging.basicConfig(stream=sys.stdout, level=logging.INFO)

VALID_STATUS_CODES = [200, 302]


class download():
    def __init__(self):
        self.ss_proxies_proxies = 'http://127.0.0.1:1080'
        self.user_agent_list = [
            "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/22.0.1207.1 Safari/537.1",
            "Mozilla/5.0 (X11; CrOS i686 2268.111.0) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.57 Safari/536.11",
            "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.6 (KHTML, like Gecko) Chrome/20.0.1092.0 Safari/536.6",
            "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.6 (KHTML, like Gecko) Chrome/20.0.1090.0 Safari/536.6",
            "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/19.77.34.5 Safari/537.1",
            "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.9 Safari/536.5",
            "Mozilla/5.0 (Windows NT 6.0) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.36 Safari/536.5",
            "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3",
            "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3",
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1063.0 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1062.0 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1062.0 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.1 Safari/536.3",
            "Mozilla/5.0 (Windows NT 6.2) AppleWebKit/536.3 (KHTML, like Gecko) Chrome/19.0.1061.0 Safari/536.3",
            "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.24 (KHTML, like Gecko) Chrome/19.0.1055.1 Safari/535.24",
            "Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/535.24 (KHTML, like Gecko) Chrome/19.0.1055.1 Safari/535.24"
        ]
    # 给函数一个默认参数proxy为空
    # 放弃ssl认证,  varify=None
    def get(self, url, timeout, proxy=None, num_retries=6, referer=None):
        UA = random.choice(self.user_agent_list) ##从self.user_agent_list中随机取出一个字符串
        headers = {
            'User-Agent': UA,
            'Referer' : referer,
            'Connection': 'close'   #关闭长连接
        }  ##构造成一个完整的User-Agent （UA代表的是上面随机取出来的字符串哦）

        if proxy is None: ##当代理为空时，不使用代理获取response（别忘了response啥哦！之前说过了！！）
            try:
                response = requests.get(url, headers=headers, timeout=timeout)  ##这样服务器就会以为我们是真的浏览器了
            except Exception:
                logging.error("Exception: \n%s", traceback.format_exc())

            try:
                isError =  response.status_code not in VALID_STATUS_CODES
            except Exception as e:  ##如过上面的代码执行报错则执行下面的代码
                logging.error(e)
                isError = True

            if isError:
                if num_retries > 0: ##num_retries是我们限定的重试次数
                    time.sleep(5) ##延迟5秒
                    logging.info(u'获取网页出错，5S后将获取倒数第：', num_retries, u'次')
                    return self.get(url, timeout, None, num_retries-1,referer)  ##调用自身 并将次数减1

                else:
                    logging.info(u'开始使用代理')
                    time.sleep(5)
                    #IP = requests.get("http://localhost:5555/random").content.decode('utf-8') ##下面有解释哦
                    IP = self.ss_proxies
                    proxy = {'http': IP}
                    return self.get(url, timeout, proxy,6,referer) ##代理不为空的时候
            return response
        else: ##当代理不为空
            response = None


            #一开始就使用代理
            #修改了一下ip的获取
            #''.join(str(random.choice(self.iplist)).strip()) -->>  requests.get("http://localhost:5555/random").content.decode('utf-8')
            #IP = requests.get("http://localhost:5555/random").content.decode('utf-8')
            IP = self.ss_proxies
            proxy = {'http': IP}
            try:
                response = requests.get(url, headers=headers, proxies=proxy, timeout=timeout) ##使用代理获取response
            except Exception as e:  ##如过上面的代码执行报错则执行下面的代码
                logging.error(e)

            try:
                isError =  response.status_code not in VALID_STATUS_CODES
            except Exception as e:  ##如过上面的代码执行报错则执行下面的代码
                logging.error(e)
                isError = True  #response 取不到的情况下

            if isError:
                if num_retries > 0:
                    #IP = requests.get("http://localhost:5555/random").content.decode('utf-8')
                    IP = self.ss_proxies
                    proxy = {'http': IP}
                    time.sleep(5)#延迟5秒
                    logging.info(u'正在更换代理, 5S后将重新获取, 倒数第', num_retries, u'次')
                    logging.info(u'当前代理是：', proxy)
                    return self.get(url, timeout, proxy, num_retries - 1,referer)
                else:
                    logging.info(u'代理也不好使了！ 放弃下载此url\n')
                    logging.info(u'url= ' + str(url)+'\n')
                    logging.info(u'response= '+response+'\n')
                    return None
            return response


request = download()  ##