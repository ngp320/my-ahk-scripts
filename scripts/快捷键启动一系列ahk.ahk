#NoTrayIcon  ;不显示托盘图标

; 创建数组后, 初始为空:
Array := Object()

#F12::
{
;启动并保存进程ID
Run, !set-capsLock-off.etc.ahk              , , ,runID  
Array.Insert(runID)
Run, !9potplayer-custom.ahk                 , , ,runID ;因为pot...用到了CapsLock键,所以得在set..之后运行
Array.Insert(runID)
Run, !切换窗口置顶win+F1.ahk                , , ,runID
Array.Insert(runID)
Run, !set-prog-pos&size.ahk                 , , ,runID
Array.Insert(runID)
Run, !AutoEnglishKeyboard-ever1mins.ahk     , , ,runID
Array.Insert(runID)
Run, !md2typora.ahk                         , , ,runID
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
