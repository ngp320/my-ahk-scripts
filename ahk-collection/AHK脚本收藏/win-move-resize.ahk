; #SingleInstance force
; #NoTrayIcon
;WinGetPos ,,,deskWidth,deskHeight ,ahk_class Progman

+#j::  ;窗口上移
wid:=WinActive("A") ;;get activate window id 
WinGetPos ,x,y,,,ahk_id %wid%
WinMove  ,ahk_id %wid%,, x,y+40
return

+#k::  ;窗口下移
wid:=WinActive("A")
WinGetPos ,x,y,,,ahk_id %wid%
WinMove  ,ahk_id %wid%,, x,y-40
return

+#h::  ;窗口左移
wid:=WinActive("A")
WinGetPos ,x,y,,,ahk_id %wid%
WinMove  ,ahk_id %wid%,, x-50,y
return

+#l::  ;窗口右移
 if A_OSVersion in WIN_7,WIN_VISTA  ; Note: No spaces around commas.
{
    ; enable  lockscreen for win7
    ; disable lock screen on window7
    ; should run as administer
    RegWrite, REG_DWORD,  HKEY_CURRENT_USER,Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation,1
}
wid:=WinActive("A")
 WinGetPos ,x,y,,,ahk_id %wid%
 WinMove  ,ahk_id %wid%,, x+50,y
 return

!#j::  ;窗口缩小
wid:=WinActive("A")
WinGetPos ,x,y,w,h,ahk_id %wid%
WinMove  ,ahk_id %wid%,,x+w*0.1,y+h*0.1,w*0.8,h*0.8
return

!#k::  ;窗口放大
wid:=WinActive("A")
WinGetPos ,x,y,w,h,ahk_id %wid%
WinMove  ,ahk_id %wid%,,x-w*0.05,y-h*0.05,w*1.1,h*1.1
return



send2Pos1(wid=0){
if wid=0
wid:=WinActive("A")
WinGetPos ,deskX,deskY,deskWidth,deskHeight ,ahk_class Progman
WinMove ,ahk_id %wid%,,%deskX%,%deskY%,deskWidth/2,%deskHeight%
}
send2Pos2(wid=0){
if wid=0
wid:=WinActive("A")
WinGetPos ,deskX,deskY,deskWidth,deskHeight ,ahk_class Progman
WinMove ,ahk_id %wid%,,deskWidth/2,%deskY%,deskWidth/2,%deskHeight%
}
send2Pos3(wid=0){
if wid=0
wid:=WinActive("A")
WinGetPos ,deskX,deskY,deskWidth,deskHeight ,ahk_class Progman
WinMove ,ahk_id %wid%,,%deskX%,%deskY%,%deskWidth%,deskHeight/2
}
send2Pos4(wid=0){
if wid=0
wid:=WinActive("A")
WinGetPos ,deskX,deskY,deskWidth,deskHeight ,ahk_class Progman
WinMove ,ahk_id %wid%,,%deskX%,deskHeight/2,%deskWidth%,deskHeight/2
}
send2PosCenter(wid=0){
if wid=0
wid:=WinActive("A")
WinGetPos ,deskX,deskY,deskWidth,deskHeight ,ahk_class Progman
WinMove ,ahk_id %wid%,,deskWidth*0.1,deskHeight*0.1,deskWidth*0.8,deskHeight*0.8
}
send2PosFullScreen(wid=0){
if wid=0
wid:=WinActive("A")
WinGetPos ,deskX,deskY,deskWidth,deskHeight ,ahk_class Progman
WinMove ,ahk_id %wid%,,%deskX%,%deskY%,deskWidth,deskHeight
}

toggleMaximize(wid=0){
    if wid=0
    wid:=WinActive("A")
    WinGetClass, winClass, ahk_id %wid%
    ; MsgBox ,%winClass%
    WinGet,wstatus,MinMax,ahk_id %wid%
    if (wstatus=1){ ;;maximized ,
      if (winClass != "WorkerW" && winClass!= "ProgMan" && winClass != "Shell_TrayWnd")
        WinSet ,Style,+0xc00000,A ;add title bar
      WinRestore ,ahk_id %wid% 
    }else{ ;;minimized 
    WinMaximize , ahk_id %wid% 
    WinSet ,Style,-0xc00000,A ;no title bar 
  }
}
#f1::Send2Pos1( )  ;left
#f2::Send2Pos2( )  ;right
#f3::Send2Pos3( )  ;up
#f4::Send2Pos4( )  ;down
#f5::Send2PosCenter( )  ;center
#f11::send2PosFullScreen()  ;fullScreen

#m::
  toggleMaximize()  ;fullScreen and 还原
return
#f12::  ;锁定窗口，不能移动和按键退出  =。= 没有还原，但是可以任务栏右键退出
    if A_OSVersion in WIN_7,WIN_VISTA  ; Note: No spaces around commas.
    {
  ; enable  lockscreen for win7
        RegWrite, REG_DWORD,  HKEY_CURRENT_USER,Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation,0
        Sleep, 200
        DllCall("LockWorkStation")
        Sleep, 200
        SendMessage,0x112,0xF170,2,,Program Manager
    }
    else
    {
        Send #l
    }
 return