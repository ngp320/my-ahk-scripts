#NoTrayIcon  ;不显示托盘图标
:?:ppic::            ; 【？号表示在单词中也会替换，e.g. Vnnow → V2019.....】
FormatTime, CurrentDateTime,, yyy-MM-dd-HHmm-.png
Send %CurrentDateTime%
return