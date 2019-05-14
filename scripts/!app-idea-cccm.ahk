#NoTrayIcon  ;不显示托盘图标
; 很好用的地方在于 , idea的Terminal输入cccm {空格}之后, 
; 就算鼠标焦点变了(切换窗口/虚拟桌面),也会继续输出到Termunal
; bug1: hotstring没有停止的时候, 不能用鼠标输入,不然 脚本会中途停止
; bug2: 鼠标焦点要离开Terminal,不然, 按ctrl+win+{Right}的时候,会锁屏
::cccm::
(
cd  D:\IDEA-demo\myweb\myweb-commons
mvn clean install  
cd  D:\IDEA-demo\myweb\myweb-commons-consumer
mvn clean install  
cd  D:\IDEA-demo\myweb\myweb-commons-domain
mvn clean install  
cd  D:\IDEA-demo\myweb\myweb-commons-mapper
mvn clean install  
cd  D:\IDEA-demo\myweb\myweb-commons-service
mvn clean install  
cd  D:\IDEA-demo\myweb\myweb-database
mvn clean install  
cd  D:\IDEA-demo\myweb\myweb-dependencies
mvn clean install  
cd  D:\IDEA-demo\myweb\myweb-external-skywalking
mvn clean install  
cd  D:\IDEA-demo\myweb\myweb-service-consumer-item
mvn clean install  
cd  D:\IDEA-demo\myweb\myweb-service-email
mvn clean install  
cd  D:\IDEA-demo\myweb\myweb-service-gateway
mvn clean install  
cd  D:\IDEA-demo\myweb\myweb-service-provider-item
mvn clean install  
cd  D:\IDEA-demo\myweb\myweb-service-reg
mvn clean install  

idea-ahk 自动输入 mvn clean install 打包完毕
)