#NoTrayIcon  ;����ʾ����ͼ��

;======���������µ�AHK���ýű���ԭ���Ǻܶ���AHKҲû�ö�á����в�ǡ��֮���������ߴͽ̡�========
;===�ҵĽű�����:  https://pan.baidu.com/s/1ceTunj-CzTeAayasLNr2YQ  ����: 30e0
;============================������������==================================
; ! ��  [Alt]        ; ! ����� Alt   �� l
; # ��  [win]        ; # ��           windows��ʼͼ��
; ^ ��  [Ctrl]       ; ^ ����� Ctrl  �� ��C
; + ��  [Shift]      ; + ����� Shift �� f����

; p.s. �������� ahk�ű� ��  �Ѷ�Ӧ�ű��ġ���ݷ�ʽ���ŵ���
; C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\   �����ɡ�

;================================���������=================================================
;����cmd������Խ������������������
;chcp 936 

;������������������ʹ�á����С�ʵ�� �����Ρ�����Ч���᡾���ֹ����ܼ����������Ķ����鲻�á������⡣

;===============================������������==============================================



;��or�л�Everything	
;�����Win10����ƻ����񣬲���ʾUAC(�û��˻�����)����ȡ��Everything�ĺ�̨����

!^f::
Run, "C:\Users\NGP\Desktop\��ݷ�ʽ\Everything.lnk"
return  

::cccmmmccc::
(
cd D:\IDEA-demo\myweb\myweb-commons
mvn clean install
cd D:\IDEA-demo\myweb\myweb-commons-domain
mvn clean install
cd D:\IDEA-demo\myweb\myweb-commons-mapper
mvn clean install
cd D:\IDEA-demo\myweb\myweb-commons-service
mvn clean install
cd D:\IDEA-demo\myweb\myweb-database
mvn clean install
cd D:\IDEA-demo\myweb\myweb-dependencies
mvn clean install
cd D:\IDEA-demo\myweb\myweb-external-skywalking
mvn clean install
cd D:\IDEA-demo\myweb\myweb-service-reg
mvn clean install
)


;###############################�������ݾ���ע�͡�ע�͡�#############################################
