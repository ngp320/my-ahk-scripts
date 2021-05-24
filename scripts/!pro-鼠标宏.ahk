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



;仅粘贴  右键+中键
~LButton & MButton::
{
Send ^v
Return
}
