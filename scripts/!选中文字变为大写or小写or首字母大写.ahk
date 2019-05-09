f7::SwitchSelCase("L") ; 选中文字切换为小写
f8::SwitchSelCase("U") ; 选中文字切换为大写
f9::SwitchSelCase("T") ; 选中文字切换为首字母大写

; 功能: 切换选中文字大小写
; 参数: Mode - 可以为 L (小写)、U (大写)、T (首字母大写)
;~ 兼容autohotkey 2.0
SwitchSelCase(Mode) {
	clipBak := ClipboardAll ; 备份剪贴板
	Clipboard := "" ; 清空剪贴板

	Send, ^c ; 发送 ctrl+c 复制选中文字
	ClipWait, 1 ; 等待复制完毕
	selText := Clipboard

	if (selText != "") {
		Clipboard := ""
		Clipboard := Format("{:" Mode "}", selText)
		ClipWait, 1
		Send, ^v
		Sleep, 500 ; 防止没有粘贴完毕剪贴板就被恢复了
	}

	Clipboard := clipBak ; 恢复剪贴板
}