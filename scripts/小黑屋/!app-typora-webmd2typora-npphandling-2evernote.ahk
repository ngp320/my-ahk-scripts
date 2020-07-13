#NoTrayIcon  ;不显示托盘图标
DetectHiddenWindows, On
SetTitleMatchMode, 2
DetectHiddenText, On

; 1: 窗口标题必须以指定的 WinTitle 开头.
; 2：窗口标题的某个位置必须包含 WinTitle。 
; 3: 窗口标题必须准确匹配 WinTitle.

#IfWinExist ahk_class Notepad++
#IfWinActive ahk_exe Typora.exe
;~ 表示不影响原有按键1
; 需要切换到源码模式

^!e::  
{
    switchime(0)    ;强制英文小写 
    Send ^a     ;全选
    Send ^c     ;复制
    WinActivate, ahk_class Notepad++    ;激活 Notepad++
    Send ^n     ;开启新标签页
    Send ^v     ;黏贴
    
    Send ^h     ;打开 Notepad++ 替换
    Sleep,100    ;必须有delay, 不然会乱套
    Send !g     ;使用 Notepad++ 替换的 自带快捷键, 切换到 [正则表达式模式]
    writeIn("src","^[ ]{0,5}[0-9]{1,3}[\n\r]{1,2}")
    writeIn("replace","")
    replace()
    ;ahk函数变量不可以传递两次, 或者只是我不熟练(没看到对应的文档)  可以用python+ahk呀...哇,想想就666

    
    Send ^h     ;打开 Notepad++ 替换
    Sleep,100    ;必须有delay, 不然会乱套
    Send !g     ;使用 Notepad++ 替换的 自带快捷键, 切换到 [正则表达式模式]
    writeIn("src","\(http.*\)")
    writeIn("replace","")
    replace()
        
    ready()
    WinActivate, ahk_exe Typora.exe    ;激活 Typora
    return
}

#IfWinExist
#IfWinActive 

replace()
{
    Send !f     ;使用 Notepad++ 替换的 自带快捷键, 输入 被替换的字符串
    Sleep,100    ;必须有delay, 不然会乱套
    readOut("src")
    Send ^v
    
    Send !l     ;使用 Notepad++ 替换的 自带快捷键, 输入 替换后的字符串
    Sleep,100    ;必须有delay, 不然会乱套
    readOut("replace")
    Send ^v
    
    Sleep,100    ;必须有delay, 不然会乱套
    Send !a     ;使用 Notepad++ 替换的 自带快捷键, 全部替换
}

writeIn(keyName,inputStr)
{
    IniWrite, %inputStr%, Z-Database.ini, Z-Database, %keyName%
    return
}
readOut(keyName)
{
    IniRead, textContent, Z-Database.ini, Z-Database, %keyName%
    ; msgbox, %keyName% 
    ; msgbox, %textContent% 
    clipboard = %textContent%    
    return 
}
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
ready()
{
    Send,{Esc}
    Send ^a
    Send ^c
    loop, 10    ;撤销操作方便npp关闭
    {
        Send ^z
    }
    StringLeft,clipboard_left,clipboard,500        ;取剪贴板前500个字符, 避免[Ctrl]+[A]时显示太多, 影响视觉
    tooltip,%clipboard_left%    ;在鼠标右侧显示clipboard内容
    sleep,800            ;显示800ms
    tooltip,
}