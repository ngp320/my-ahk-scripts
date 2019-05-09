; [输入法]自动切换输入法自用版
; chn.fwt 2017年2月23日 

; 说明：
; ahk_group是个好东西 
;文档 Ahk_group 窗口组

; switchime函数用于小鹤、搜狗等没有问题。如其他输入法无效请自行替换"0000804"

; 脚本：
#NoTrayIcon
 #SingleInstance force
 GroupAdd, EN, Ahk_class Vim
 GroupAdd, EN, Ahk_class TTOTAL_CMD
 GroupAdd, EN, Ahk_class Photoshop

Loop
 {
 WinWaitActive, Ahk_group EN
 switchime(0)
 ActiveHwnd := WinExist("A")
 WinWaitNotActive, Ahk_id %ActiveHwnd%
 }

#if WinActive("Ahk_group EN")
 Shift:: switchime()
 ~Escape:: switchime(0)

switchime(ime := "A")
 {
 if (ime = 1)
{
 DllCall("SendMessage", UInt, WinActive("A"), UInt, 80, UInt, 1, UInt, DllCall("LoadKeyboardLayout", Str,"00000804", UInt, 1))
 }
 else If (ime = 0)
 {
 DllCall("SendMessage", UInt, WinActive("A"), UInt, 80, UInt, 1, UInt, DllCall("LoadKeyboardLayout", Str,, UInt, 1))
 }
 Else If (ime = "A")
 {
 ;ime_status:=DllCall("GetKeyboardLayout","int",0,UInt)
 Send, #{Space}
 }
 }