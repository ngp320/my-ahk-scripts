#NoTrayIcon  ; 不显示托盘图标
DetectHiddenWindows, On
SetTitleMatchMode, 2



; 用一次 CapsLock 后，再用 Alt+Tab 切换
#IfWinExist ahk_class PotPlayer64

;~ 表示不影响原有按键 1
;$ 表示，在 Send 包含自身时，用 $ 可以防止重复自调用死循环
 ~CapsLock::  
{
    WinGet, acive_id, ID, A    ; 获得当前窗口 ID   
    WinActivate ; 激活 PotPlayer64
    ControlSend,,{Space},ahk_class PotPlayer64 ; 发送按键到 PotPlayer64
    WinActivate,ahk_id %acive_id%    ; 返回原来的窗口
     return
}
~!CapsLock::  
{
    ; WinGet, acive_id, ID, A    ; 获得当前窗口 ID   
    WinActivate ; 激活 PotPlayer64
    ControlSend,,{Space},ahk_class PotPlayer64 ; 发送按键到 PotPlayer64
    ; WinActivate,ahk_id % acive_id%    ; 返回原来的窗口
     return
}

#IfWinExist

#IfWinActive ahk_class PotPlayer64
; 使 Ctrl+S 在 PotPlayer64 中失效，经常习惯性的按到，导致要重新开 PotPlayer64
^s::return
#IfWinActive 

; 有两种方法向非活动窗口发送按键 ControlFocus+ControlSend 和 WinActivate+ControlSend
; 异: ControlFocus 不会激活窗口
 ; 同：不会移动鼠标


 ; global winID :=0
; 其实下面这一段，用一次 CapsLock 后，再用 Alt+Tab 切换也不错
 ; !w::   ; 需要操作
 ; {
    ; ; msgbox, %winID%      
    
    ; if (winID)   ;winID 为 0 则是没有保存
    ; {
        ; WinActivate,ahk_id % winID%    ; 返回原来的窗口
        ; winID := 0 
        ; tooltip, jump back      ; 在鼠标右侧显示
        ; sleep,800               ; 显示 800ms  
        ; tooltip,
        ; return 
    ; }
    ; else
    ; {
        ; WinGet, winID, ID, A    ; 获得当前窗口 ID   
        ; WinActivate ; 激活 PotPlayer64
        ; ControlSend,,{Space},ahk_class PotPlayer64 ; 发送按键到 PotPlayer64
        ; tooltip, jump PotPlayer64   ; 在鼠标右侧显示
        ; sleep,800                   ; 显示 800ms  
        ; tooltip,
        ; return
    ; }
; }