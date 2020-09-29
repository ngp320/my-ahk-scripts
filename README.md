#### 安装使用介绍

- 1 下载最新的 AutoHotkey (百度 或者 google)    
- 2 运行 AHK Script Manager.ahk (也可以 右键 → 发送到桌面快捷方式)  
- 3 推荐, 放入开机自启动:  
  -  ①右键 AHK Script Manager.ahk → 发送到桌面快捷方式  
  -  ②复制桌面快捷方式  
  -  ③粘贴到 C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\   即可    

#### 代码内容介绍

- ahk-collection 收藏的一些脚本 + 中文文档  
- python-scripts 自己写的python轻量脚本
- scripts     主要脚本
- include, resources都是AHK Scripts Manager.ahk要使用的的文件

- 若有bug，望不吝赐教。 一般重启软件即可 (右下角图片退出再 --> 双击AHK Scripts Manager.ahk)




#### AHK管理软件使用

- 文件名前缀有 "!" , 则需要手动启动
- 文件名前缀无 "!" , 则启动AHK管理软件以后自动启动



#### AHK语言介绍

- 注释符号 ";"

- #NoTrayIcon  ;不显示托盘图标

- 基本按键

  > ; ! →  [Alt]        ; ! 想象成 Alt   的 l  
  > ; # →  [win]        ; # 想           windows开始图案  
  > ; ^ →  [Ctrl]       ; ^ 想象成 Ctrl  的 倒C  
  > ; + →  [Shift]      ; + 想象成 Shift 的 f拉长  

- 最基础的代码①:  按下Ctrl+1, 则会模拟输入123+回车

  > ^1::
  >
  > {
  >
  > Send, {123}
  >
  > Send, {Enter}
  >
  > Return
  >
  > }

- 最基础的代码②: 连续输入nnow, 即可打印当前时间

  > :?:nnow::
  >
  > ;？号表示在单词中也会替换，e.g. Vnnow → V2019.....
  > FormatTime, CurrentDateTime,, yyy/MM/dd HH:mm
  > Send %CurrentDateTime%
  > return



- 最基础的代码③:  换掉鼠标45键 --> PgUp和PgDn (更近一步可以做到纯鼠标的复制和黏贴: 详见 **scripts/!pro-鼠标宏.ahk**)

  > #NoTrayIcon  ;不显示托盘图标
  >
  > XButton1::
  > {
  > 	Send {PgDn}
  > 	Return
  > }
  >
  > XButton2::
  > {
  > 	Send {PgUp}
  > 	Return
  > }

想要做到什么功能, 可以先网络搜索.  没有就只能参考 本地手册 和 网络手册 以及网络上的ahk脚本.

本地手册:  %my-ahk-scripts%\\ahk-collection\\AutoHotkeyHelp_CN\AutoHotkey.chm