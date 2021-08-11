;===============================默认功能区1: 键盘锁定区==========================================
#NoTrayIcon  ;不显示托盘图标



; 屏蔽 右侧的Alt 右侧的Ctrl 并分别改为 Home 和 End
RAlt::
{
	Send {Home}
	return
}

RCtrl::
{
	Send {End}
	return
}