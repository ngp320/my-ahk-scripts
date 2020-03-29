;#NoTrayIcon  ;不显示托盘图标
loop ;循环开始
{
    SetCapsLockState,off
    switchime(0)    ;强制英文小写
    loop, 2    ;等待2m
    {
        loop, 60    ;等待60s
        {
            sleep,1000 ;等待1秒
        }
    }
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