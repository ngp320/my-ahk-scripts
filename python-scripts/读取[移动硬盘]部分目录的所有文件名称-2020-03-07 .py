#!/usr/bin/python

import os

with open(r'result.txt', 'w', encoding='utf-8') as f :
  f.write(str(list(os.walk(r'D:\\0D castle\\neal'))).replace(",", "\n"))








