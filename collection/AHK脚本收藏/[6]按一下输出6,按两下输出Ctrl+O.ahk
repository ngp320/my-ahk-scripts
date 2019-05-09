$6::
if pressesCount > 0 ; ＞0说明SetTimer 已经启动了，按键次数递增
{
    pressesCount += 1
    return
}
;否则，这是新一系列按键的首次按键。将计数设重置为 1 ，并启动定时器：
pressesCount = 1
SetTimer, WaitKey, 400 ;在 400 毫秒内等待更多的按键。
return

WaitKey:
SetTimer, WaitKey, off
if pressesCount = 1 ;该键已按过一次。
{
    Gosub singleClick
}
else if pressesCount = 2 ;该键已按过两次。
{
	Gosub doubleClick
}
else if pressesCount > 2
{
    Gosub trebleClick
}
;不论上面哪个动作被触发，将计数复位以备下一系列的按键：
pressesCount = 0
return

singleClick:
send 6
return

doubleClick:
send ^o
return

trebleClick:
MsgBox, 检测到三次或更多次点击。
return


