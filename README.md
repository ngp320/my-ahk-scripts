;============================安装使用介绍=========================     
1 下载最新的 AutoHotkey (百度 或者 google)    
2 运行 AHK Script Manager.ahk (也可以 右键 → 发送到桌面快捷方式)  
3 推荐, 放入开机自启动:  
; ①右键 AHK Script Manager.ahk → 发送到桌面快捷方式  
; ②复制桌面快捷方式  
; ③粘贴到 C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\   即可    

p.s. github readme 换行: 要换行的位置打上两个空格  
   
   
;============================代码内容介绍=========================    
ahk-collection 收藏的一些脚本 + 中文文档  

python-scripts 自己写的python轻量脚本

scripts     自己平时抄抄写写的脚本  

include, resources都是AHK Scripts Manager.ahk要使用的的文件

;本文是萌新的AHK常用脚本。原理不是很懂。AHK也没用多久。若有不恰当之处，望不吝赐教。  
  
  
;============================脚本管理器介绍=========================    
脚本管理使用的是: AHK Script Manager(作者:蓝蓝 修改:另一位大佬[忘了=.=] ahk脚本管理器)  
2019-05-13 14:43:28  
  
  
;============================基本按键介绍=========================    
; ! →  [Alt]        ; ! 想象成 Alt   的 l  
; # →  [win]        ; # 想           windows开始图案  
; ^ →  [Ctrl]       ; ^ 想象成 Ctrl  的 倒C  
; + →  [Shift]      ; + 想象成 Shift 的 f拉长  
  
  
;============================备忘=========================         
;以下cmd命令可以解决部分中文乱码问题    
;chcp 936    
  
很久没push的代码, 无法push, 解决方案之一:
1 文件夹整个打成压缩包    
2 在另一个路径(直接在原地新建一个文件夹也行)clone远程仓库  (例如 AHK/my-ahk-scripts)     
3 用压缩包里的文件覆盖.idea .git 以外的文件     
4 push即可   
5 记得把 AHK Script Manager.ahk 的快捷方式 放到 [开机启动]↓L28 和 [桌面] 里面去  



