#NoTrayIcon  ;不显示托盘图标
;Re: loop循环停止失效  11 Oct 2018, 04:09
;当一个热键子程序被Pause卡住后，或者Loop无限循环后，再次按热键是没用的，因为默认设置每个热键允许同时存在一个线程。
;当一个线程没有执行完毕时，其他热键是不能中止它的运行的（可以暂停/继续），除非Reload重启。


!#w::
Hotkey, %A_ThisHotkey%,, T2 ; 这里修改每个热键允许同时存在2个线程
if (F2_ok)
{
Reload
exitapp
return
}
F2_ok:=1
loop
{
Send,{w down}
Sleep,500
}
exitapp
return

