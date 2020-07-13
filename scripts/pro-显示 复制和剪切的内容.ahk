;==================================默认功能区2: Ctrl + C / V 增强======================================
#NoTrayIcon  ;不显示托盘图标

;显示 复制和剪切的内容
~^x::
~^c::		;~ 表示次热键并不屏蔽按键原有功能
Sleep, 100	;等待0.1s 强制机械等待剪贴板出现内容 
;clip:=clipboard
StringLeft,clipboard_left,clipboard,500
Tooltip,%clipboard_left%		;在鼠标右侧显示clip(clipboard内容)
Sleep,800
Tooltip,
Return 
