#NoTrayIcon  ;不显示托盘图标

;复制
~LButton & RButton::
{
send ^c

Sleep, 100	;等待0.1s 强制机械等待剪贴板出现内容 
;clip:=clipboard
StringLeft,clipboard_left,clipboard,500
Tooltip,%clipboard_left%		;在鼠标右侧显示clip(clipboard内容)
Sleep,800
Tooltip,

Return 
}


;粘贴 并回车
~LButton & MButton::
{
Sleep, 300	;等待0.3s 强制机械等待
Send ^v
MouseMove, 0, 30, 0, R  ;
;;;;;;;;;;;;;;;;;;;;;;;;;MouseMove, 50, 0, 0, R  ;鼠标右移50像素
Sleep, 300	
Send {LButton}
Sleep, 300	
Send {Enter}
Sleep, 300	
Return
}


;仅粘贴
~RButton & MButton::
{
Send ^v
Return
}
