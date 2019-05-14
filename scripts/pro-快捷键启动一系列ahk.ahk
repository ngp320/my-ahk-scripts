#NoTrayIcon  ;不显示托盘图标

; 创建数组后, 初始为空:
Array := Object()

#F12::
{
;启动并保存进程ID
Run, !pro-set-capsLock-off.ahk              , , ,runID
Array.Insert(runID)
Run, !app-potplayer-pause&start.ahk         , , ,runID ;因为pot...用到了CapsLock键,所以得在pro-set-capsLock-off之后运行
Array.Insert(runID)
Run, !pro-切换窗口置顶win+F1.ahk            , , ,runID
Array.Insert(runID)
Run, !app-sougou-autoswitch-englishkeyboard-ever2mins.ahk   , , ,runID
Array.Insert(runID)
Run, !app-typora-webmd2typora-npphandling-2evernote.ahk     , , ,runID
Array.Insert(runID)
return
}
^!F12::
{
;kill指定进程
    for index,element in array
    {
        ; msgbox, %index% + %element%
        Run, taskkill /PID %element% /F,,Hide
    }
}
