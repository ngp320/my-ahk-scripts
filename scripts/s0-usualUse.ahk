#NoTrayIcon  ;不显示托盘图标

;======本文是萌新的AHK常用脚本。原理不是很懂。AHK也没用多久。若有不恰当之处，望不吝赐教。========
;===我的脚本备份:  https://pan.baidu.com/s/1ceTunj-CzTeAayasLNr2YQ  密码: 30e0
;============================基本按键介绍==================================
; ! →  [Alt]        ; ! 想象成 Alt   的 l
; # →  [win]        ; # 想           windows开始图案
; ^ →  [Ctrl]       ; ^ 想象成 Ctrl  的 倒C
; + →  [Shift]      ; + 想象成 Shift 的 f拉长

; p.s. 开机启动 ahk脚本 →  把对应脚本的【快捷方式】放到：
; C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\   【即可】

;================================便捷输入区=================================================
;以下cmd命令可以解决部分中文乱码问题
;chcp 936 

;放弃【段首缩进】。使用【换行】实现 【换段】，有效减轻【文字过于密集，以至于阅读体验不好】的问题。

;===============================软件快捷启动区==============================================



;打开or切换Everything	
;得配合Win10程序计划任务，不显示UAC(用户账户控制)，并取消Everything的后台运行

!^f::
Run, "C:\Users\NGP\Desktop\快捷方式\Everything.lnk"
return  

::cccmmmccc::
(
cd D:\IDEA-demo\myweb\myweb-commons
mvn clean install
cd D:\IDEA-demo\myweb\myweb-commons-domain
mvn clean install
cd D:\IDEA-demo\myweb\myweb-commons-mapper
mvn clean install
cd D:\IDEA-demo\myweb\myweb-commons-service
mvn clean install
cd D:\IDEA-demo\myweb\myweb-database
mvn clean install
cd D:\IDEA-demo\myweb\myweb-dependencies
mvn clean install
cd D:\IDEA-demo\myweb\myweb-external-skywalking
mvn clean install
cd D:\IDEA-demo\myweb\myweb-service-reg
mvn clean install
)


;###############################以下内容均已注释【注释】#############################################
