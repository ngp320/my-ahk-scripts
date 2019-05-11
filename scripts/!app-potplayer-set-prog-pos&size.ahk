
#NoTrayIcon  ;不显示托盘图标
DetectHiddenWindows, On
SetTitleMatchMode, 2

#F4::GetPos()           ;一键获得当前窗口大小位置,并黏贴到粘贴板
#F2::SendPosFixed( )    ;一键设置到指定位置

GetPos(wid=0){
if wid=0
wid:=WinActive("A") ;获得当前选中窗口wid
WinGetPos ,progX,progY,progWidth,progHeight,ahk_id %wid%        ;获得当前选中窗口大小
clipboard = %progX%,%progY%,%progWidth%,%progHeight%
tooltip,%clipboard%    ;在鼠标右侧显示clipboard内容
sleep,800            ;显示800ms
tooltip,
}

sendPosFixed(wid=0){
if wid=0
wid:=WinActive("A") ;获得当前选中窗口wid
WinGetPos ,deskX,deskY,deskWidth,deskHeight ,ahk_class Progman  ;获得屏幕大小
WinGetPos ,progX,progY,progWidth,progHeight,ahk_id %wid%        ;获得当前选中窗口大小
; If (deskWidth > 2600)  
; {  
    ; deskWidth := deskWidth-1080
; }  
newprogWidth  := deskWidth/2
newprogHeight := newprogWidth/1.3
;设置窗口位置大小
WinMove ,ahk_id %wid%,,0,0,1829,1192
}