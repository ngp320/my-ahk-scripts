;===============================特殊功能区3: 复制/打开 文件路径区===============================
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



;[Win] + Z ;一键拷贝文件路径 ;
#Z::
clipboard := % Explorer_GetSelection(hwnd) ;调用了 函数
Tooltip,%clipboard%	;在鼠标右侧显示【拷贝的文件路径】
Sleep,800
Tooltip,
return

;一键用notepad++[打开选中的文件]or[选中文件夹]的所有子文件
;路径中有空格就会很糟糕 【解决策略：加双引号就好，win自身的Program files也是有空格的】
;[Win] + E
#E::
path :=% Explorer_GetSelection(hwnd) ;调用了 函数
Software = "C:\Program Files (x86)\Notepad++\notepad++.exe"
Run, %Software% "%path%"
return

;#######################################旧版本################################
;[Win] + E
;#E::
;path :=% Explorer_GetSelection(hwnd) ;调用了 函数;
;Software = C:\Program Files (x86)\Notepad++\notepad++.exe
;IfInString, path, %A_Space%
;{
;	Tooltip, path中有空格	;在鼠标右侧显示【错误信息】
;	Sleep,800
;	Tooltip,
;}
;else{
;	Run, %Software% %path%
;}
;return

;C:\Users\NGP\Desktop\12 23
;numOfSpacesInPath := RegExMatch(clipboard,"\s") 【正则匹配被取代，有更好的】