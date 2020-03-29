; #NoTrayIcon
;(解释)不显示拖盘.由于这个文件基本没有界面,也不显示拖盘.所以关闭要在进程中关.可以你们取消这命令

;time
;(解释)程序中的注释,要以 " ; " 号开头.

a=0
b=0
c=0
d=0
e=0
;(解释)定义了5个字母并附值为0

CustomColor = EEAA99
;(解释)定义CustomColor的值为EEAA99.EEAA99是颜色.

Gui, +AlwaysOnTop +LastFound +Owner
;(解释)AlwaysOnTop总是显示在最高层.LastFound不在标题栏上显示程序名字.+Owner不显示在任务栏上.

Gui, Color, %CustomColor%
;(解释)窗口的颜色为%CustomColor%,%CustomColor%为变量就是上面的EEAA99，但是上一步已经将窗透明,所以这里的颜色随便什么都可以.

Gui, Font, s10
;(解释)创建字体,大小为s10.s为Size的意思,s10就是设置文字大小.

Gui, Add, Text, vMyText cWhite, XXXXX YYYYY
;(解释)添加文本内容为XXXXX YYYYY.字体颜色为cWhite.cWhite是白色的意思.文字颜色还有cRed,cBlue等.vMyText定于的变量.下面引用应该把v去掉为%MyText%.

WinSet, TransColor, %CustomColor% 150
;(解释)将颜色%CustomColor%(EEAA99)透明为150.值为0-255

Gui, -Caption
;(解释)-Caption不显示程序标题等界面边界.默认为+Caption.

SetTimer, UpdateOSD, 1000
;(解释)1000毫秒后重复执行.1000毫秒为1秒.

Gosub, UpdateOSD
;(解释)Gosub和Goto命令差不多.只不过这个命令遇到Retuen后返回.

Gui, Show, x470 y0
;(解释)显示界面的位置.我这里设置的位置在桌面的中间最上方.

return
;(解释)不解释了.

UpdateOSD:
e++
if e=10
{
    e=0
    d++
    if d=6
    {
        e=0
        d=0
        c++
        if c=10
        {
            c=0
            d=0
            e=0
            b++
        }
        if b=6
        {
            b=0
            c=0
            d=0
            e=0
            a++
        }
    }
}
GuiControl,, MyText, %a%:%b%%c%:%d%%e%
return
;(解释)上面一段为时间算法.具体为:由于SetTimer为每一秒更新一次.所以每执行一次.秒为就加1.比如0:00:00 第一次秒位上加1当到
; 10后就为0,同时十秒位为1.当10秒位为6的时候,十秒位与秒位变0同时分位变为1.当分位变10的时候.分位、十秒位、秒位为0,十分位变1。当
; 十分位为6的时候,十分位、分位、十秒位、秒位变0，时位为1。变成1小时.1:00:00

;(解释)GuiControl,, MyText, %a%:%b%%c%:%d%%e% 把变量abcde的值传递给MyText.