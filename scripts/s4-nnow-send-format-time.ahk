﻿;===============================特殊功能区4: 特殊热字串区===================================
#NoTrayIcon  ;不显示托盘图标

;功能:   发送当前日期 
;简介:   利用剪贴板和正则匹配，在选中文本的行首加上注释符号
;操作:   输入nnow+[一个空格]
;原因:   Hexo经常要输入格式化的日期
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
:?:nnow::            ; 【？号表示在单词中也会替换，e.g. Vnnow → V2019.....】
FormatTime, CurrentDateTime,, yyy-MM-dd HH:mm:ss  
Send %CurrentDateTime%
return

:?:ppic::            ; 【？号表示在单词中也会替换，e.g. Vnnow → V2019.....】
FormatTime, CurrentDateTime,, yyy-MM-dd-1-HHmmss.png
Send %CurrentDateTime%
return