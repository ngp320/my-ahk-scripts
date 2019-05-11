#SingleInstance,force
do_kill =
(
AutoHotkey.exe
)
killprocess(do_kill)
return


killprocess(do_kill){
RunWait, %ComSpec% /c tasklist >%A_Temp%\tasklist.tmp, , Hide
Loop
    {
    FileReadLine, line, %A_Temp%\tasklist.tmp, %A_Index%
    if errorlevel
        Break
    IfInString, line, .exe
        {
        StringSplit,var, line, %A_Space%,
        ToolTip 不处理:%var1%
        IfInString, do_kill, %var1%
            {
                runwait, %ComSpec% /c taskkill /f /IM %var1%, , Hide
                ToolTip, 杀掉%var1%
                Sleep,1000
            } ;END IF DO_KILL
        } ;END IF LINE
    } ;END LOOP
    ToolTip,处理完成,2秒后自动退出。
    Sleep,2000
    ExitApp
}
