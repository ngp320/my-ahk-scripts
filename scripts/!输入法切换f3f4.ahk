; #NoTrayIcon  ;不显示托盘图标

;功能：输入法状态提示 ;f3强制中文 f4强制英文小写 
;环境：win10+搜狗输入法，输入法状态切换用默认的shift键。
;作者：kazhafeizhale
;时间：2018年9月8日
;参考来源 https://www.autoahk.com/archives/3278
;如果安装有Snipaste,需要禁用f1以外的快捷键

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance force
;startuplnk := A_StartMenu . "\Programs\Startup\自动化集合.lnk"

; Menu, Tray, Add, 开机启动,AutoStart
; if(FileExist(startuplnk))
; Menu, Tray, Check, 开机启动

; return

; AutoStart:
	; if(FileExist(startuplnk))
	; FileDelete, % startuplnk
	; else
		; FileCreateShortcut, % A_ScriptFullpath, % startuplnk
	; Menu, Tray, ToggleCheck, 开机启动
; return

XButton1::^c
XButton2::^v

F3::
	SetCapsLockState,off
	switchime(0)
	switchime()
return

F4::
	SetCapsLockState,off
	switchime(0)
return

;capslock强制英文大写
; CapsLock::
	; SetCapsLockState,on
; return

switchime(ime := "A")
{
    if (ime = 1){
        DllCall("SendMessage", UInt, WinActive("A"), UInt, 80, UInt, 1, UInt, DllCall("LoadKeyboardLayout", Str,"00000804", UInt, 1))
    }else if (ime = 0)
    {
        DllCall("SendMessage", UInt, WinActive("A"), UInt, 80, UInt, 1, UInt, DllCall("LoadKeyboardLayout", Str,, UInt, 1))
    }else if (ime = "A")
    {
        ;ime_status:=DllCall("GetKeyboardLayout","int",0,UInt)
        Send, #{Space}
    }
}