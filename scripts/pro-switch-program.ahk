;===============================特殊功能区5: 程序切换区==========================================
#NoTrayIcon  ;不显示托盘图标

; Function to run a program or activate an already running instance 
RunOrActivateProgram(Program, WorkingDir="", WindowSize=""){ 
    SplitPath Program, ExeFile 
    Process, Exist, %ExeFile% 
    PID = %ErrorLevel% 
    if (PID = 0) { 
    Run, %Program%, %WorkingDir%, %WindowSize% 
    }else{ 
    WinActivate, ahk_pid %PID% 
    } 
}
;打开AutoHotkey中文教程
;!y::
;RunOrActivateProgram("D:\my-ahk-scripts\ahk-collection\AutoHotkeyHelp_CN\AutoHotkey.chm")
;return

;打开or切换 everything  Alt+E
!e::
Run, C:\Program Files\Everything\Everything.exe 
return 

; 有时候 RunOrActivateProgram 会无效 也不知道为什么.. 应该是没弄懂这个函数, 或者AHK本身不稳定(见过很多次了)



;####################################最常用START##########################################

;打开or切换谷歌浏览器  Alt+z
!x::
RunOrActivateProgram("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
return 

;打开or切换 Eclipse
;!C::
;RunOrActivateProgram("D:\00software\eclipse\eclipse.exe")
;return

;打开or切换 idea
!z::
RunOrActivateProgram("C:\Program Files\JetBrains\IntelliJ IDEA 2019.3.3\bin\idea64.exe")
return

;打开 potplayer
!c::
RunOrActivateProgram("C:\Program Files\DAUM\PotPlayer\PotPlayerMini64.exe")
return 
;####################################最常用END##########################################

;打开 印象笔记
!v::
RunOrActivateProgram("C:\Program Files (x86)\Yinxiang Biji\印象笔记\Evernote.exe")
return 


;打开or切换eclipse/idea  Alt+B ;与zxc区分开，防止误触
;!v::
;RunOrActivateProgram("C:\Program Files\JetBrains\PyCharm 2018.3.3\bin\pycharm64.exe")
; RunOrActivateProgram("C:\Program Files\JetBrains\IntelliJ IDEA 2018.2.8\bin\idea64.exe")
;return



;打开or切换Typora
;之前只有Typora不灵，这种方式就可以诶 =。=  哇。。。知乎万岁
;!t::   ;Alt+X
;DetectHiddenWindows, On
;SetTitleMatchMode, 2
;WinGet, winid, ID, Typora
;;MsgBox,%winid%
;SetTitleMatchMode, 1
;If (winid) {
;WinWait, ahk_id %winid%
;WinShow
;WinActivate
;ControlFocus, EditComponent2, A
;ControlSetText, EditComponent2,, A
;}else{
;; RunOrActivateProgram("D:\Program Files\AliWangWang\AliIM.exe")
;RunOrActivateProgram("C:\Program Files\Typora\Typora.exe")
;}
;DetectHiddenWindows, Off
;return