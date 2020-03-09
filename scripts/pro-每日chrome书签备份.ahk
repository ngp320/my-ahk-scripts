#NoTrayIcon  ;不显示托盘图标

FormatTime, CurrentDateTime,, yyy-MM-dd_HH-mm-ss  
FileCreateDir, F:\0Software\chrome_bookmarks_backup
FileCopy, C:\Users\ngp\AppData\Local\Google\Chrome\User Data\Default\Bookmarks, F:\0Software\chrome_bookmarks_backup\%CurrentDateTime%-Bookmarks_backup, 0
return
