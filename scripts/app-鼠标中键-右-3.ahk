#NoTrayIcon  ;不显示托盘图标
Explorer_GetSelection(hwnd="")   ;函数
{  
    WinGet, process, processName, % "ahk_id" hwnd := hwnd? hwnd:WinExist("A")  
    WinGetClass class, ahk_id %hwnd%  
    if (process != "explorer.exe")  
        return  
    if (class ~= "Progman|WorkerW") {  
            ControlGet, files, List, Selected Col1, SysListView321, ahk_class %class%  
            Loop, Parse, files, `n, `r  
                ToReturn .= A_Desktop "\" A_LoopField "`n"  
        } else if (class ~= "(Cabinet|Explore)WClass") {  
            for window in ComObjCreate("Shell.Application").Windows 
			{
				try{
                if (window.hwnd==hwnd)  
                    sel := window.Document.SelectedItems  
				}catch e {
					continue
				}
			}
            for item in sel  
                ToReturn .= item.path "`n"  
        }  
    return Trim(ToReturn,"`n")  
} 


#IfWinActive ahk_exe explorer.exe
~MButton::
{
	Send {RButton}
	Sleep 500
	Send {3}
	;path :=% Explorer_GetSelection(hwnd) ;调用了 函数
	;Software = "C:\Windows\explorer.exe"
	;Run, %Software% "%path%"
}
#IfWinActive