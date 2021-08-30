
#### 安装使用介绍

- 1 下载AutoHotkey软件 (%my-ahk-scripts%\\ahk-collection\\AutoHotkey_1.1.30.01_setup.exe)    
- 2 运行 AHK Script Manager.ahk  
- 3 (推荐)放入开机自启动:  
  -  ①右键 AHK Script Manager.ahk → 发送到桌面快捷方式  
  -  ②复制桌面快捷方式  
  -  ③粘贴到 C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\   即可    



#### 代码内容介绍

- ahk-collection 收藏的一些脚本 + AHK安装软件 + 中文文档  
- scripts     主要脚本
- include, resources都是AHK Scripts Manager.ahk要使用的的文件

- 若有bug，望不吝赐教。 一般重启软件即可 (右下角右键退出再 --> 双击AHK Scripts Manager.ahk)



#### 功能介绍

1 任何 快捷键启动宏定义 (快捷键启动设置好的一系列按键 可 定时 循环)

例如  \\scripts\\!pro-鼠标宏 -启动后pgDn开启or关闭 持续 tabtab右右 功能.ahk

2 键按一次 二次 三次 区分df不同功能

例如 \\scripts\\!app-给chrome发送Space键.ahk




#### AHK管理软件使用

- 文件名前缀有 "!" , 则需要手动启动
- 文件名前缀无 "!" , 则随AHK管理软件的自动而启动



#### AHK语言介绍

- 注释符号 ";"

- #NoTrayIcon  ;不显示托盘图标

- 基本按键

  ```
  ; ! →  [Alt]        ; ! 想象成 Alt   的 l  
  ; # →  [win]        ; # 想           windows开始图案  
  ; ^ →  [Ctrl]       ; ^ 想象成 Ctrl  的 倒C  
  ; + →  [Shift]      ; + 想象成 Shift 的 f拉长  
  ```

  

- 最基础的代码①:  按下Ctrl+1, 则会模拟输入123+回车

  ```
  ^1::
  {
  Send, {123}
  Send, {Enter}
  Return
  }
  ```
  
  
  
- 最基础的代码②: 连续输入nnow, 即可打印当前时间

  ```
  :?:nnow::
  
  ;？号表示在单词中也会替换，e.g. Vnnow → V2019.....
  FormatTime, CurrentDateTime,, yyy/MM/dd HH:mm
  Send %CurrentDateTime%
  return
  ```
  
  



- 最基础的代码③:  换掉鼠标45键 --> PgUp和PgDn (更近一步可以做到纯鼠标的复制和黏贴: 详见 **scripts/!pro-鼠标宏.ahk**)

  ```
  #NoTrayIcon  ;不显示托盘图标
  XButton1::
  {
  	Send {PgDn}
  	Return
  }
  
  XButton2::
  {
  	Send {PgUp}
  	Return
  }
  ```
  
  
  
- 进阶代码①:  复制文件(文件夹)绝对路径, 并把 `\` 替换为 `\\`

  ```
  #NoTrayIcon  ;不显示托盘图标
  Explorer_GetSelection(hwnd="")   ;函数
  {  
      WinGet, process, processName, % "ahk_id" hwnd := hwnd? hwnd:WinExist("A")  
      WinGetClass class, ahk_id %hwnd%  
      if (process != "explorer.exe")  
          return  
      if (class ~= "Progman|WorkerW") {  
              ControlGet, files, List, Selected Col1, SysListView321, ahk_class %class%  
              Loop, Parse, files, `n, `r  
                  ToReturn .= A_Desktop "\" A_LoopField "`n"  
          } else if (class ~= "(Cabinet|Explore)WClass") {  
              for window in ComObjCreate("Shell.Application").Windows 
  			{
  				try{
                  if (window.hwnd==hwnd)  
                      sel := window.Document.SelectedItems  
  				}catch e {
  					continue
  				}
  			}
              for item in sel  
                  ToReturn .= item.path "`n"  
          }  
      return Trim(ToReturn,"`n")  
  } 
  
  
  
  ;[Win] + Z ;一键拷贝文件路径 ;
  #Z::
  clipboard := % Explorer_GetSelection(hwnd) ;调用了 函数
  clipboard := RegExReplace(clipboard, "\\","\\")    ;匹配 [\] 替换为 [\\]号     
  Tooltip,%clipboard%	;在鼠标右侧显示【拷贝的文件路径】
  Sleep,800
  Tooltip,
  return
  ```

#### 后记:

- 想要做到什么功能, 可以先网络搜索.  没有就只能参考 本地手册 和 网络手册 以及网络上的ahk脚本.
- 如果玩脱了可能会导致 鼠标 键盘不可用(需物理强制重启!=.=), 毕竟能够禁止鼠标键盘(建议写之前备份代码, 或者及使用Git提交到远程仓库.
- 本地手册:  %my-ahk-scripts%\\ahk-collection\\AutoHotkeyHelp_CN\AutoHotkey.chm

手动狗头:

![手动狗头](https://raw.githubusercontent.com/ngp320/my-ahk-scripts/master/resources/ahk_ahk-manager-ahk-%E6%89%8B%E5%8A%A8%E7%8B%97%E5%A4%B4.png)

