#NoTrayIcon  ;不显示托盘图标
DetectHiddenWindows, On
SetTitleMatchMode, 2

SetCapsLockState, AlwaysOff ;禁用CapsLock   
Return



;用一次CapsLock后，再用Alt+Tab切换
; #IfWinExist ahk_exe idea64.exe  ;以下临时修改
#IfWinExist ahk_exe chrome.exe
;~ 表示不影响原有按键
;$ 表示,在Send包含自身时，用$可以防止重复自调用死循环
CapsLock::  
{

	if winc_presses > 0 ; SetTimer 已经启动, 所以我们记录键击.
	{
		winc_presses += 1
		return
	}
	; 否则, 这是新开始系列中的首次按下. 把次数设为 1 并启动
	; 计时器：
	winc_presses = 1
	SetTimer, KeyWinC, 400 ; 在 400 毫秒内等待更多的键击.
	return

	KeyWinC:
	SetTimer, KeyWinC, off
	if winc_presses = 1 ; 此键按下了一次.
	{
		Send,{Alt down}{Tab}{Alt up}
		sleep,200         
		Send, { Space }
		sleep,100  	
		Send,{Alt down}{Tab}{Alt up}
		sleep,100  	
	}
	else if winc_presses = 2 ; 此键按下了两次.
	{
		Send,{Alt down}{Tab}{Alt up}
		sleep,200                   ;延迟100ms 
		Send, { Left }
		sleep,100       
		Send, { Left }
		sleep,100   		
		Send, { Space }
		sleep,100  	
		Send,{Alt down}{Tab}{Alt up}
		sleep,100  
		;显示点了2次
		msg=2 
		Tooltip, %msg%		;在鼠标右侧显示clip(clipboard内容)
		Sleep ,200 
		Tooltip,
	}
	else if winc_presses > 2
	{
		;显示点了3次
		msg=2 
		Tooltip, %msg%		;在鼠标右侧显示clip(clipboard内容)
		Sleep ,800 
		Tooltip,
	}
	; 不论触发了上面的哪个动作, 都对 count 进行重置
	; 为下一个系列的按下做准备:
	winc_presses = 0
	return

	
}
#IfWinExist
