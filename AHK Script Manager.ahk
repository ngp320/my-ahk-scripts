;====================================
; 蓝蓝小雪 作品
; http://wwww.snow518.cn/
; 修改自：http://ahk.5d6d.com/thread-701-1-3.html
; 增加了快捷键、编辑、重载某个单独的脚本
;====================================
#Persistent
#SingleInstance force
Menu, Tray, Icon, %A_ScriptDir%\resources\ahk.ico
SetWorkingDir %A_ScriptDir%\scripts\

DetectHiddenWindows On  ; 允许探测脚本中隐藏的主窗口。
SetTitleMatchMode 2  ; 避免需要指定如下所示的文件的完整路径。

scriptCount = 0

OnExit ExitSub

Menu scripts_unopen, Add, 尚未运行，单击启动, Menu_Tray_Exit
Menu scripts_unopen, ToggleEnable, 尚未运行，单击启动
Menu scripts_unopen, Default, 尚未运行，单击启动
Menu scripts_unopen, Add
Menu scripts_unclose, Add, 正在运行，单击关闭, Menu_Tray_Exit
Menu scripts_unclose, ToggleEnable, 正在运行，单击关闭
Menu scripts_unclose, Default, 正在运行，单击关闭
Menu scripts_unclose, Add
Menu scripts_edit, Add, 单击编辑脚本, Menu_Tray_Exit
Menu scripts_edit, ToggleEnable,单击编辑脚本
Menu scripts_edit, Default, 单击编辑脚本
Menu scripts_edit, Add
Menu scripts_reload, Add, 单击重启脚本, Menu_Tray_Exit
Menu scripts_reload, ToggleEnable, 单击重启脚本
Menu scripts_reload, Default, 单击重启脚本
Menu scripts_reload, Add

; 遍历scripts目录下的ahk文件
Loop, %A_ScriptDir%\scripts\*.ahk
{
    StringRePlace menuName, A_LoopFileName, .ahk

    scriptCount += 1
    scripts%scriptCount%0 := A_LoopFileName

    IfWinExist %A_LoopFileName% - AutoHotkey    ; 已经打开
    {
        Menu scripts_unclose, add, %menuName%, tsk_close
        scripts%scriptCount%1 = 1
    }
    else
    {
        Menu scripts_unopen, add, %menuName%, tsk_open
        scripts%scriptCount%1 = 0
    }
    Menu scripts_edit, add, %menuName%, tsk_edit
    Menu scripts_reload, add, %menuName%, tsk_reload
}


; 增加管理按钮
Menu, Tray, Click, 1
Menu, Tray, Tip, AHK Script Manager
Menu, Tray, Add, AHK Script Manager, Menu_Show
Menu, Tray, ToggleEnable, AHK Script Manager
Menu, Tray, Default, AHK Script Manager
Menu, Tray, Add
Menu, Tray, Add, ＞ 启动脚本, :scripts_unopen
Menu, Tray, Add, ×  关闭脚本, :scripts_unclose
Menu, Tray, Add, @ 编辑脚本, :scripts_edit
Menu, Tray, Add, の 重载脚本, :scripts_reload
Menu, Tray, Add
Menu, Tray, Add, 启动所有脚本, tsk_openAll
Menu, Tray, Add, 关闭所有脚本, tsk_closeAll
Menu, Tray, Add
Menu, Tray, Add, 打开脚本所在文件夹, Menu_Tray_OpenDir
Menu, Tray, Add, 重启所有脚本, Menu_Tray_Reload
Menu, Tray, Add
Menu, Tray, Add, 退出, Menu_Tray_Exit
Menu, Tray, NoStandard

;监听系统消息
OnMessage(0x218, "powermsg")
powermsg(wParam)
{
If (wParam = 7 )
Reload
}

GoSub tsk_openAll

Return

tsk_openAll:
Loop, %scriptCount%
{
    thisScript := scripts%A_index%0
    If  scripts%A_index%1 = 0    ;没打开
    {
        ifinstring, thisScript, !
	    continue
        IfWinNotExist %thisScript% - AutoHotkey    ; 没有打开
            Run %A_ScriptDir%\scripts\%thisScript%

        scripts%A_index%1 = 1

        StringRePlace menuName, thisScript, .ahk
        Menu scripts_unclose, add, %menuName%, tsk_close
        Menu scripts_unopen, delete, %menuName%
    }
}
Return

tsk_open:
Loop, %scriptCount%
{
    thisScript := scripts%A_index%0
    If thisScript = %A_thismenuitem%.ahk  ; match found.
    {
        IfWinNotExist %thisScript% - AutoHotkey    ; 没有打开
            Run %A_ScriptDir%\scripts\%thisScript%

        scripts%A_index%1 := 1

        Menu scripts_unclose, add, %A_thismenuitem%, tsk_close
        Menu scripts_unopen, delete, %A_thismenuitem%

        Break
    }
}
Return

tsk_close:
Loop, %scriptCount%
{
    thisScript := scripts%A_index%0
    If thisScript = %A_thismenuitem%.ahk  ; match found.
    {
        WinClose %thisScript% - AutoHotkey
        scripts%A_index%1 := 0

        Menu scripts_unopen, add, %A_thismenuitem%, tsk_open
        Menu scripts_unclose, delete, %A_thismenuitem%

        Break
    }
}
Return

tsk_closeAll:
Loop, %scriptCount%
{
    thisScript := scripts%A_index%0
    If scripts%A_index%1 = 1  ; 已打开
    {
        WinClose %thisScript% - AutoHotkey
        scripts%A_index%1 = 0

        StringRePlace menuName, thisScript, .ahk
        Menu scripts_unopen, add, %menuName%, tsk_open
        Menu scripts_unclose, delete, %menuName%
    }
}
Return

tsk_edit:
;Run, edit %A_ScriptDir%\scripts\%A_thismenuitem%.ahk
;改用notepad++编辑脚本
npp = C:\Program Files\Notepad++\notepad++.exe
Run, %npp% "%A_ScriptDir%\scripts\%A_thismenuitem%.ahk"
Return

tsk_reload:
Loop, %scriptCount%
{
    thisScript := scripts%A_index%0
    If thisScript = %A_thismenuitem%.ahk  ; match found.
    {
        WinClose %thisScript% - AutoHotkey
        Run %A_ScriptDir%\scripts\%thisScript%
        Break
    }
}
Return


Menu_Tray_Reload:
	Reload
Return

Menu_Tray_OpenDir:
	Run %A_ScriptDir%\scripts
Return

Menu_Tray_Exit:
MsgBox, 49, 脚本管理器, 你确定要退出脚本管理器吗？`n退出管理器并不能关闭已经打开的脚本。`n`n单击“确定”退出脚本管理器`n单击“取消”忽略本操作
IfMsgBox,yes
	ExitApp
IfMsgBox,cancel
Return

ExitSub:
    Loop, %scriptCount%
    {
        thisScript := scripts%A_index%0
        If scripts%A_index%1 = 1  ; 已打开
        {
            WinClose %thisScript% - AutoHotkey
            scripts%A_index%1 = 0

            StringRePlace menuName, thisScript, .ahk
        }
    }
	Menu, Tray, NoIcon
    ExitApp
Return

Menu_Show:
    Menu, Tray, Show
Return