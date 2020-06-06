#NoTrayIcon         ;不显示托盘图标
IfWinExist ahk_exe Acrobat.exe
~^+c::              ;~ 表示次热键并不屏蔽按键原有功能
Send, ^c
Sleep, 300          ;等待0.1s 强制机械等待剪贴板出现内容 
clipboard := RegExReplace(clipboard, "[^。][\r\n]+","")  
tooltip,%clipboard% ;在鼠标右侧显示clipboard内容
sleep,500
tooltip,
return 
IfWinExist

