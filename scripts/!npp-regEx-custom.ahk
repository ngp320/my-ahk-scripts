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
    
    ;#########################处理 [数字标题] 行前的0~n个空行替换为1个空行################################
    Send ^h     ;打开 Notepad++ 替换
    Sleep,100    ;必须有delay, 不然会乱套
    Send !g     ;使用 Notepad++ 替换的 自带快捷键, 切换到 [正则表达式模式]
    ; CR -- 回车符,c语言'\r'
    ; LF -- 换行符, c语言'\n'
    writeIn("src","(\r\n)*(^\[[\d]{1,3}\].*\r\n)")
    writeIn("replace","$1$1$2")
    replace()

    ;##############################处理 [数字标题] 后面的0~n个空行替换为0个空行################################
    Send ^h     ;打开 Notepad++ 替换
    Sleep,100    ;必须有delay, 不然会乱套
    Send !g     ;使用 Notepad++ 替换的 自带快捷键, 切换到 [正则表达式模式]
    ; CR -- 回车符,c语言'\r'
    ; LF -- 换行符, c语言'\n'
    writeIn("src","(^\[[\d]{1,3}\].*\r\n)(\r\n)*")
    writeIn("replace","$1")
    replace()
    
    ;##############################开头 如果不是标题/空行, 则在标题后增加 ">" ################################
    Send ^h     ;打开 Notepad++ 替换
    Sleep,100    ;必须有delay, 不然会乱套
    Send !g     ;使用 Notepad++ 替换的 自带快捷键, 切换到 [正则表达式模式]
    writeIn("src","^([^0-9\n\r])")
    writeIn("replace",">$1")
    replace()
    ;ahk函数变量不可以传递两次, 或者只是我不熟练(没看到对应的文档)  可以用python+ahk呀...哇,想想就666



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
    IniWrite, %inputStr%, md2typora.ini, Database, %keyName%
    return
}
readOut(keyName)
{
    IniRead, textContent, md2typora.ini, Database, %keyName%
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
