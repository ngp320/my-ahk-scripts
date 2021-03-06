﻿#NoTrayIcon  ;不显示托盘图标
DetectHiddenWindows, On
SetTitleMatchMode, 2

;Set Lock keys permanently  ;学java的时候应该不要用小键盘
SetNumlockState, AlwaysOff  ;on在笔记本上是mjkluio789是否变小键盘0~9，pc是永远开启小键盘功能(小键盘灯永远亮)
SetCapsLockState, AlwaysOff ;禁用CapsLock   
Return



;用一次CapsLock后，再用Alt+Tab切换
#IfWinExist ahk_exe chrome.exe
;~ 表示不影响原有按键1
;$ 表示,在Send包含自身时，用$可以防止重复自调用死循环
~CapsLock::  
{
    WinGet, ChromeID, ID, Chrome
    WinGet, acive_id, ID, A    ;获得当前窗口ID   
    WinActivate,ahk_id %ChromeID% ;激活 Chrome
    ControlSend,,{Space},ahk_id %ChromeID% ;发送按键到 Chrome_WidgetWin_1
    WinActivate,ahk_id %acive_id%    ;返回原来的窗口
    return
}
#IfWinExist

;有两种方法向非活动窗口发送按键 ControlFocus+ControlSend和WinActivate+ControlSend
;异: ControlFocus 不会激活窗口
;同: 不会移动鼠标


; global winID :=0
;其实下面这一段，用一次CapsLock后，再用Alt+Tab切换也不错
; !w::   ;需要操作
; {
    ; ; msgbox, %winID%      
    
    ; if(winID)   ;winID为0则是没有保存
    ; {
        ; WinActivate,ahk_id %winID%    ;返回原来的窗口
        ; winID := 0 
        ; tooltip, jump back      ;在鼠标右侧显示
        ; sleep,800               ;显示800ms  
        ; tooltip,
        ; return 
    ; }
    ; else
    ; {
        ; WinGet, winID, ID, A    ;获得当前窗口ID   
        ; WinActivate ;激活PotPlayer64
        ; ControlSend,,{Space},ahk_class PotPlayer64 ;发送按键到PotPlayer64
        ; tooltip, jump PotPlayer64   ;在鼠标右侧显示
        ; sleep,800                   ;显示800ms  
        ; tooltip,
        ; return
    ; }
; }