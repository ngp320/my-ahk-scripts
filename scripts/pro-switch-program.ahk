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

;打开or切换谷歌浏览器  Alt+Z
!z::
RunOrActivateProgram("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
return 

;打开or切换firefox
; !x::
; RunOrActivateProgram("C:\Program Files\Mozilla Firefox\firefox.exe")
; return

;打开 evernote
!c::
RunOrActivateProgram("C:\Program Files (x86)\Yinxiang Biji\印象笔记\Evernote.exe")
return 

;打开or切换eclipse/idea  Alt+B ;与zxc区分开，防止误触
!v::
RunOrActivateProgram("C:\Program Files\JetBrains\IntelliJ IDEA 2018.2.8\bin\idea64.exe")
return

;打开AutoHotkey中文教程
!y::
RunOrActivateProgram("D:\my-ahk-scripts\ahk-collection\AutoHotkeyHelp_CN\AutoHotkey.chm")
return


;打开or切换Typora
;之前只有Typora不灵，这种方式就可以诶 =。=  哇。。。知乎万岁
!t::   ;Alt+X
DetectHiddenWindows, On
SetTitleMatchMode, 2
WinGet, winid, ID, Typora
;MsgBox,%winid%
SetTitleMatchMode, 1
If (winid) {
WinWait, ahk_id %winid%
WinShow
WinActivate
ControlFocus, EditComponent2, A
ControlSetText, EditComponent2,, A
}else{
; RunOrActivateProgram("D:\Program Files\AliWangWang\AliIM.exe")
RunOrActivateProgram("C:\Program Files\Typora\Typora.exe")
}
DetectHiddenWindows, Off
return