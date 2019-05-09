#NoTrayIcon  ;不显示托盘图标
; writeIn(keyName,inputStr)
; {
    ; IniWrite, %inputStr%, RememberEditMe.ini, Database, %keyName%
    ; return
; }
; readOut(keyName)
; {
    ; IniRead, textContent, RememberEditMe.ini, Database, %keyName%
    ; clipboard = %textContent%   
    ; ; Send, ^v
    ; return
; }
writeIn(keyName)
{
    clip_temp := clipboard      ;暂存clipboard
    Send,^c
    FoundPos := RegExMatch(clipboard, "`n")
    if(FoundPos!=0) ;如果字符串中有换行
    {
        tooltip, 字符串中有换行，保存失败    
        sleep,800            ;显示800ms
        tooltip,
        return  ;并退出
    }
    textContent := clipboard
    
    IniWrite, %textContent%, clipboard12345Database.ini, Database, %keyName%
    
    tooltip, %keyName%= %textContent%    ;在鼠标右侧显示clipboard内容
    sleep,800            ;显示800ms
    tooltip,
    clipboard := clip_temp      ;还原clipboard
    return
}

readOut(keyName)
{
    IniRead, textContent, clipboard12345Database.ini, Database, %keyName%
    ; msgbox, %textContent% 
    clip_temp := clipboard      ;暂存clipboard
    clipboard = %textContent%   ;只有用函数的时候用:=????
    Send, ^v
    clipboard := clip_temp      ;还原clipboard
    return
}

^1:: writeIn("1") 
^2:: writeIn("2") 
^3:: writeIn("3") 
^4:: writeIn("4") 
^5:: writeIn("5") 


!1:: readOut("1")
!2:: readOut("2")
!3:: readOut("3")
!4:: readOut("4")
!5:: readOut("5")
