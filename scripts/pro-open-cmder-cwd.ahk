;===============================特殊功能区5: 程序切换区==========================================
#NoTrayIcon  ;不显示托盘图标
 ;-- DOSCOMMANDHERE XP ctrl+alt+d  ahk_basic
#If WinActive("ahk_class CabinetWClass") ; explorer
    !r::
    path := get_current_explorer_path()
    Software = "D:\0Software\cmder\Cmder.exe"
    Run, %Software% "%path%"
    
    Tooltip,%path%  ;在鼠标右侧显示【拷贝的文件路径】
    Sleep,800
    Tooltip,
    return
#If


get_current_explorer_path()
{
    WinGetTitle, ActiveTitle, A
    If InStr(ActiveTitle, "\")  ; If the full path is displayed in the title bar (Folder Options)
        Fullpath := ActiveTitle
    else
    If InStr(ActiveTitle, ":") ; If the title displayed is something like "DriveName (C:)"
    {
        Fullpath := SubStr(ActiveTitle, -2)
        Fullpath := SubStr(Fullpath, 1, -1)
    }
    else    ; If the full path is NOT displayed in the title bar 
    ; https://autohotkey.com/boards/viewtopic.php?p=28751#p28751
    for window in ComObjCreate("Shell.Application").Windows
    {
        try Fullpath := window.Document.Folder.Self.Path
        SplitPath, Fullpath, title
        If (title = ActiveTitle)
            break
    }
    ; MsgBox, %Fullpath%
    return Fullpath
}
