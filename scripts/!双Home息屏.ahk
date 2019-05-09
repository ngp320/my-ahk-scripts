;作者：Quant（1576157）
;日期：2017年6月30日10:16:12
;功能：给关闭屏幕这件事，设置一个热键！
;使用方法：双击Home键熄灭屏幕，按任意键点亮屏幕
;最新版地址：http://write.blog.csdn.net/postedit/73936914
~Home::
If Home_Presses > 0
{
    Home_Presses += 1
    Return
}
Home_Presses = 1
SetTimer, KeyHome, 300
Return

KeyHome:
SetTimer, KeyHome, Off
If Home_Presses = 2
{
    Sleep 1000
	SendMessage, 0x112, 0xF170, 2,, Program Manager
}
Home_Presses = 0
Return