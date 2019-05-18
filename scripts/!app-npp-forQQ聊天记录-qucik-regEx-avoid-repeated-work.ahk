#NoTrayIcon  ;不显示托盘图标
DetectHiddenWindows, On
SetTitleMatchMode, 2
DetectHiddenText, On

; 1: 窗口标题必须以指定的 WinTitle 开头.
; 2：窗口标题的某个位置必须包含 WinTitle。 
; 3: 窗口标题必须准确匹配 WinTitle.


#IfWinActive ahk_class Notepad++
;~ 表示不影响原有按键1
; 需要切换到源码模式

^!1::  
{
    switchime(0)    ;强制英文小写 
    
    Send ^h     ;打开 Notepad++ 替换
    Sleep,100    ;必须有delay, 不然会乱套
    Send !g     ;使用 Notepad++ 替换的 自带快捷键, 切换到 [正则表达式模式]
    writeIn("src","(\d\d)\r\n")
    writeIn("replace","$1\r\n>")
    replace()
    
    
    Send ^h     ;打开 Notepad++ 替换
    Sleep,100    ;必须有delay, 不然会乱套
    Send !g     ;使用 Notepad++ 替换的 自带快捷键, 切换到 [正则表达式模式]
    writeIn("src","^([^\x00-\xff])")
    writeIn("replace","<font size=2>$1")
    replace()
    
    Send ^h     ;打开 Notepad++ 替换
    Sleep,100    ;必须有delay, 不然会乱套
    Send !g     ;使用 Notepad++ 替换的 自带快捷键, 切换到 [正则表达式模式]
    writeIn("src","^([a-zA-Z0-9(])")
    writeIn("replace","<font size=2>$1")
    replace()
    
    Send ^h     ;打开 Notepad++ 替换
    Sleep,100    ;必须有delay, 不然会乱套
    Send !g     ;使用 Notepad++ 替换的 自带快捷键, 切换到 [正则表达式模式]
    writeIn("src","(\d\d)\r\n")
    writeIn("replace","$1</font>\r\n")
    replace()
    
    Send ^h     ;打开 Notepad++ 替换
    Sleep,100    ;必须有delay, 不然会乱套
    Send !g     ;使用 Notepad++ 替换的 自带快捷键, 切换到 [正则表达式模式]
    writeIn("src","<font")
    writeIn("replace","\r\n<font")
    replace()


    return
}
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
    IniWrite, %inputStr%, md2typora.ini, Z-Database, %keyName%
    return
}
readOut(keyName)
{
    IniRead, textContent, md2typora.ini, Z-Database, %keyName%
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
