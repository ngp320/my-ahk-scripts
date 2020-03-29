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


;打开or切换Everything	
;得配合Win10程序计划任务，不显示UAC(用户账户控制)，并取消Everything的后台运行
; 配合win10程序计划任务，开启时会严重影响windows稳定性，故废弃
; !^f::
; Run, "C:\Users\NGP\Desktop\快捷方式\Everything.lnk"
; return  



;##################################便捷输入区【注释】#################################################
; #NoTrayIcon  ;不显示托盘图标
; #IfWinExist 画中画
; #c::   
; {
    ; WinActivate
    ; WinMove ,画中画, ,0,200
; WinGetPos,X,Y, Width, Height, 画中画  ;获得窗口大小
; Width := Width/2 
; Height := Height/2
; ; msgbox, %Width% + %Height%
; SetControlDelay -1
; ControlClick,X%Width% y%Height%, 画中画,,L,1,NA ;点击暂停/播放键图标
; }
; #IfWinExist

;Java 便捷输入
;输入//e8后再空格 →  输入替换
;::/cpy::cd /d D:\pythonDemo\ {Enter}  
;::/e8:: -encoding utf-8

;CSDN 便捷输入
;::nbsp::&nbsp;&nbsp;&nbsp;&nbsp;

;Hexo 便捷输入  (文档: 超长替换,即替换可以输出特殊符号)
;::nnot:: 
;(
;notepad++ * -r 
;)

; return 

; ^#!c::
; Send,{F2}{Home}{Delete}{End}{Backspace}{Enter}
; return 

;##############################################################################################
; ^#!x::
; MouseGetPos, , , , controlclassnn ;获得一个控件
; ControlGet, hwnd, Hwnd, , %controlclassnn%, A ;获得控件句柄
; ;WinGetClass, class, ahk_id %hwnd%
; Parent=1
; while Parent
; Parent := DllCall("GetParent","int",hwnd),p := Parent ? Parent : p,hwnd := Parent ? Parent : hwnd ;获取最顶层父窗
; WinGetClass, ParentClass, ahk_id %p%
; MsgBox %ParentClass%


; #NoTrayIcon  ;不显示托盘图标
; send2PosFixed(wid=0){
; if wid=0
; wid:=WinActive("A") ;获得当前选中窗口wid
; WinGetPos ,deskX,deskY,deskWidth,deskHeight ,ahk_class Progman  ;获得屏幕大小
; WinGetPos ,progX,progY,progWidth,progHeight,ahk_id %wid%        ;获得当前选中窗口大小
; If (deskWidth > 1270)  
; {  
    ; newDeskWidth := deskWidth-1920
    ; OutputDebug, Moving left from %deskWidth% to %newDeskWidth%  
; }  
; rate := newDeskWidth/progWidth ;获得视频和整个屏幕的比例
; ; msgbox, %rate%

; ;设置窗口位置长宽(因为视频清晰度，所以1:1)
; WinMove ,ahk_id %wid%,, , ,newDeskWidth*rate/2,newDeskWidth*rate/2/1.3
; Sleep, 10
; WinGetPos ,progX2,progY2,progWidth2,progHeight2,ahk_id %wid%        ;获得当前选中窗口大小
; WinMove ,ahk_id %wid%,,0,deskHeight*0.5-progHeight2*0.5, 
; }
; !#c::Send2PosFixed( ) ;一键设置到上下居中，等比例放缩到屏幕左半边
;##############################################################################################

;##################################特殊功能区【注释】################################################
#NoTrayIcon  ;不显示托盘图标

;[Ctrl] + [Shift] + C 		;一键拷贝文件路径  【功能已被替换Win+Z】
;缺陷1: 无法拷贝父文件夹路径
;缺陷2: 路径中不能有空格(也不能说是缺陷吧,了解点为什么路径最好是全英文+下划线的原因)
;缺陷3: 偶尔[Ctrl] + C 不灵，不知道是不是这个热键导致的。
;缺陷4：因为用的是 ^C 也就是Ctrl+C实现的，剪切板会被当前路径覆盖
;优势1: 意外地能复制文本。
;^+c::
;Send ^c
;sleep,200
;clipboard=%clipboard% 	;%null%
;tooltip,%clipboard%		;在鼠标右侧显示clipboard内容
;sleep,800
;tooltip,
;return

;按一下tab输出4个空格，把原来的 [Tab] 键屏蔽了 【功能已被替换Ctrl+Alt+/】
;Tab::
;Send {space}
;Send {space}
;Send {space}
;Send {space}
;return

; #NoTrayIcon  ;不显示托盘图标
; ;功能:   用Google搜索选中的文字
; ;操作:   先选中文本，再按 [Alt] + [G] 
; ;原因:   有时候在文本中打开链接到谷歌浏览器很麻烦
; ;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
; !g::  
; Send ^c
; clipboard := RegExReplace(clipboard, "\s","+")  ;使用正则替换(RegExReplace)实现了，空格替换为 "+"号, 使搜索功能有更好的使用体验
; Chrome = C:\Program Files (x86)\Google\Chrome\Application\chrome.exe
; Run %Chrome%  http://www.google.com/search?q=%clipboard%    ;
; return 

	
;###############################软件快捷启动区【注释】###############################################
;!s::        ;Notepad++ 打开预设位置的py文件
;RuanJian # C:\Program Files\Notepad++\notepad++.exe
;WenJian # D:\pythonDemo\TestDemo.py
;Run, %RuanJian% "%WenJian%" 
;return

;打开 cmder
;!c::
;Run, D:\0Software\cmder\Cmder.exe
;return

;!c::        ;打开cmd 并输入一段命令
;缺陷1：同一时间同一路径只能打开一个cmd
;缺陷2：必须在英文输入法下
;缺陷3：偶尔标点输入出错
;run cmd.exe
;WinWait, cmd.exe
;Send cd /d D:\blog\ {Enter} ;
;return


