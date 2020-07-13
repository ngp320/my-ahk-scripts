#NoTrayIcon  ;不显示托盘图标
DetectHiddenWindows, On
SetTitleMatchMode, 2
DetectHiddenText, On

; 1: 窗口标题必须以指定的 WinTitle 开头.
; 2：窗口标题的某个位置必须包含 WinTitle。 
; 3: 窗口标题必须准确匹配 WinTitle.


#IfWinActive ahk_exe idea64.exe
;~ 表示不影响原有按键1
; 需要切换到源码模式

^!1::  
{
    switchime(0)    ;强制英文小写 
    

    Sleep,100    ;必须有delay, 不然会乱套
    writeIn("src","funtl")
    Sleep,100    ;必须有delay, 不然会乱套
    writeIn("replace","ngp")
    Sleep,100    ;必须有delay, 不然会乱套
    replace()

    
    ;ahk函数变量不可以传递两次, 或者只是我不熟练(没看到对应的文档)  可以用python+ahk呀...哇,想想就666
    return
}

^!2::  
{
    switchime(0)    ;强制英文小写 
    

    Sleep,100    ;必须有delay, 不然会乱套
    writeIn("src","myshop")
    Sleep,100    ;必须有delay, 不然会乱套
    writeIn("replace","myweb")
    Sleep,100    ;必须有delay, 不然会乱套
    replace()

    
    ;ahk函数变量不可以传递两次, 或者只是我不熟练(没看到对应的文档)  可以用python+ahk呀...哇,想想就666
    return
}
#IfWinActive 

replace()
{
    Sleep,100    ;必须有delay, 不然会乱套
    Send ^+r     ;打开 idea64 替换
    Sleep,100    ;必须有delay, 不然会乱套
    readOut("src")
    Sleep,100    ;必须有delay, 不然会乱套
    Send ^v
    
    Sleep,100    ;必须有delay, 不然会乱套
    Send,{Tab}
    Sleep,100    ;必须有delay, 不然会乱套
    Send ^a
    Sleep,100    ;必须有delay, 不然会乱套
    readOut("replace")
    Sleep,100    ;必须有delay, 不然会乱套
    Send ^v
    
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
