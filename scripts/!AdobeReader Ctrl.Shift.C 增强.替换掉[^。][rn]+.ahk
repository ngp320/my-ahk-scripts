#NoTrayIcon  ;不显示托盘图标
~+^c::		;~ 表示次热键并不屏蔽按键原有功能
Sleep, 100	;等待0.1s 强制机械等待剪贴板出现内容 
clipboard := RegExReplace(clipboard, "[^。][\r\n]+","")  
return 