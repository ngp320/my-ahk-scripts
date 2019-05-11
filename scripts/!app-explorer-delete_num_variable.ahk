;#NoTrayIcon  ;不显示托盘图标
Prefix_delete_num()
Delete_lines(delete_lines_variable)
{
    loop, 1
    {
        Send,{F2}{Home}
        loop, 34
        {
            Send,{Delete}
        }
        sleep, 10
        Send,{F2}{Enter}{Home}
        sleep, 10
        Send,{F2}{Enter}{Home}
    }
}
!q1::
{
    InputBox, delete_num_variable, tips , Please enter a number  of rows you want to delete, , 640, 480
    delete_lines_variable(delete_num_variable)
}
return


writeIn(keyName)
{
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
    
    IniWrite, %textContent%, Z-Database.ini, Z-Database, %keyName%
    
    tooltip, %keyName%= %textContent%    ;在鼠标右侧显示clipboard内容
    sleep,800            ;显示800ms
    tooltip,
    return
}



