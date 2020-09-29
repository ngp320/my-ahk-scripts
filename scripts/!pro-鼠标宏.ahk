#NoTrayIcon  ;不显示托盘图标

;复制  左键框住待复制内容, 不要松开, 按下右键即可复制. 
;		配合 pro-显示 复制和剪切的内容.ahk 效果明显
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


;粘贴 并鼠标下移30像素 并回车  左键+中键
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


;仅粘贴  右键+中键
~RButton & MButton::
{
Send ^v
Return
}
