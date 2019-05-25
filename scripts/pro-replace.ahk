;===============================特殊功能区2: 复制替换区==========================================
#NoTrayIcon  ;不显示托盘图标

;功能:   AHK批量块注释
;简介:   利用剪贴板和正则匹配，在选中文本的行首加上注释符号
;操作:   先选中文本，再按 [Ctrl] + [K] (与notepad++一样) , 再黏贴(按下 [Ctrl] +V)
;缺陷1: 需要选中所有航
;原因:   AHK注释需要手打很麻烦 
;顺带一说：  不过还是推荐给notepad++ 加一个ahk格式的语法高亮 网址: https://stackoverflow.com/questions/45466733/autohotkey-syntax-highlighting-in-notepad
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
; #IfWinActive ahk_class Notepad     ;此功能，当且仅当打开记事本时有效【前】
; ~^k::                    ;~表示不影响原有按键
; {
; Send ^c                ;因为剪切板中是字符串的形式, 所以要用两行正则替换
; clipboard := RegExReplace(clipboard, "`n","`n;")    ;匹配 [\n] 替换为 [\n;]号     
; clipboard := RegExReplace(clipboard, "A)^",";")    ;A)是一个模式, 表示强制匹配开头, 匹配开头, 在其前面添加[;]号
; StringLeft,clipboard_left,clipboard,500        ;取剪贴板前500个字符, 避免[Ctrl]+[A]时显示太多, 影响视觉
; tooltip,%clipboard_left%    ;在鼠标右侧显示clipboard内容
; sleep,800            ;显示800ms
; tooltip,
; }
; return

; #IfWinActive 

;在每一行行首加2个空格
~^!Space::                    ;~表示不影响原有按键
{
Send ^c                ;因为剪切板中是字符串的形式, 所以要用两行正则替换
clipboard := RegExReplace(clipboard, "`n","`n  ")    ;匹配 [\n] 替换为 [\n;]号     
clipboard := RegExReplace(clipboard, "A)^","  ")    ;A)是一个模式, 表示强制匹配开头, 匹配开头, 在其前面添加[;]号
StringLeft,clipboard_left,clipboard,500        ;取剪贴板前500个字符, 避免[Ctrl]+[A]时显示太多, 影响视觉
tooltip,%clipboard_left%    ;在鼠标右侧显示clipboard内容
sleep,800            ;显示800ms
tooltip,
}
return

;空格 → 下划线
~^+Space::                    ;~表示不影响原有按键
{
Send ^c                ;因为剪切板中是字符串的形式, 所以要用两行正则替换
clipboard := RegExReplace(clipboard, " ","_")    ;A)是一个模式, 表示强制匹配开头, 匹配开头, 在其前面添加[;]号
StringLeft,clipboard_left,clipboard,500        ;取剪贴板前500个字符, 避免[Ctrl]+[A]时显示太多, 影响视觉
tooltip,%clipboard_left%    ;在鼠标右侧显示clipboard内容
sleep,800            ;显示800ms
tooltip,
}
return

;功能:   文本中的 [Tab]键 替换为 空格。(稍微变形，需要再手动维修，对强迫症患者来说，对齐真的很重要)
;操作:   先选中文本，再按 [Ctrl] + [Alt] + [Tab] , 再黏贴(按下 [Ctrl] +V)，会有稍微变形 原因如下 ↓ 
;缺陷1: 原理是替换空格。而tab键能够4个空格内，自动适应，所以tab实际可能等于1~4个空格，替换会导致轻微变形
;原因:   typora的[Tab]字符在hexo的markdown渲染后会乱，故方案为，写作时用[Tab]键节约时间，写完后全部替换为空格
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
^!Tab::     
Send ^c
clipboard := StrReplace(clipboard, A_Tab, A_Space A_Space A_Space A_Space)
StringLeft,clipboard_left,clipboard,500
tooltip,%clipboard_left%
sleep,800
tooltip,
return


;功能:   复制选中文本, 把 [\] 替换为 [/]。
;操作:   先选中文本，再按 [Ctrl] + [Alt] + [\] , 再黏贴(按下 [Ctrl] +V)
;原因:   typora的[Tab]字符在hexo的markdown渲染后会乱，故方案为，写作时用[Tab]键节约时间，写完后全部替换为空格
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
^!\::        
Send ^c
StringReplace, clipboard, clipboard, \, /, All   
StringLeft,clipboard_left,clipboard,500
tooltip,%clipboard_left%        ;在鼠标右侧显示clipboard内容
sleep,800
tooltip,
return

;功能:   复制选中文本, 把 [\] 替换为 [/]。
;操作:   先选中文本，再按 [Ctrl] + [Alt] + [\] , 再黏贴(按下 [Ctrl] +V)
;原因:   typora的[Tab]字符在hexo的markdown渲染后会乱，故方案为，写作时用[Tab]键节约时间，写完后全部替换为空格
;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
^!-::        
Send ^c
StringReplace, clipboard, clipboard, _, -, All   
StringLeft,clipboard_left,clipboard,500
tooltip,%clipboard_left%        ;在鼠标右侧显示clipboard内容
sleep,800
tooltip,
return

; ;临时
; ^!q::  
; Send, {F2}  
; Sleep, 50
; Send, ^c
; StringReplace, clipboard, clipboard, _, -, All   
; StringReplace, clipboard, clipboard,%A_SPACE%,-, All   
; Send, ^v
; Sleep, 50
; Send, {Enter}
; return